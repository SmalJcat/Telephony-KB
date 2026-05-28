from __future__ import annotations

import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]

ARCHIVED_ENTRIES: dict[str, str] = {}


def split_frontmatter(text: str) -> tuple[list[str], str]:
    match = re.match(r"(?s)^---\r?\n(.*?)\r?\n---\r?\n?", text)
    if not match:
        raise ValueError("missing frontmatter")
    frontmatter = match.group(1).splitlines()
    return frontmatter, text[match.end() :]


def field_value(frontmatter: list[str], key: str) -> str:
    prefix = f"{key}:"
    for line in frontmatter:
        if line.startswith(prefix):
            return line[len(prefix) :].strip().strip('"').strip("'")
    return ""


def set_field(frontmatter: list[str], key: str, value: str) -> None:
    prefix = f"{key}:"
    for index, line in enumerate(frontmatter):
        if line.startswith(prefix):
            frontmatter[index] = f"{key}: {value}"
            return
    frontmatter.append(f"{key}: {value}")


def write_doc(path: Path, frontmatter: list[str], body: str) -> None:
    path.write_text("---\n" + "\n".join(frontmatter) + "\n---\n\n" + body.lstrip("\n"), encoding="utf-8", newline="\n")


def insert_after_h1(body: str, marker: str, block: str) -> str:
    if marker in body:
        return body
    body = body.replace("\ufeff#", "#", 1)
    match = re.search(r"(?m)^#\s+.+$", body)
    if not match:
        return block.strip() + "\n\n" + body
    insert_at = match.end()
    return body[:insert_at] + "\n\n" + block.strip() + "\n" + body[insert_at:]


def normalize_existing_boundary_position(body: str, start_marker: str, end_marker: str) -> str:
    if start_marker not in body:
        return body.replace("\ufeff#", "#", 1)

    pattern = re.compile(rf"\n?{re.escape(start_marker)}.*?{re.escape(end_marker)}\n*", re.S)
    block_match = pattern.search(body)
    h1_match = re.search(r"(?m)^\ufeff?#\s+.+$", body)
    if not block_match or not h1_match:
        return body.replace("\ufeff#", "#", 1)
    if block_match.start() > h1_match.start():
        return body.replace("\ufeff#", "#", 1)

    block = block_match.group(0).strip() + "\n"
    body_without_block = body[: block_match.start()] + body[block_match.end() :]
    body_without_block = body_without_block.lstrip("\n").replace("\ufeff#", "#", 1)
    h1_match = re.search(r"(?m)^#\s+.+$", body_without_block)
    if not h1_match:
        return block + "\n" + body_without_block
    insert_at = h1_match.end()
    return body_without_block[:insert_at] + "\n\n" + block + body_without_block[insert_at:].lstrip("\n")


def ensure_case_boundary(body: str) -> str:
    body = normalize_existing_boundary_position(
        body,
        "<!-- IMPORTED_CASE_BOUNDARY_START -->",
        "<!-- IMPORTED_CASE_BOUNDARY_END -->",
    )
    body = insert_after_h1(
        body,
        "<!-- IMPORTED_CASE_BOUNDARY_START -->",
        """<!-- IMPORTED_CASE_BOUNDARY_START -->
> 使用口径：本页已整理出可复用 Case 卡片。排查时优先看“用户现象 / 结论 / 关键证据 / 定位口径”；“原始案例内容”只用于回溯来源，不作为单独结论引用。
<!-- IMPORTED_CASE_BOUNDARY_END -->""",
    )
    if "## 原始案例内容" in body and "## 原始资料边界" not in body:
        boundary = """## 原始资料边界

- 原始内容保留用于回溯旧知识库、日志片段和历史结论。
- 如原始描述与前文 Case 卡片冲突，默认以前文“结论 / 关键证据 / 定位口径”为阅读入口。
- 复用到新问题时必须重新核对平台、版本、运营商、log 和第一坏点。

"""
        body = body.replace("\n## 原始案例内容", "\n" + boundary + "## 原始案例内容", 1)
    return body


def ensure_reference_boundary(body: str) -> str:
    body = normalize_existing_boundary_position(
        body,
        "<!-- REFERENCE_ONLY_BOUNDARY_START -->",
        "<!-- REFERENCE_ONLY_BOUNDARY_END -->",
    )
    return insert_after_h1(
        body,
        "<!-- REFERENCE_ONLY_BOUNDARY_START -->",
        """<!-- REFERENCE_ONLY_BOUNDARY_START -->
## 使用边界

- 本页是字段表、参数表或外部片段，只用于查字段、查来源、做关键词回溯。
- 不作为流程结论、配置生效结论或真实问题第一坏点引用。
- 需要判断问题时，先回到对应主文档、排障流程或 Case。
<!-- REFERENCE_ONLY_BOUNDARY_END -->""",
    )


def ensure_archived_boundary(body: str, target: str) -> str:
    body = normalize_existing_boundary_position(
        body,
        "<!-- ARCHIVED_ENTRY_BOUNDARY_START -->",
        "<!-- ARCHIVED_ENTRY_BOUNDARY_END -->",
    )
    return insert_after_h1(
        body,
        "<!-- ARCHIVED_ENTRY_BOUNDARY_START -->",
        f"""<!-- ARCHIVED_ENTRY_BOUNDARY_START -->
## 归档说明

- 本页是旧入口、拆分说明或迁移页，保留用于回溯来源和跳转。
- 默认阅读入口：{target}。
- 新内容不要继续追加到本页，应写入对应主流程、配置、排障或 Case。
<!-- ARCHIVED_ENTRY_BOUNDARY_END -->""",
    )


def ensure_supplemental_boundary(body: str) -> str:
    body = normalize_existing_boundary_position(
        body,
        "<!-- SUPPLEMENTAL_BOUNDARY_START -->",
        "<!-- SUPPLEMENTAL_BOUNDARY_END -->",
    )
    return insert_after_h1(
        body,
        "<!-- SUPPLEMENTAL_BOUNDARY_START -->",
        """<!-- SUPPLEMENTAL_BOUNDARY_START -->
## 使用边界

- 本页是补充资料或短专题，适合查局部步骤、旧来源和零散技巧。
- 若需要直接定位问题，优先回到对应主流程、配置方法、排障流程或 Case。
- 后续新增结论应沉淀到主文档，本页只保留来源和辅助说明。
<!-- SUPPLEMENTAL_BOUNDARY_END -->""",
    )


def should_be_supplemental(rel: str, doc_type: str, quality: str, lines: int) -> bool:
    if quality != "imported_reference":
        return False
    if doc_type in {"case", "index", "reference"}:
        return False
    if "/References/" in rel:
        return False
    if rel in ARCHIVED_ENTRIES:
        return False
    return lines < 180


def main() -> None:
    counts = {
        "case_summary": 0,
        "main_entry": 0,
        "reference_only": 0,
        "archived_entry": 0,
        "supplemental": 0,
        "changed": 0,
    }

    for path in sorted(ROOT.rglob("*.md")):
        rel = path.relative_to(ROOT).as_posix()
        original = path.read_text(encoding="utf-8-sig")
        try:
            frontmatter, body = split_frontmatter(original)
        except ValueError:
            continue

        before = "---\n" + "\n".join(frontmatter) + "\n---\n\n" + body.lstrip("\n")
        doc_type = field_value(frontmatter, "doc_type")
        quality = field_value(frontmatter, "quality")
        lines = original.count("\n") + 1

        if doc_type == "case" and quality == "imported_reference":
            set_field(frontmatter, "search_tier", "case_summary")
            body = ensure_case_boundary(body)
            counts["case_summary"] += 1

        if doc_type == "index" and quality == "imported_reference":
            set_field(frontmatter, "quality", "curated")
            set_field(frontmatter, "search_tier", "main_entry")
            body = body.replace(
                "- 本文是迁入/补充资料，先按本节入口定位，再看正文和来源记录。",
                "- 本页是当前目录入口，优先按表格进入已整理主题；来源记录只用于回溯。",
            )
            counts["main_entry"] += 1

        if "/References/" in rel or rel == "40_Case-Library/IMS/2026-05-27_BEEONE_External-Cases_Summary.md":
            set_field(frontmatter, "search_tier", "reference_only")
            body = ensure_reference_boundary(body)
            counts["reference_only"] += 1

        if rel in ARCHIVED_ENTRIES:
            set_field(frontmatter, "status", "archived")
            set_field(frontmatter, "search_tier", "archived_entry")
            body = ensure_archived_boundary(body, ARCHIVED_ENTRIES[rel])
            counts["archived_entry"] += 1

        if should_be_supplemental(rel, doc_type, quality, lines):
            set_field(frontmatter, "search_tier", "supplemental")
            body = ensure_supplemental_boundary(body)
            counts["supplemental"] += 1

        after = "---\n" + "\n".join(frontmatter) + "\n---\n\n" + body.lstrip("\n")
        if after != before:
            write_doc(path, frontmatter, body)
            counts["changed"] += 1

    for key, value in counts.items():
        print(f"{key}: {value}")


if __name__ == "__main__":
    main()

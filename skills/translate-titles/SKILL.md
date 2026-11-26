---
name: translate-titles
description: >-
  Batch-translate existing English Antigravity conversation titles into Chinese,
  preview English titles before renaming, translate a specific conversation's
  title, or inspect the zh-conversation-title auto-translation hook logs and
  status.
---

# 对话标题汉化工具 (`translate-titles`)

本 Skill 随全局插件 `zh-conversation-title` 提供。新对话的英文标题已由插件的生命周期 Hook 在后台自动静默汉化；当用户需要**批量汉化历史英文标题**、**预览待翻译列表**、**单独翻译某条对话**或**查看自动翻译日志**时，使用以下脚本命令。

脚本路径：`~/.gemini/config/plugins/zh-conversation-title/scripts/translate_title.py`

## 常用操作

### 1. 预览哪些历史对话标题还是英文（不修改）

```bash
python3 ~/.gemini/config/plugins/zh-conversation-title/scripts/translate_title.py --batch --dry-run
```

可选参数：
- `--limit <N>`：最多扫描条数（默认 `200`）
- `--include-archived`：包含已归档对话
- `--project-id <id>`：仅扫描指定项目（当前项目可用 `"$ANTIGRAVITY_PROJECT_ID"`）

### 2. 批量把所有英文历史对话标题翻译成中文

```bash
python3 ~/.gemini/config/plugins/zh-conversation-title/scripts/translate_title.py --batch
```

### 3. 翻译单条指定对话的标题

```bash
python3 ~/.gemini/config/plugins/zh-conversation-title/scripts/translate_title.py --conversation-id "<conversation-id>"
```

### 4. 查看自动汉化插件状态与最近日志

```bash
python3 ~/.gemini/config/plugins/zh-conversation-title/scripts/translate_title.py --status
```

## 输出说明

所有命令均输出 JSON。向用户汇报时，请用简洁的 Markdown 表格展示原英文标题与翻译后的中文标题对照（以及跳过/失败统计）。

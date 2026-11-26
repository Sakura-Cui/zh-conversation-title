# zh-conversation-title（对话标题自动汉化插件）

自动检测 Antigravity 左侧会话列表中由英文生成的对话标题，并在后台静默翻译为中文，同时附带批量汉化历史英文对话标题的能力。

## 工作原理

1. **生命周期 Hook 自动触发（`hooks.json`）**
   - 监听 `SessionStart` 事件：新对话创建时自动生效。
   - 若 Hook 环境可直接访问本地 `ConversationService`，则直接静默拉起后台监听进程；否则在首轮静默触发一次轻量的 `--ensure-current` 启动后台监听（耗时 <50ms，不打断回复）。
   - 后台监听进程持续检测当前对话的 `annotations.title`，一旦出现不含中文字符的英文标题，即调用免 Key 的 Google 翻译接口（含自动重试）将其翻译为中文，并通过 `ConversationService/UpdateConversation` 实时写回左侧对话列表。
   - 已是中文或已处理过的对话会记录到本地缓存，不再重复处理，也不会覆盖你后续手动修改的标题。
   - 自动跳过子代理（subagent）内部会话。

2. **批量汉化历史对话（Skill：`translate-titles`）**
   - 直接对 Agent 说：“把所有历史英文对话标题批量翻译成中文” 或 “先预览哪些历史对话标题还是英文”。
   - 也可以在终端手动运行：
     ```bash
     # 预览（不修改）
     python3 ~/.gemini/config/plugins/zh-conversation-title/scripts/translate_title.py --batch --dry-run

     # 正式批量汉化
     python3 ~/.gemini/config/plugins/zh-conversation-title/scripts/translate_title.py --batch

     # 查看运行状态与日志
     python3 ~/.gemini/config/plugins/zh-conversation-title/scripts/translate_title.py --status
     ```

## 目录结构

```text
zh-conversation-title/
├── plugin.json
├── hooks.json
├── README.md
├── assets/
│   └── logo.svg
├── scripts/
│   └── translate_title.py
└── skills/
    └── translate-titles/
        └── SKILL.md
```

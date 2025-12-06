# Step 4: Autopilot TDD & MCP Integration

## Objective
Learn how to use Taskmaster's **Autopilot** feature for Test-Driven Development (TDD) and manage tasks directly from your editor using **MCP** (Model Context Protocol).

## 🤖 AI-Driven Workflow

Unlike previous steps where you ran CLI commands, **Autopilot is designed to be driven by your AI assistant** (Cursor, VS Code, etc.).

Instead of typing commands, you will **ask the AI** to perform actions.

## Part A: Autopilot TDD

Autopilot automates the TDD cycle: **RED** (Write failing test) → **GREEN** (Make it pass) → **REFACTOR** → **COMMIT**.

### 1. Select a Task
First, make sure you have a pending task.
```bash
task-master list --status pending
```

### 2. Start Autopilot
**👉 Action:** Ask your AI assistant (Chat):
> "Start autopilot for task <id>"

**What happens:**
- The AI uses the `autopilot_start` tool
- A new git branch is created
- The TDD workflow initializes

### 3. Follow the Workflow
The AI will guide you through the phases.

**👉 Action:** Ask your AI assistant:
> "What is the next step?" or "Get autopilot status"

**Phase 1: RED (Write Test)**
- The AI will ask you to write a test or write it for you.
- Run the test to confirm it fails.
- **👉 Action:** Tell the AI: "I completed the RED phase. Here are the results: 1 test total, 1 failed."

**Phase 2: GREEN (Implement)**
- Implement the code to pass the test.
- Run the test to confirm it passes.
- **👉 Action:** Tell the AI: "I completed the GREEN phase. All tests passed."

### 4. Commit Changes
**👉 Action:** Ask your AI assistant:
> "Commit changes for this task"

The AI will use `autopilot_commit` to create a commit with metadata.

### 5. Finalize
**👉 Action:** Ask your AI assistant:
> "Finalize the autopilot workflow"

This marks the task as done and cleans up.

---

## Part B: Managing Tasks with MCP

Your editor (Cursor) is connected to Taskmaster via MCP. This means you can manage tasks naturally during your conversation.

### Examples of what you can say:

- **"List my pending tasks"**
  - AI calls `get_tasks` and shows you the list.

- **"Create a task to fix the login bug"**
  - AI calls `add_task` with your description.

- **"Mark task 5 as done"**
  - AI calls `set_task_status`.

- **"Research best practices for React hooks"**
  - AI calls `research` and uses the findings to help you.

### Try it now!
Open your AI chat and try managing your project without touching the terminal.

---

## 🔄 Handling Interruptions

If you need to stop or resume:

- **Resume:** Ask "Resume autopilot workflow"
- **Abort:** Ask "Abort autopilot" (keeps code, resets state)

## 🎉 Success Indicators

You've completed this step when you have:
- [ ] Started autopilot via AI chat
- [ ] Completed a TDD cycle (Red/Green)
- [ ] Committed changes via AI
- [ ] Managed tasks using natural language

## 🎊 Congratulations!

You've completed the Taskmaster Kata session! You now know how to:
1. **Initialize & Parse:** Turn PRDs into tasks
2. **Manage:** Organize with tags and dependencies
3. **Execute:** Use Autopilot for guided TDD
4. **Integrate:** Work seamlessly with MCP

**Happy Coding! 🚀**

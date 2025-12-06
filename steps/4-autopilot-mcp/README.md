# Step 4: Autopilot TDD & MCP Integration

## Objective
Complete tasks using Taskmaster's autopilot TDD workflow and learn how to manage tasks via MCP (Model Context Protocol) in your editor.

## 🎯 What You'll Learn

- **Autopilot TDD:** Complete tasks using Test-Driven Development workflow
- **MCP Integration:** Manage tasks directly from your editor (Cursor, VS Code, etc.)
- **Workflow Management:** Handle interruptions, resume work, and track progress

## Part A: Autopilot TDD Workflow

### 1. Select a Task for Autopilot

**Find a suitable task:**
```bash
# List pending tasks
task-master list --status pending

# Or find the next task to work on
task-master next-task
```

**Choose a simple task** for your first autopilot run (e.g., "Set up project structure", "Create API endpoint", "Add validation").

**✅ Checkpoint:** You have a task ID ready for autopilot!

---

### 2. Start Autopilot

```bash
task-master autopilot-start --task-id=<task-id>
```

**What happens:**
- Creates a git branch for the task
- Initializes TDD workflow state
- Sets up the RED → GREEN → REFACTOR → COMMIT cycle

**✅ Checkpoint:** Autopilot is initialized and ready!

---

### 3. Check Autopilot Status

```bash
task-master autopilot-status
```

**What you'll see:**
- Current phase (RED, GREEN, REFACTOR, COMMIT)
- Current subtask
- Progress information
- Activity history

**💡 Tip:** Run this command anytime to see where you are in the workflow.

**✅ Checkpoint:** You can see autopilot status!

---

### 4. Get Next Action

```bash
task-master autopilot-next
```

**What you'll see:**
- Detailed instructions for the current phase
- What to do next
- Expected outcomes

**Follow the instructions** provided by autopilot.

**✅ Checkpoint:** You have clear instructions for the next step!

---

### 5. Complete RED Phase (Write Failing Tests)

**Follow autopilot instructions:**
- Write tests that define the desired behavior
- Make sure tests fail (they should - you haven't implemented yet!)

**Complete the phase:**
```bash
task-master autopilot-complete-phase --test-results='{"total":3,"passed":0,"failed":3}'
```

**Replace the numbers** with your actual test results:
- `total`: Total number of tests
- `passed`: Tests that passed (should be 0 in RED phase)
- `failed`: Tests that failed (should match total in RED phase)

**✅ Checkpoint:** RED phase complete - you have failing tests!

---

### 6. Complete GREEN Phase (Make Tests Pass)

**Follow autopilot instructions:**
- Implement the minimum code to make tests pass
- Run tests to verify they pass

**Complete the phase:**
```bash
task-master autopilot-complete-phase --test-results='{"total":3,"passed":3,"failed":0}'
```

**Replace the numbers** with your actual test results:
- `total`: Total number of tests
- `passed`: Tests that passed (should match total in GREEN phase)
- `failed`: Tests that failed (should be 0 in GREEN phase)

**✅ Checkpoint:** GREEN phase complete - all tests pass!

---

### 7. Commit Changes

```bash
task-master autopilot-commit
```

**What happens:**
- Stages all changes
- Creates a commit with an appropriate message
- Embeds task metadata in the commit

**✅ Checkpoint:** Changes are committed!

---

### 8. Finalize Workflow

```bash
task-master autopilot-finalize
```

**What happens:**
- Validates all changes are committed
- Marks the task as complete
- Cleans up workflow state

**✅ Checkpoint:** Task completed via autopilot!

---

## Part B: MCP Integration

### What is MCP?

MCP (Model Context Protocol) allows your editor (Cursor, VS Code, etc.) to interact with Taskmaster directly. You can manage tasks without leaving your editor!

### 1. Verify MCP is Available

MCP is automatically configured when you install `task-master-ai`. The MCP server runs when you use `task-master-ai` command.

**Test MCP connection:**
```bash
task-master-ai --help
# This starts the MCP server (you'll see MCP server messages)
```

**✅ Checkpoint:** MCP server is available!

---

### 2. Use MCP in Your Editor

**In Cursor/VS Code:**
- Open the chat/command palette
- Ask: "List my tasks", "Show task details for ID X", "Create a new task"
- The AI assistant can interact with Taskmaster via MCP

**Example interactions:**
- "What tasks do I have?"
- "Show me details for task 1"
- "Create a task for implementing user authentication"
- "What's the status of my project?"
- "Which tasks are ready to work on?"

**💡 Try this:**
- Open your editor
- Ask the AI assistant about your tasks
- Create a task via chat
- View task details through the editor

**✅ Checkpoint:** You can manage tasks from your editor!

---

### 3. MCP Workflow Patterns

**Pattern: Task Creation from Code Comments**
- Comment in code: `// TODO: Add error handling`
- Ask AI: "Create a task from this TODO comment"
- Task is created automatically

**Pattern: Context-Aware Task Management**
- AI sees your current code
- Asks: "Should I create a task for this refactoring?"
- Creates task with proper context

**Pattern: Status Updates**
- Complete a feature
- Ask AI: "Mark task X as done"
- Status updated automatically

**💡 Try this:**
- Work on code
- Use AI chat to create tasks based on what you're doing
- Update task status as you progress

**✅ Checkpoint:** You're using MCP for task management!

---

## 🔄 Handling Interruptions

### Resume Autopilot

If autopilot was interrupted:

```bash
task-master autopilot-resume
```

This restores the workflow state and continues from where you left off.

### Check Status After Interruption

```bash
task-master autopilot-status
```

See where you were and what's next.

### Abort Autopilot

If you need to stop autopilot:

```bash
task-master autopilot-abort
```

**Note:** This removes workflow state but keeps your code changes and git branch.

---

## 🎉 Success Indicators

You've successfully completed this step when:

- [ ] Started autopilot for a task
- [ ] Completed RED phase (failing tests written)
- [ ] Completed GREEN phase (tests passing)
- [ ] Committed changes via autopilot
- [ ] Finalized autopilot workflow
- [ ] Used MCP to manage tasks from editor
- [ ] Created/updated tasks via editor chat

## 💡 Key Takeaways

1. **TDD workflow is automated:** Autopilot guides you through RED → GREEN → REFACTOR → COMMIT
2. **No context switching:** Manage tasks from your editor via MCP
3. **Interruptions handled:** Resume work easily after breaks
4. **Git integration:** Commits are created automatically with proper messages

## 🔍 Troubleshooting

### Autopilot stuck
- Check status: `task-master autopilot-status`
- Resume: `task-master autopilot-resume`
- Abort if needed: `task-master autopilot-abort`

### MCP not working
- Verify `task-master-ai` command works
- Check editor MCP configuration
- Restart editor if needed

### Test results format
- Use JSON format: `{"total":N,"passed":N,"failed":N}`
- Numbers must match your actual test results
- Use single quotes around JSON in bash

## 🎊 Congratulations!

You've completed the Taskmaster Kata session! You now know how to:

- ✅ Transform PRDs into actionable tasks
- ✅ Explore and manage tasks effectively
- ✅ Use advanced features (dependencies, tags, research)
- ✅ Complete tasks with autopilot TDD workflow
- ✅ Manage tasks from your editor via MCP

## Next Steps

- **Practice:** Try the scenarios in `PRACTICE-SCENARIOS.md`
- **Integrate:** Use Taskmaster in your real projects
- **Explore:** Experiment with different AI models
- **Share:** Tell others about your experience!

---

**Happy Coding! 🚀**

*Remember: The goal is not to finish quickly, but to practice deliberately and learn deeply.*


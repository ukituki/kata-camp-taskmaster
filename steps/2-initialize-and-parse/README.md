# Step 2: Initialize Taskmaster & Parse PRD

## Objective
Install Taskmaster, initialize your project, parse your PRD into tasks, and explore the generated tasks. This step gives you immediate value by transforming your PRD into actionable tasks.

## 🎯 Quick Value Preview

By the end of this step, you'll have:
- ✅ Taskmaster installed and configured
- ✅ Your PRD automatically converted into a structured task list
- ✅ Tasks organized with dependencies and priorities
- ✅ A clear view of what needs to be built

## Tasks

### 1. Install Taskmaster

```bash
npm install -g task-master-ai
```

**Verify installation:**
```bash
which task-master
# Should show: /usr/local/bin/task-master (or similar)
```

**✅ Checkpoint:** If you see a path, installation is successful!

---

### 2. Navigate to Project Root

```bash
# Make sure you're in the project root (where .env.example is located)
cd /path/to/kata-camp-taskmaster

# Verify you're in the right place
ls .env.example
```

**✅ Checkpoint:** If you see `.env.example`, you're in the right directory!

---

### 3. Initialize Taskmaster

```bash
task-master init
```

This creates:
- `.taskmaster/` directory with configuration
- Initial project structure
- Ready for your first tasks

**✅ Checkpoint:** Check that `.taskmaster/` directory was created:
```bash
ls -la .taskmaster
```

**💡 Tip:** If you get an error, make sure you're in the project root and have write permissions.

---

### 4. See Available Commands

You can always see all available Taskmaster commands and help options by running:

```bash
task-master --help
```

This lists all top-level commands like `init`, `parse-prd`, `models`, etc.  
For help with a specific command, use:

```bash
task-master <command> --help
```

For example, to see all options for working with models:

```bash
task-master models --help
```

Use these help commands anytime you're unsure of usage or flags!

**✅ Checkpoint:** Your models should be configured. If you see API key errors, check your `.env` file.

---

### 5. Parse Your PRD into Tasks 🚀

**This is where the magic happens!** Transform your PRD into actionable tasks:

```bash
task-master parse-prd --input steps/1-prd/my-prd.md
```

**What happens:**
- AI analyzes your PRD
- Generates structured tasks with descriptions
- Automatically creates dependencies
- Organizes tasks by feature/component
- Creates a "master" tag for your project

**⏱️ This may take 1-2 minutes** - Taskmaster is analyzing your PRD and generating intelligent tasks!

**✅ Checkpoint:** You should see output like:
```
✓ PRD parsed successfully
✓ Generated 15 tasks
✓ Created dependencies
```

---

### 6. Explore Your Generated Tasks

**List all tasks:**
```bash
task-master list
```

**What you'll see:**
- Task IDs
- Titles and descriptions
- Status (pending, in-progress, done)
- Dependencies
- Tags

**✅ Checkpoint:** You should see multiple tasks from your PRD!

---

### 7. View Task Details

Pick a task ID from the list and view its details:

```bash
task-master show <task-id>
```

**What you'll see:**
- Full task description
- Subtasks (if any)
- Dependencies (what this task depends on)
- Dependents (tasks that depend on this one)
- Status and metadata

**💡 Try this:** View 2-3 different tasks to see how they're structured.

**✅ Checkpoint:** You can see detailed information about individual tasks!

---

### 8. Expand a Complex Task

Some tasks might be too complex. Let's break one down:

```bash
# Find a complex task (usually one with a longer description)
task-master list

# Expand it into subtasks
task-master expand --id=<task-id>
```

**What happens:**
- AI analyzes the task
- Breaks it into smaller, actionable subtasks
- Maintains dependencies
- Keeps context from your PRD

**💡 Try this:** Expand a task that seems large or complex. Notice how it gets broken down intelligently.

**✅ Checkpoint:** Your complex task is now broken into manageable subtasks!

---

### 9. Verify Task Dependencies

Check that dependencies make sense:

```bash
task-master validate-dependencies
```

**What you'll see:**
- ✅ Valid dependencies (no issues)
- ⚠️ Warnings (if any circular dependencies or issues)

**✅ Checkpoint:** Dependencies should be valid (or you'll see clear warnings to fix).

---

## 🎉 Success Indicators

You've successfully completed this step when:

- [ ] Taskmaster installed (`which task-master` works)
- [ ] Project initialized (`.taskmaster/` directory exists)
- [ ] PRD parsed successfully (saw "Generated X tasks" message)
- [ ] Can list tasks (`task-master list` shows your tasks)
- [ ] Can view task details (`task-master get-task --id=<id>` works)
- [ ] Expanded at least one task (`task-master expand --id=<id>` worked)
- [ ] Dependencies validated (no errors from `validate-dependencies`)

## 💡 Key Takeaways

1. **PRD → Tasks is automatic:** Your PRD becomes actionable tasks in seconds
2. **Tasks are intelligent:** Dependencies and structure are created automatically
3. **Easy exploration:** Simple commands to view and understand your task list
4. **Expandable:** Complex tasks can be broken down further

## 🔍 Troubleshooting

### "No tasks.json file found"
- Make sure you ran `task-master init` first
- Verify you're in the project root

### "Tag 'master' not found"
- This should be created automatically when parsing PRD
- If it persists, try parsing the PRD again

### "API key errors"
- Check your `.env` file has valid API keys
- Run `task-master models` to verify configuration

### "Parse PRD failed"
- Check that `steps/1-prd/my-prd.md` exists
- Verify the PRD file is valid markdown
- Check your API keys are working

## Next Step

Now that you have tasks, let's explore **advanced features** like dependencies, tags, research, and task updates in [Step 3: Advanced Features](../3-advanced-features/README.md).


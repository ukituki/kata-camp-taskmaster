# Step 1: TM Basics - Install & Use Taskmaster CLI

## Objective
Install Taskmaster globally and learn the basic CLI commands for task management.

## Tasks

1. **Install Taskmaster globally:**
   ```bash
   npm install -g task-master-ai
   ```
   
   Verify installation:
   ```bash
   # Check if command is available (shows the installation path)
   which task-master
   # Or on Windows PowerShell:
   # where.exe task-master
   ```
   
   You should see a path like `/usr/local/bin/task-master` or similar if installation was successful.
   
   **Note:** The `task-master-ai` command is for MCP server integration. For CLI usage, always use `task-master`.

2. **Navigate to project root and initialize Taskmaster:**
   ```bash
   # Make sure you're in the project root (where .env.example is located)
   # If you're in steps/1-tm-basics folder, go to project root:
   cd ../..
   
   # Or if you're elsewhere, navigate to the kata-camp-taskmaster directory
   # cd /path/to/kata-camp-taskmaster
   
   # Verify you're in the right place (should show .env.example)
   ls .env.example
   
   # Initialize Taskmaster (creates .taskmaster directory in project root)
   task-master init
   ```
   
   **Important:** 
   - Use `task-master init` (not `task-master-ai init`)
   - Must be run from the project root directory
   - This creates a `.taskmaster` directory with configuration

3. **Check model configuration:**
   ```bash
   # Still in project root
   task-master models
   ```
   Verify your API keys are detected.

4. **Create your first task:**
   ```bash
   task-master add-task --prompt "Learn Taskmaster basics"
   ```
   Note the task ID that's returned.
   
   **Note:** If you get an error about "master" tag not found, you need to create tasks first. You can either:
   - Parse a PRD: `task-master parse-prd --input .taskmaster/docs/prd.txt` (creates master tag automatically)
   - Or manually create the tasks.json structure (see troubleshooting below)

5. **List all tasks:**
   ```bash
   task-master list
   ```
   Or use the shorter alias:
   ```bash
   task-master get-tasks  # Also works but 'list' is preferred
   ```

6. **Update task status:**
   ```bash
   task-master set-status --id=<task-id> --status=in-progress
   task-master set-status --id=<task-id> --status=done
   ```
   **Note:** Use `--status=` flag (not positional argument)

7. **Create and use tags:**
   ```bash
   # Create a tag (use positional argument, not --name flag)
   task-master add-tag kata-session
   # Or use the newer command (recommended):
   task-master tags add kata-session
   
   # Switch to tag context
   task-master use-tag kata-session
   # Or use the newer command (recommended):
   task-master tags use kata-session
   
   # List all tags
   task-master tags
   ```

8. **Task dependencies:**
   ```bash
   # Create a few related tasks
   task-master add-task --prompt "Task 1"
   task-master add-task --prompt "Task 2"
   
   # Establish a dependency (Task 2 depends on Task 1)
   task-master add-dependency --id=<task2-id> --depends-on=<task1-id>
   
   # Verify dependencies
   task-master validate-dependencies
   ```
   
   **Note:** Taskmaster AI can automatically suggest dependencies when creating tasks. You can also add them manually.

## Common Commands Reference

```bash
# Project Management
task-master init                       # Initialize Taskmaster in project root
task-master models                     # View/configure AI models

# Task Management
task-master add-task --prompt "Task title"  # Create a new task
task-master list                            # List all tasks (preferred)
task-master list --status pending          # Filter by status
task-master set-status --id=<id> --status=done  # Update task status

# Task Expansion
task-master expand --id=<id>               # Expand task into subtasks
task-master expand --all                  # Expand all pending tasks

# Dependencies
task-master add-dependency --id=<id> --depends-on=<dep-id>  # Add dependency
task-master validate-dependencies                           # Check for issues

# Tags (newer syntax recommended)
task-master tags                          # Show all tags
task-master tags add <name>               # Create new tag (recommended)
task-master tags use <name>               # Switch context (recommended)
# Legacy syntax (still works but deprecated):
task-master add-tag <name>                # Create new tag
task-master use-tag <name>                # Switch context

# Help
task-master --help                 # Show all available commands
```

**Note:** All commands use `task-master` (not `task-master-ai`). The `task-master-ai` command is for MCP server integration.

## Troubleshooting

### "Tag 'master' not found" Error

If you get an error saying the master tag doesn't exist when trying to add a task:

1. **Recommended:** Parse a PRD first (this automatically creates the master tag):
   ```bash
   # Create a simple PRD file
   echo "# My Project\n\n## Features\n- Feature 1" > .taskmaster/docs/my-prd.txt
   # Parse it to create tasks and master tag
   task-master parse-prd --input .taskmaster/docs/my-prd.txt
   ```

2. **Alternative:** The master tag should be created automatically when you first add a task or parse a PRD. If it's not working, ensure you're in the project root and that `.taskmaster/tasks/tasks.json` exists (it's created on first task creation).

## Success Criteria

- [ ] Taskmaster installed globally (`which task-master` shows the path)
- [ ] Taskmaster initialized successfully
- [ ] Created at least one task
- [ ] Updated task status
- [ ] Created and used a tag
- [ ] Created task dependencies

## Next Step

Once comfortable with basic commands, proceed to [Step 3: Parse PRD](../3-parse-prd/README.md) to convert your PRD into tasks.


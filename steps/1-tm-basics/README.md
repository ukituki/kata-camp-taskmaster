# Step 1: TM Basics - Use Taskmaster CLI

## Objective
Learn the basic CLI commands for task management. (Taskmaster should already be installed globally from Step 0)

## Tasks

1. **Initialize Taskmaster in your project:**
   ```bash
   task-master-ai init
   ```
   This creates a `.taskmaster` directory with configuration.

2. **Check model configuration:**
   ```bash
   task-master-ai models
   ```
   Verify your API keys are detected.

3. **Create your first task:**
   ```bash
   task-master-ai add-task --prompt "Learn Taskmaster basics"
   ```
   Note the task ID that's returned.

4. **List all tasks:**
   ```bash
   task-master-ai get-tasks
   ```

5. **Update task status:**
   ```bash
   task-master-ai set-task-status --id=<task-id> in-progress
   task-master-ai set-task-status --id=<task-id> done
   ```

6. **Create and use tags:**
   ```bash
   # Create a tag
   task-master-ai add-tag --name=kata-session
   
   # Switch to tag context
   task-master-ai use-tag --name=kata-session
   
   # List all tags
   task-master-ai list-tags
   ```

7. **Task dependencies:**
   ```bash
   # Create a few related tasks
   task-master-ai add-task --prompt "Task 1"
   task-master-ai add-task --prompt "Task 2"
   
   # Establish a dependency (Task 2 depends on Task 1)
   task-master-ai add-dependency --id=<task2-id> --depends-on=<task1-id>
   
   # Verify dependencies
   task-master-ai validate-dependencies
   ```

## Common Commands Reference

```bash
# Project Management
task-master-ai init                    # Initialize Taskmaster in project
task-master-ai models                  # View/configure AI models

# Task Management
task-master-ai add-task --prompt "Task title"  # Create a new task
task-master-ai get-tasks                        # List all tasks
task-master-ai get-tasks --status pending       # Filter by status
task-master-ai set-task-status --id=<id> done  # Update task status

# Task Expansion
task-master-ai expand-task --id=<id>           # Expand task into subtasks
task-master-ai expand-all                      # Expand all pending tasks

# Dependencies
task-master-ai add-dependency --id=<id> --depends-on=<dep-id>  # Add dependency
task-master-ai validate-dependencies                           # Check for issues

# Tags
task-master-ai list-tags               # Show all tags
task-master-ai add-tag --name=<name>   # Create new tag
task-master-ai use-tag --name=<name>  # Switch context

# Help
task-master-ai --help                 # Show all available commands
```

## Success Criteria

- [ ] Taskmaster initialized successfully
- [ ] Created at least one task
- [ ] Updated task status
- [ ] Created and used a tag
- [ ] Created task dependencies

## Next Step

Once comfortable with basic commands, proceed to [Step 2: Create PRD](../2-prd/README.md)


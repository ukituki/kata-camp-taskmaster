# Step 4: Task → Code - First Autopilot Task

## Objective
Complete your first task using Taskmaster's autopilot TDD workflow.

## Tasks

1. **Select a simple task:**
   ```bash
   task-master-ai get-tasks --status pending
   ```
   Choose a simple task to implement (e.g., "Set up project structure").

2. **Start autopilot:**
   ```bash
   task-master-ai autopilot-start --task-id=<task-id>
   ```
   This initializes the TDD workflow.

3. **Check autopilot status:**
   ```bash
   task-master-ai autopilot-status
   ```
   See the current phase and progress.

4. **Get next action:**
   ```bash
   task-master-ai autopilot-next
   ```
   Follow the instructions provided.

5. **Complete RED phase:**
   - Write failing tests as instructed
   - Complete the phase:
     ```bash
     task-master-ai autopilot-complete-phase --test-results='{"total":3,"passed":0,"failed":3}'
     ```

6. **Complete GREEN phase:**
   - Implement code to pass the tests
   - Complete the phase:
     ```bash
     task-master-ai autopilot-complete-phase --test-results='{"total":3,"passed":3,"failed":0}'
     ```

7. **Commit changes:**
   ```bash
   task-master-ai autopilot-commit
   ```
   This creates a git commit with an appropriate message.

8. **Finalize workflow:**
   ```bash
   task-master-ai autopilot-finalize
   ```
   Complete the autopilot workflow.

## TDD Workflow

The autopilot follows Test-Driven Development:
1. **RED**: Write failing tests
2. **GREEN**: Implement code to pass tests
3. **REFACTOR**: Improve code (if needed)
4. **COMMIT**: Save changes

## Success Criteria

- [ ] Started autopilot for a task
- [ ] Completed RED phase (failing tests)
- [ ] Completed GREEN phase (passing tests)
- [ ] Committed changes
- [ ] Finalized workflow

## Troubleshooting

### Issue: Autopilot stuck
- Check status with `task-master-ai autopilot-status`
- Resume with `task-master-ai autopilot-resume` if workflow was interrupted
- Abort if needed: `task-master-ai autopilot-abort`

### Issue: Circular dependencies
- Use `task-master-ai validate-dependencies` to check for issues
- Use `task-master-ai fix-dependencies` to automatically fix problems

## Congratulations! 🎉

You've completed the Taskmaster Kata session! You now know how to:
- Use Taskmaster CLI commands
- Create and manage tasks
- Parse PRDs into tasks
- Use autopilot for TDD workflows


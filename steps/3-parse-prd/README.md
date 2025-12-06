# Step 3: Plan → Tasks - Parse PRD

## Objective
Parse your PRD to automatically generate tasks in Taskmaster.

## Tasks

1. **Parse your PRD:**
   ```bash
   task-master parse-prd --input steps/1-prd/my-prd.md
   ```
   This will generate initial tasks based on your PRD.

2. **Review generated tasks:**
   ```bash
   task-master get-tasks
   ```
   See all the tasks that were created from your PRD.

3. **Expand a complex task:**
   ```bash
   # Find a task ID from the list
   task-master get-tasks
   
   # Expand it into subtasks
   task-master expand-task --id=<task-id>
   ```

4. **Check task dependencies:**
   ```bash
   task-master validate-dependencies
   ```
   Ensure there are no circular dependencies.

5. **View task details:**
   ```bash
   task-master get-task --id=<task-id>
   ```

6. **Expand complex tasks:**
   ```bash
   # Expand a task into subtasks
   task-master expand-task --id=<task-id>
   
   # Or expand with research for better results
   task-master expand-task --id=<task-id> --research
   ```

7. **Task updates with AI:**
   ```bash
   # Update a single task
   task-master update-task --id=<id> --prompt "Add authentication requirements"
   
   # Update multiple tasks
   task-master update --from=<id> --prompt "New requirements: ..."
   ```

## Tips

- Review the generated tasks and refine them if needed
- Use `expand-task` for complex features
- Use `--research` flag for research-backed task generation
- Organize tasks with tags if needed
- Set priorities if applicable

## Success Criteria

- [ ] PRD parsed successfully
- [ ] Tasks generated from PRD
- [ ] Reviewed and understood the task list
- [ ] Expanded at least one complex task

## Next Step

Once tasks are organized, proceed to [Step 4: Autopilot](../4-autopilot/README.md)


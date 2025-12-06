# Step 3: Advanced Taskmaster Features

## Objective
Master advanced Taskmaster features that make task management powerful and intelligent: dependencies, tags, AI research, complexity analysis, and task updates.

## 🎯 What You'll Learn

- **Dependencies:** Create and manage task dependencies intelligently
- **Tags:** Organize work across different contexts and teams
- **AI Research:** Use AI to research and inform your tasks
- **Complexity Analysis:** Understand and optimize task complexity
- **Task Updates:** Keep tasks in sync with changing requirements

## Tasks

### 1. Work with Dependencies

**View current dependencies:**
```bash
task-master list
# Notice the dependency indicators in the output
```

**Add a dependency manually:**
```bash
# Task 2 depends on Task 1
task-master add-dependency --id=<task2-id> --depends-on=<task1-id>
```

**Validate dependencies:**
```bash
task-master validate-dependencies
```

**Fix dependency issues automatically:**
```bash
task-master fix-dependencies
```

**💡 Try this:** 
- Find two related tasks
- Add a dependency between them
- View the task list again to see the relationship

**✅ Checkpoint:** You can see and manage task dependencies!

---

### 2. Organize with Tags

**List all tags:**
```bash
task-master tags
```

**Create a new tag:**
```bash
task-master tags add frontend
task-master tags add backend
task-master tags add testing
```

**Switch to a tag context:**
```bash
task-master tags use frontend
```

**View tasks in current tag:**
```bash
task-master list
# Now shows only tasks in the 'frontend' tag
```

**Add tasks to a specific tag:**
```bash
# When creating a task, it goes to the current tag
task-master add-task --prompt "Create login form"
```

**Switch back to master:**
```bash
task-master tags use master
task-master list
# Now shows all tasks
```

**💡 Try this:**
- Create tags for different areas (frontend, backend, docs)
- Switch between tags
- Notice how the task list changes
- Add tasks to different tags

**✅ Checkpoint:** You can organize tasks with tags and switch contexts!

---

### 3. AI-Powered Research

**Perform research with project context:**
```bash
task-master research --query "How to implement OAuth2 authentication in Node.js"
```

**Save research to a file:**
```bash
task-master research --query "Best practices for REST API design" --save-to-file --save-to=research/api-design.md
```

**Use research to inform task expansion:**
```bash
# Expand a task with research for better results
task-master expand --id=<task-id> --research
```

**💡 Try this:**
- Research a technical topic related to your PRD
- Save the research
- Use it to expand a related task
- Notice how research improves task quality

**✅ Checkpoint:** You can perform AI research and use it to improve tasks!

---

### 4. Analyze Task Complexity

**Analyze your project complexity:**
```bash
task-master analyze-project-complexity
```

**View the complexity report:**
```bash
task-master complexity-report
```

**What you'll see:**
- Tasks that are too complex (need breaking down)
- Tasks that are too simple (could be combined)
- Recommendations for optimization

**Scope down complex tasks:**
```bash
task-master scope-down-task --id=<complex-task-id>
```

**Scope up simple tasks:**
```bash
task-master scope-up-task --id=<simple-task-id>
```

**💡 Try this:**
- Run complexity analysis
- Review the recommendations
- Scope down one complex task
- Notice how it gets broken into better-sized pieces

**✅ Checkpoint:** You can analyze and optimize task complexity!

---

### 5. Update Tasks with AI

**Update a single task:**
```bash
task-master update-task --id=<task-id> --prompt "Add authentication requirements and error handling"
```

**Update multiple tasks at once:**
```bash
task-master update --from=<task-id> --prompt "New requirement: All endpoints must support rate limiting"
```

**💡 Try this:**
- Pick a task
- Update it with new requirements
- View the updated task to see changes

**✅ Checkpoint:** You can update tasks intelligently with AI!

---

### 6. Advanced Task Expansion

**Expand all pending tasks:**
```bash
task-master expand --all
```

**Expand with research:**
```bash
task-master expand --id=<task-id> --research
```

**Expand with custom prompt:**
```bash
task-master expand --id=<task-id> --prompt "Focus on security and performance"
```

**💡 Try this:**
- Expand a task with research
- Compare it to a regular expansion
- Notice the difference in quality and detail

**✅ Checkpoint:** You can expand tasks with advanced options!

---

### 7. Task Status Management

**Filter tasks by status:**
```bash
task-master list --status pending
task-master list --status in-progress
task-master list --status done
```

**Update task status:**
```bash
task-master set-status --id=<task-id> --status=in-progress
task-master set-status --id=<task-id> --status=done
```

**Find next task to work on:**
```bash
task-master next-task
```

**💡 Try this:**
- Filter tasks by status
- Mark a task as in-progress
- Use `next-task` to find what to work on next

**✅ Checkpoint:** You can manage task statuses effectively!

---

## 🎉 Success Indicators

You've successfully completed this step when:

- [ ] Created and managed task dependencies
- [ ] Created tags and switched between them
- [ ] Performed AI research and saved results
- [ ] Analyzed project complexity
- [ ] Updated tasks with new requirements
- [ ] Expanded tasks with advanced options
- [ ] Managed task statuses effectively

## 💡 Key Takeaways

1. **Dependencies keep work organized:** Tasks know what they depend on
2. **Tags enable multi-context work:** Switch between different areas easily
3. **Research improves quality:** AI research makes tasks more informed
4. **Complexity analysis optimizes work:** Right-sized tasks are more manageable
5. **Tasks stay current:** Update tasks as requirements change

## 🔍 Common Patterns

### Pattern: Feature Development
1. Create a tag for the feature: `task-master tags add feature-auth`
2. Switch to the tag: `task-master tags use feature-auth`
3. Add feature tasks: `task-master add-task --prompt "Implement login"`
4. Set dependencies between tasks
5. Work through tasks in order

### Pattern: Research-Driven Development
1. Research the topic: `task-master research --query "..." --save-to-file`
2. Create tasks based on research
3. Expand tasks with research: `task-master expand --id=<id> --research`
4. Update tasks as you learn more

### Pattern: Complexity Management
1. Analyze complexity: `task-master analyze-project-complexity`
2. Review recommendations
3. Scope down complex tasks
4. Scope up simple tasks
5. Re-analyze to verify improvements

## Next Step

Ready to code? Learn how to use **Autopilot for TDD workflows** and **MCP integration** in [Step 4: Autopilot & MCP](../4-autopilot-mcp/README.md).


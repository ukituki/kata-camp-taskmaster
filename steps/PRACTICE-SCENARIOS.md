# Practice Scenarios

These scenarios can be used for additional practice after completing the basic kata session.

## Scenario A: New Feature Development

**Challenge**: You need to add user authentication to your application.

1. Create a high-level task: "Implement user authentication"
2. Expand it into subtasks
3. Set up dependencies (e.g., database schema → API endpoints → frontend forms)
4. Use tags to organize (backend, frontend, testing)
5. Run autopilot for one of the subtasks

## Scenario B: Bug Fix Workflow

**Challenge**: Fix a critical bug in the payment processing system.

1. Create a task with detailed bug description
2. Perform research to understand the issue: `task-master-ai research --query "payment processing bug"`
3. Break down into investigation → fix → test → deploy
4. Track progress through each phase

## Scenario C: Refactoring Project

**Challenge**: Refactor a legacy module to improve maintainability.

1. Parse a PRD describing the refactoring goals
2. Generate initial task list
3. Organize tasks by affected components (tags)
4. Set dependencies for safe refactoring order

## Scenario D: Research-Backed Planning

**Challenge**: Plan a new feature using AI research.

1. Perform research: `task-master-ai research --query "How to implement OAuth2 authentication"`
2. Save research to file: `task-master-ai research --query "..." --save-to-file --save-to=research.md`
3. Use research to inform task planning
4. Create tasks based on research findings

## Scenario E: Complexity Management

**Challenge**: Break down a complex project into manageable tasks.

1. Analyze complexity: `task-master-ai analyze-project-complexity`
2. View report: `task-master-ai complexity-report`
3. Scope down complex tasks: `task-master-ai scope-down-task --id=<id>`
4. Scope up simple tasks: `task-master-ai scope-up-task --id=<id>`


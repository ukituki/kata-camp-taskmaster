# Taskmaster Kata Session - Checklist

Track your progress through the kata session by checking off completed steps.

## 0. Setup: Prerequisites

- [ ] Run prerequisites check: `steps/0-setup/check-prerequisites.sh`
- [ ] Install Node.js and npm (if needed)
- [ ] Install Git (if needed)
- [ ] Create `.env` file: `cp .env.example .env`
- [ ] Add at least one API key to `.env` file
- [ ] Verify prerequisites: `steps/0-setup/check-prerequisites.sh` (should show all green)

## 1. Vision → Plan: Create PRD

- [ ] Review PRD template: `steps/1-prd/PRD-template.md`
- [ ] Review PRD generation prompt: `steps/1-prd/PRD-generation-prompt.md`
- [ ] Generate PRD using AI (recommended) or create manually
- [ ] Create your PRD: `steps/1-prd/my-prd.md`
- [ ] Define project vision and goals
- [ ] List key features and requirements (3-5 features)
- [ ] Include technical requirements
- [ ] Save PRD file

## 2. Initialize Taskmaster & Parse PRD

- [ ] Install Taskmaster globally: `npm install -g task-master-ai`
- [ ] Verify installation: `which task-master` (shows installation path)
- [ ] Navigate to project root
- [ ] Initialize Taskmaster: `task-master init` (in project root)
- [ ] Configure models: `task-master models` (verify API keys)
- [ ] Parse PRD: `task-master parse-prd --input steps/1-prd/my-prd.md`
- [ ] List generated tasks: `task-master list`
- [ ] View task details: `task-master show <task-id>`
- [ ] Expand a complex task: `task-master expand --id=<task-id>`
- [ ] Validate dependencies: `task-master validate-dependencies`

## 3. Advanced Features

- [ ] Create and manage dependencies: `task-master add-dependency --id=<id> --depends-on=<dep-id>`
- [ ] Create tags: `task-master tags add <name>`
- [ ] Switch tag context: `task-master tags use <name>`
- [ ] Perform AI research: `task-master research "..." --save-file`
- [ ] Analyze complexity: `task-master analyze-complexity`
- [ ] View complexity report: `task-master complexity-report`
- [ ] Break down a complex task: `task-master expand --id=<id>`
- [ ] Update task with AI: `task-master update-task --id=<id> --prompt "..."`

## 4. Autopilot TDD & MCP Integration

- [ ] Select a task for autopilot: `task-master list --status pending`
- [ ] Start autopilot: `task-master autopilot-start --task-id=<id>`
- [ ] Check autopilot status: `task-master autopilot-status`
- [ ] Get next action: `task-master autopilot-next`
- [ ] Complete RED phase (write failing tests)
- [ ] Complete GREEN phase (implement to pass tests)
- [ ] Commit changes: `task-master autopilot-commit`
- [ ] Finalize workflow: `task-master autopilot-finalize`
- [ ] Test MCP in editor: Use AI chat to manage tasks
- [ ] Create task via MCP: Ask AI to create a task from editor

---

**Congratulations!** 🎉 You've completed the Taskmaster Kata session!

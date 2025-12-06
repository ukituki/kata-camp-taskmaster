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

## 2. TM: Install Taskmaster & Basic CLI

- [ ] Install Taskmaster globally: `npm install -g task-master-ai`
- [ ] Verify installation: `which task-master` (shows installation path)
- [ ] Navigate to project root
- [ ] Initialize Taskmaster: `task-master init` (in project root)
- [ ] Check models: `task-master models`
- [ ] List tasks: `task-master list` (should be empty initially)
- [ ] Update task status: `task-master set-status --id=<id> --status=done`
- [ ] Create a tag: `task-master tags add kata-session`
- [ ] Switch to tag: `task-master tags use kata-session`

## 3. Plan → Tasks: Parse PRD

- [ ] Parse PRD: `task-master parse-prd --input steps/1-prd/my-prd.md`
- [ ] Review generated tasks: `task-master list`
- [ ] Expand a complex task: `task-master expand --id=<id>`
- [ ] Check dependencies: `task-master validate-dependencies`
- [ ] Review task list and organize

## 4. Task → Code: First Autopilot Task

- [ ] Select a simple task to implement
- [ ] Start autopilot: `task-master autopilot-start --task-id=<id>`
- [ ] Check status: `task-master autopilot-status`
- [ ] Get next action: `task-master autopilot-next`
- [ ] Complete RED phase (write failing tests)
- [ ] Complete GREEN phase (implement to pass tests)
- [ ] Commit changes: `task-master autopilot-commit`
- [ ] Finalize workflow: `task-master autopilot-finalize`

---

**Congratulations!** 🎉 You've completed the Taskmaster Kata session!


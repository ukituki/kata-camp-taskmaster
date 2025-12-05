# Taskmaster Kata Session - Checklist

Track your progress through the kata session by checking off completed steps.

## 0. Setup: Prerequisites

- [ ] Run prerequisites check: `steps/0-setup/check-prerequisites.sh`
- [ ] Install Node.js and npm (if needed)
- [ ] Install Git (if needed)
- [ ] Install Taskmaster globally: `npm install -g task-master-ai`
- [ ] Verify installation: `task-master-ai --version`
- [ ] Create `.env` file: `cp .env.example .env`
- [ ] Add at least one API key to `.env` file
- [ ] Verify prerequisites: `steps/0-setup/check-prerequisites.sh` (should show all green)

## 1. TM: Install Taskmaster & Basic CLI

- [ ] Initialize Taskmaster: `task-master-ai init`
- [ ] Check models: `task-master-ai models`
- [ ] Create first task: `task-master-ai add-task --prompt "Learn Taskmaster basics"`
- [ ] List tasks: `task-master-ai get-tasks`
- [ ] Update task status: `task-master-ai set-task-status --id=<id> done`
- [ ] Create a tag: `task-master-ai add-tag --name=kata-session`
- [ ] Switch to tag: `task-master-ai use-tag --name=kata-session`

## 2. Vision → Plan: Create PRD

- [ ] Review PRD template: `steps/2-prd/PRD-template.md`
- [ ] Create your PRD: `steps/2-prd/my-prd.md`
- [ ] Define project vision and goals
- [ ] List key features and requirements
- [ ] Save PRD file

## 3. Plan → Tasks: Parse PRD

- [ ] Parse PRD: `task-master-ai parse-prd --input steps/2-prd/my-prd.md`
- [ ] Review generated tasks: `task-master-ai get-tasks`
- [ ] Expand a complex task: `task-master-ai expand-task --id=<id>`
- [ ] Check dependencies: `task-master-ai validate-dependencies`
- [ ] Review task list and organize

## 4. Task → Code: First Autopilot Task

- [ ] Select a simple task to implement
- [ ] Start autopilot: `task-master-ai autopilot-start --task-id=<id>`
- [ ] Check status: `task-master-ai autopilot-status`
- [ ] Get next action: `task-master-ai autopilot-next`
- [ ] Complete RED phase (write failing tests)
- [ ] Complete GREEN phase (implement to pass tests)
- [ ] Commit changes: `task-master-ai autopilot-commit`
- [ ] Finalize workflow: `task-master-ai autopilot-finalize`

---

**Congratulations!** 🎉 You've completed the Taskmaster Kata session!


# Taskmaster Kata Session

A hands-on practice session for learning and mastering Taskmaster AI, an AI-powered task management system for software development projects.

## Quick Start

1. **Check prerequisites:** `steps/0-setup/check-prerequisites.sh`
2. **Follow the steps:** Each step has its own folder with instructions
3. **Track progress:** Use `CHECKLIST.md` to mark completed tasks

## Session Structure

The kata session is organized into 5 steps:

- **Step 0: Setup** - Verify prerequisites (`steps/0-setup/`)
- **Step 1: Vision → Plan** - Create a PRD document (`steps/1-prd/`)
- **Step 2: TM Basics** - Install and learn basic CLI commands (`steps/2-tm-basics/`)
- **Step 3: Plan → Tasks** - Parse PRD into tasks (`steps/3-parse-prd/`)
- **Step 4: Task → Code** - Complete first task with autopilot (`steps/4-autopilot/`)

📋 **Track your progress:** See `CHECKLIST.md` for a simple checklist of all tasks.

## What is Taskmaster AI?

Taskmaster AI is an intelligent task management tool ([npm package](https://www.npmjs.com/package/task-master-ai)) that helps developers:

- Break down complex projects into manageable tasks
- Track dependencies between tasks
- Organize work using tags and contexts
- Perform AI-powered research with project context
- Run TDD workflows with autopilot mode
- Generate and manage task hierarchies automatically
- Integrate seamlessly with editors like Cursor via MCP (automatically configured)

## Prerequisites

Before starting this kata session, ensure you have:

- **Node.js** (v14 or later) installed
- **npm** (comes with Node.js)
- **Git** installed and configured
- A **code editor** (VS Code, Cursor, or Claude Code)
- Basic familiarity with **command-line tools**
- At least one **AI model API key**:
  - Anthropic API key (Claude) - Recommended for main model
  - OpenAI API key
  - Perplexity API key (recommended for research model)
  - Google Gemini API key
  - OpenRouter API key
  - xAI API key
  - Azure OpenAI API key
  - Mistral API key
  - Ollama (local setup)

### Quick Prerequisites Check

We've included scripts to check if all prerequisites are met:

**For macOS/Linux:**
```bash
# Run the prerequisites checker
steps/0-setup/check-prerequisites.sh
```

**For Windows (PowerShell):**
```powershell
# Run the prerequisites checker
steps/0-setup/check-prerequisites.ps1
```

These scripts will:
- ✅ Check Node.js and npm versions
- ✅ Verify Git installation and configuration
- ✅ Check for AI model API keys in your environment
- ✅ Provide specific suggestions for any missing prerequisites

If all checks pass, you'll see next steps to initialize Taskmaster!

## Session Objectives

By the end of this kata session, you will be able to:

1. ✅ Initialize a Taskmaster project
2. ✅ Create and manage tasks with dependencies
3. ✅ Use tags to organize work across different contexts
4. ✅ Expand tasks into subtasks automatically
5. ✅ Perform AI-powered research with project context
6. ✅ Run TDD workflows using autopilot mode
7. ✅ Integrate Taskmaster into your daily workflow

## Getting Started

Follow the steps in order, starting with [Step 0: Setup](steps/0-setup/README.md). Each step folder contains detailed instructions for that part of the kata session.

## Resources

- **Taskmaster AI npm Package**: [npmjs.com/package/task-master-ai](https://www.npmjs.com/package/task-master-ai)
- **Taskmaster AI Documentation**: [docs.task-master.dev](https://docs.task-master.dev/)
- **Kata Camp**: [kata.camp](https://kata.camp)

## Additional Resources

- **Practice Scenarios**: See [steps/PRACTICE-SCENARIOS.md](steps/PRACTICE-SCENARIOS.md) for additional practice exercises
- **Command Reference**: See [Step 2](steps/2-tm-basics/README.md) for common commands
- **Troubleshooting**: See [Step 0](steps/0-setup/README.md) for setup troubleshooting

## Next Steps

After completing this kata session:

1. Integrate Taskmaster into your current project
2. Experiment with different AI models and their strengths
3. Create custom tags and workflows for your team
4. Try the practice scenarios for additional learning
5. Share your experience and tips with the community

## Feedback

We'd love to hear about your experience with this kata session! Please share:
- What worked well
- What was challenging
- Suggestions for improvement
- Tips you discovered

---

**Happy Coding! 🚀**

*Remember: The goal of a kata is not to finish quickly, but to practice deliberately and learn deeply.*
(insert motovational gif and "move fast and break things" meme here)


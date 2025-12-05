# Taskmaster Kata Session

A hands-on practice session for learning and mastering Taskmaster AI, an AI-powered task management system for software development projects.

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
./check-prerequisites.sh
```

**For Windows (PowerShell):**
```powershell
# Run the prerequisites checker
.\check-prerequisites.ps1
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

## Setup Instructions

### 1. Install Taskmaster (Optional - npx works without installation)

You can use Taskmaster directly via npx, or install it globally:

```bash
# Option 1: Use via npx (no installation needed)
# Just use: npx task-master-ai <command>

# Option 2: Install globally via npm
npm install -g task-master-ai
```

### 2. Initialize Taskmaster in Your Project

```bash
# Navigate to your project directory
cd /path/to/your/project

# Initialize Taskmaster (creates .taskmaster directory)
npx task-master-ai init
# OR if installed globally:
task-master-ai init
```

**Note:** MCP (Model Context Protocol) integration for editors like Cursor is automatically configured when you initialize Taskmaster.

### 3. Configure AI Models

**Option 1: Using .env file (Recommended)**

```bash
# Copy the example environment file
cp .env.example .env

# Edit .env and add your API keys
# Get your keys from:
# - Anthropic: https://console.anthropic.com/
# - Perplexity: https://www.perplexity.ai/settings/api
# Then Taskmaster will automatically load them
```

**Option 2: Using environment variables**

```bash
# Set your API keys as environment variables
export ANTHROPIC_API_KEY="your-key-here"
export PERPLEXITY_API_KEY="your-key-here"  # Optional but recommended for research
export OPENAI_API_KEY="your-key-here"       # Optional
```

**Configure Taskmaster models:**

```bash
# Configure Taskmaster to use your preferred model
npx task-master-ai models --set-main claude-3-5-sonnet-20241022
npx task-master-ai models --set-research perplexity
```

### Verify Installation

```bash
# Check Taskmaster status and model configuration
npx task-master-ai models
```

## Kata Session Structure

### Part 1: Basic Task Management (20 minutes)

**Exercise 1.1: Create Your First Task**
- Create a task for "Set up development environment"
- Use: `npx task-master-ai add-task --prompt "Set up development environment"`
- Add a description and details when prompted
- Mark it as done: `npx task-master-ai set-task-status --id=<id> done`

**Exercise 1.2: Task Dependencies**
- Create three related tasks using `npx task-master-ai add-task`
- Establish dependencies: `npx task-master-ai add-dependency --id=<id> --depends-on=<dep-id>`
- Verify the dependency chain: `npx task-master-ai validate-dependencies`

**Exercise 1.3: Task Status Management**
- Practice changing task statuses: `npx task-master-ai set-task-status --id=<id> in-progress`
- Status options: `pending`, `in-progress`, `done`, `deferred`, `cancelled`, `blocked`, `review`
- Use status filters: `npx task-master-ai get-tasks --status pending`

### Part 2: Advanced Organization (20 minutes)

**Exercise 2.1: Using Tags**
- Create tags: `npx task-master-ai add-tag --name=frontend`
- Create tags for `backend` and `testing` as well
- Switch context: `npx task-master-ai use-tag --name=frontend`
- Tasks created now will be in the frontend tag context
- List all tags: `npx task-master-ai list-tags`

**Exercise 2.2: Task Expansion**
- Create a high-level task: `npx task-master-ai add-task --prompt "Build user dashboard"`
- Expand it: `npx task-master-ai expand-task --id=<id>`
- Or expand with research: `npx task-master-ai expand-task --id=<id> --research`
- Review and refine the generated subtasks

**Exercise 2.3: Complexity Analysis**
- Analyze complexity: `npx task-master-ai analyze-project-complexity`
- View report: `npx task-master-ai complexity-report`
- Scope down complex tasks: `npx task-master-ai scope-down-task --id=<id>`
- Scope up simple tasks: `npx task-master-ai scope-up-task --id=<id>`

### Part 3: AI-Powered Features (20 minutes)

**Exercise 3.1: Research with Context**
- Perform research: `npx task-master-ai research --query "How to implement OAuth2 authentication"`
- Save to file: `npx task-master-ai research --query "..." --save-to-file --save-to=research.md`
- Use research to inform task planning and expansion

**Exercise 3.2: PRD Parsing**
- Create a PRD file: `.taskmaster/docs/prd.txt`
- Parse it: `npx task-master-ai parse-prd --input .taskmaster/docs/prd.txt`
- Review and refine generated tasks
- Use `--research` flag for research-backed task generation

**Exercise 3.3: Task Updates with AI**
- Update a single task: `npx task-master-ai update-task --id=<id> --prompt "Add authentication requirements"`
- Update multiple tasks: `npx task-master-ai update --from=<id> --prompt "New requirements: ..."`
- Use AI to adjust task descriptions and dependencies automatically

### Part 4: TDD Workflow with Autopilot (20 minutes)

**Exercise 4.1: Start Autopilot**
- Select a task to work on (get ID from `npx task-master-ai get-tasks`)
- Initialize autopilot: `npx task-master-ai autopilot-start --task-id=<id>`
- Check status: `npx task-master-ai autopilot-status`
- Understand the TDD cycle (RED → GREEN → REFACTOR → COMMIT)

**Exercise 4.2: Complete a Phase**
- Get next action: `npx task-master-ai autopilot-next`
- Write failing tests (RED phase)
- Complete RED phase: `npx task-master-ai autopilot-complete-phase --test-results='{"total":5,"passed":0,"failed":5}'`
- Implement features to pass tests (GREEN phase)
- Complete GREEN phase: `npx task-master-ai autopilot-complete-phase --test-results='{"total":5,"passed":5,"failed":0}'`
- Commit changes: `npx task-master-ai autopilot-commit`

**Exercise 4.3: Workflow Management**
- Check autopilot status: `npx task-master-ai autopilot-status`
- Resume interrupted workflows: `npx task-master-ai autopilot-resume`
- Finalize completed workflows: `npx task-master-ai autopilot-finalize`
- Abort if needed: `npx task-master-ai autopilot-abort`

## Practice Scenarios

### Scenario A: New Feature Development

**Challenge**: You need to add user authentication to your application.

1. Create a high-level task: "Implement user authentication"
2. Expand it into subtasks
3. Set up dependencies (e.g., database schema → API endpoints → frontend forms)
4. Use tags to organize (backend, frontend, testing)
5. Run autopilot for one of the subtasks

### Scenario B: Bug Fix Workflow

**Challenge**: Fix a critical bug in the payment processing system.

1. Create a task with detailed bug description
2. Perform research to understand the issue
3. Break down into investigation → fix → test → deploy
4. Track progress through each phase

### Scenario C: Refactoring Project

**Challenge**: Refactor a legacy module to improve maintainability.

1. Parse a PRD describing the refactoring goals
2. Generate initial task list
3. Organize tasks by affected components (tags)
4. Set dependencies for safe refactoring order

## Common Commands Reference

```bash
# Project Management
npx task-master-ai init                    # Initialize Taskmaster in project
npx task-master-ai models                  # View/configure AI models

# Task Management
npx task-master-ai add-task --prompt "Task title"  # Create a new task
npx task-master-ai get-tasks                        # List all tasks
npx task-master-ai get-tasks --status pending       # Filter by status
npx task-master-ai set-task-status --id=<id> done  # Update task status

# Task Expansion
npx task-master-ai expand-task --id=<id>           # Expand task into subtasks
npx task-master-ai expand-all                      # Expand all pending tasks

# Dependencies
npx task-master-ai add-dependency --id=<id> --depends-on=<dep-id>  # Add dependency
npx task-master-ai validate-dependencies                           # Check for issues

# Tags
npx task-master-ai list-tags               # Show all tags
npx task-master-ai add-tag --name=<name>   # Create new tag
npx task-master-ai use-tag --name=<name>  # Switch context

# Research
npx task-master-ai research --query "query"  # AI research with context

# PRD Parsing
npx task-master-ai parse-prd --input .taskmaster/docs/prd.txt  # Parse PRD to generate tasks

# Autopilot (TDD Workflow)
npx task-master-ai autopilot-start --task-id=<id>  # Start TDD workflow
npx task-master-ai autopilot-status                  # Check workflow status
npx task-master-ai autopilot-next                    # Get next action
npx task-master-ai autopilot-commit                  # Commit changes
npx task-master-ai autopilot-finalize                # Finalize workflow

# Help
npx task-master-ai --help                 # Show all available commands
```

## Tips for Success

1. **Start Small**: Begin with simple tasks to understand the workflow
2. **Use Tags Wisely**: Create meaningful tags that reflect your project structure
3. **Leverage AI**: Don't hesitate to use AI features for task expansion and research
4. **Validate Dependencies**: Regularly check for circular dependencies or broken links
5. **Commit Often**: Use autopilot's commit feature to maintain a clean git history
6. **Iterate**: Tasks are living documents - update them as requirements change

## Troubleshooting

### Issue: Taskmaster not found

**Solution**:
- If using npx: Ensure Node.js and npm are installed
- If using global install: Run `npm install -g task-master-ai` and verify it's in your PATH
- Check installation: `npx task-master-ai --version`

### Issue: API key errors

**Solution**:
- Verify your API key is set correctly: `echo $ANTHROPIC_API_KEY`
- Ensure environment variables are set in your shell profile
- For persistent keys, add to your shell profile (~/.bashrc, ~/.zshrc, etc.)

### Issue: Circular dependencies

**Solution**:
- Use `npx task-master-ai validate-dependencies` to check for issues
- Use `npx task-master-ai fix-dependencies` to automatically fix problems

### Issue: Autopilot stuck

**Solution**:
- Check status with `npx task-master-ai autopilot-status`
- Resume with `npx task-master-ai autopilot-resume` if workflow was interrupted
- Abort if needed: `npx task-master-ai autopilot-abort`

## Resources

- **Taskmaster AI npm Package**: [npmjs.com/package/task-master-ai](https://www.npmjs.com/package/task-master-ai)
- **Taskmaster AI Documentation**: [docs.task-master.dev](https://docs.task-master.dev/)
- **Kata Camp**: [kata.camp](https://kata.camp)
- **Coaches FAQ**: [kata.camp/coaches/faq/](https://kata.camp/coaches/faq/)

## Next Steps

After completing this kata session:

1. Integrate Taskmaster into your current project
2. Experiment with different AI models and their strengths
3. Create custom tags and workflows for your team
4. Share your experience and tips with the community
5. Practice regularly to build muscle memory

## Feedback

We'd love to hear about your experience with this kata session! Please share:
- What worked well
- What was challenging
- Suggestions for improvement
- Tips you discovered

---

**Happy Coding! 🚀**

*Remember: The goal of a kata is not to finish quickly, but to practice deliberately and learn deeply.*


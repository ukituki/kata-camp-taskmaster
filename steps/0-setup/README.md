# Step 0: Setup - Prerequisites

## Objective
Verify that all prerequisites are installed and configured before starting the kata session.

## Tasks

1. **Run prerequisites check:**
   ```bash
   # From the project root, or from this folder:
   ./check-prerequisites.sh
   # Or on Windows:
   .\check-prerequisites.ps1
   ```

2. **Install missing prerequisites** (if any):
   - Node.js (v14+): https://nodejs.org/
   - npm (comes with Node.js)
   - Git: https://git-scm.com/downloads

3. **Install Taskmaster globally:**
   ```bash
   npm install -g task-master-ai
   ```
   
   Verify installation:
   ```bash
   task-master-ai --version
   ```

4. **Set up API keys:**

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

5. **Configure Taskmaster models:**
   ```bash
   # Configure Taskmaster to use your preferred model
   task-master-ai models --set-main claude-3-5-sonnet-20241022
   task-master-ai models --set-research perplexity
   ```

6. **Verify everything is ready:**
   ```bash
   ./check-prerequisites.sh
   ```
   
   You should see: ✓ All prerequisites are met!
   
   **Note:** The script will not check for Taskmaster installation since that's done in step 3 above.

## Success Criteria

- [ ] All prerequisites check pass (Node.js, npm, Git)
- [ ] Taskmaster installed globally (`task-master-ai --version` works)
- [ ] At least one API key is configured (in .env or environment)
- [ ] Models configured (`task-master-ai models` shows your configuration)
- [ ] Prerequisites script shows green checkmarks

## Troubleshooting

### Issue: Taskmaster not found
- Ensure Taskmaster is installed globally: `npm install -g task-master-ai`
- Verify it's in your PATH: `task-master-ai --version`
- If command not found, check your npm global bin path is in PATH

### Issue: API key errors
- Verify your API key is set correctly: `echo $ANTHROPIC_API_KEY`
- Ensure environment variables are set in your shell profile
- For persistent keys, add to your shell profile (~/.bashrc, ~/.zshrc, etc.)

## Next Step

Once all prerequisites are met, proceed to [Step 1: TM Basics](../1-tm-basics/README.md)


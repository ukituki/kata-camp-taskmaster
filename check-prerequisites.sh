#!/bin/bash

# Taskmaster Kata Session - Prerequisites Checker
# This script checks if all prerequisites are met and suggests next steps

# Don't exit on error - we want to check everything
set +e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Track if all checks pass
ALL_PASSED=true

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Taskmaster Kata Session - Prerequisites Check${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Function to print success
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

# Function to print error
print_error() {
    echo -e "${RED}✗${NC} $1"
    ALL_PASSED=false
}

# Function to print warning
print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Function to print info
print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Check Node.js
echo -e "${BLUE}Checking Node.js...${NC}"
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version | sed 's/v//')
    NODE_MAJOR_VERSION=$(echo $NODE_VERSION | cut -d. -f1)
    
    if [ "$NODE_MAJOR_VERSION" -ge 14 ]; then
        print_success "Node.js is installed (version $NODE_VERSION)"
    else
        print_error "Node.js version $NODE_VERSION is too old. Version 14 or later is required."
        print_info "  → Install from: https://nodejs.org/"
        print_info "  → Or use a version manager like nvm: https://github.com/nvm-sh/nvm"
    fi
else
    print_error "Node.js is not installed"
    print_info "  → Download from: https://nodejs.org/"
    print_info "  → Or install via package manager:"
    print_info "    - macOS: brew install node"
    print_info "    - Ubuntu/Debian: sudo apt-get install nodejs npm"
    print_info "    - Windows: Use the installer from nodejs.org"
fi
echo ""

# Check npm
echo -e "${BLUE}Checking npm...${NC}"
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm --version)
    print_success "npm is installed (version $NPM_VERSION)"
else
    print_error "npm is not installed"
    print_info "  → npm usually comes with Node.js. Reinstall Node.js if npm is missing."
fi
echo ""

# Check Git
echo -e "${BLUE}Checking Git...${NC}"
if command -v git &> /dev/null; then
    GIT_VERSION=$(git --version | cut -d' ' -f3)
    print_success "Git is installed (version $GIT_VERSION)"
    
    # Check if Git is configured
    if git config user.name &> /dev/null && git config user.email &> /dev/null; then
        print_success "Git is configured"
    else
        print_warning "Git is installed but not configured"
        print_info "  → Configure with:"
        print_info "    git config --global user.name \"Your Name\""
        print_info "    git config --global user.email \"your.email@example.com\""
    fi
else
    print_error "Git is not installed"
    print_info "  → Install from: https://git-scm.com/downloads"
    print_info "  → Or install via package manager:"
    print_info "    - macOS: brew install git"
    print_info "    - Ubuntu/Debian: sudo apt-get install git"
    print_info "    - Windows: Download from git-scm.com"
fi
echo ""

# Check API Keys (from environment variables and .env file)
echo -e "${BLUE}Checking AI Model API Keys...${NC}"
API_KEYS_FOUND=0

# Load .env file if it exists (for checking)
if [ -f .env ]; then
    # Source .env file to check for keys (use a subshell to avoid polluting current env)
    # Export variables from .env file
    set -a
    source .env 2>/dev/null || true
    set +a
    print_info "Found .env file in project directory"
elif [ -f .env.example ]; then
    print_info ".env.example file found - copy it to .env and add your keys"
fi

check_api_key() {
    local key_name=$1
    local display_name=$2
    
    # Use eval to safely check if variable is set and not empty
    local key_value
    eval "key_value=\${${key_name}}"
    
    if [ -n "$key_value" ]; then
        print_success "$display_name API key is set"
        API_KEYS_FOUND=$((API_KEYS_FOUND + 1))
        return 0
    else
        return 1
    fi
}

check_api_key "ANTHROPIC_API_KEY" "Anthropic (Claude)"
check_api_key "OPENAI_API_KEY" "OpenAI"
check_api_key "PERPLEXITY_API_KEY" "Perplexity"
check_api_key "GOOGLE_API_KEY" "Google Gemini"
check_api_key "MISTRAL_API_KEY" "Mistral"
check_api_key "OPENROUTER_API_KEY" "OpenRouter"
check_api_key "XAI_API_KEY" "xAI"
check_api_key "AZURE_OPENAI_API_KEY" "Azure OpenAI"
check_api_key "OLLAMA_API_KEY" "Ollama"

if [ $API_KEYS_FOUND -eq 0 ]; then
    print_warning "No AI model API keys found in environment variables or .env file"
    print_info ""
    print_info "  → QUICK SETUP: Create a .env file in your project root:"
    print_info "    1. Copy the example file: cp .env.example .env"
    print_info "    2. Edit .env and add your API keys"
    print_info "    3. Taskmaster will automatically load keys from .env file"
    print_info ""
    print_info "  → Get your API keys from:"
    print_info "    - Anthropic (recommended): https://console.anthropic.com/"
    print_info "    - Perplexity (optional): https://www.perplexity.ai/settings/api"
    print_info ""
    print_info "  → Alternative: Set environment variables in your shell:"
    print_info "    export ANTHROPIC_API_KEY='your-key-here'"
    print_info "    (Add to ~/.bashrc, ~/.zshrc, or ~/.config/fish/config.fish for persistence)"
else
    print_success "Found $API_KEYS_FOUND API key(s) configured"
    if [ $API_KEYS_FOUND -eq 1 ] && [ -z "${ANTHROPIC_API_KEY}" ]; then
        print_warning "Consider setting ANTHROPIC_API_KEY for better main model support"
    fi
    if [ -z "${PERPLEXITY_API_KEY}" ]; then
        print_warning "Consider setting PERPLEXITY_API_KEY for research features (optional)"
    fi
fi
echo ""

# Check if task-master-ai is available (quick check - just verify npx exists)
echo -e "${BLUE}Checking task-master-ai package...${NC}"
if command -v npx &> /dev/null; then
    print_success "npx is available (task-master-ai will be downloaded automatically when first used)"
else
    print_error "npx is not available (should come with npm)"
fi
echo ""

# Summary
echo -e "${BLUE}========================================${NC}"
if [ "$ALL_PASSED" = true ] && [ $API_KEYS_FOUND -gt 0 ]; then
    echo -e "${GREEN}✓ All prerequisites are met!${NC}"
    echo ""
    echo -e "${GREEN}Next steps:${NC}"
    echo "  1. Navigate to your project directory"
    echo "  2. Initialize Taskmaster: npx task-master-ai init"
    echo "  3. Configure models: npx task-master-ai models --set-main claude-3-5-sonnet-20241022"
    echo "  4. Start the kata session!"
elif [ "$ALL_PASSED" = true ] && [ $API_KEYS_FOUND -eq 0 ]; then
    echo -e "${YELLOW}⚠ Prerequisites installed, but API keys are missing${NC}"
    echo ""
    echo -e "${YELLOW}Next steps:${NC}"
    echo "  1. Create .env file: cp .env.example .env"
    echo "  2. Edit .env and add your API keys"
    echo "  3. Run this script again to verify: ./check-prerequisites.sh"
    echo "  4. Then initialize Taskmaster: npx task-master-ai init"
else
    echo -e "${RED}✗ Some prerequisites are missing${NC}"
    echo ""
    echo -e "${YELLOW}Next steps:${NC}"
    echo "  1. Install missing prerequisites (see suggestions above)"
    STEP=2
    if [ $API_KEYS_FOUND -eq 0 ]; then
        echo "  $STEP. Create .env file: cp .env.example .env (and add your API keys)"
        STEP=$((STEP + 1))
    fi
    echo "  $STEP. Run this script again: ./check-prerequisites.sh"
    echo "  $((STEP + 1)). Once all checks pass, initialize Taskmaster: npx task-master-ai init"
fi
echo -e "${BLUE}========================================${NC}"

# Exit with appropriate code
if [ "$ALL_PASSED" = true ] && [ $API_KEYS_FOUND -gt 0 ]; then
    exit 0
else
    exit 1
fi


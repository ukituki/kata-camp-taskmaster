# Taskmaster Kata Session - Prerequisites Checker (PowerShell)
# This script checks if all prerequisites are met and suggests next steps

$AllPassed = $true
$ApiKeysFound = 0

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Taskmaster Kata Session - Prerequisites Check" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Function to print success
function Print-Success {
    param([string]$Message)
    Write-Host "✓ " -NoNewline -ForegroundColor Green
    Write-Host $Message
}

# Function to print error
function Print-Error {
    param([string]$Message)
    Write-Host "✗ " -NoNewline -ForegroundColor Red
    Write-Host $Message
    $script:AllPassed = $false
}

# Function to print warning
function Print-Warning {
    param([string]$Message)
    Write-Host "⚠ " -NoNewline -ForegroundColor Yellow
    Write-Host $Message
}

# Function to print info
function Print-Info {
    param([string]$Message)
    Write-Host "ℹ " -NoNewline -ForegroundColor Cyan
    Write-Host $Message
}

# Check Node.js
Write-Host "Checking Node.js..." -ForegroundColor Cyan
$nodeVersion = Get-Command node -ErrorAction SilentlyContinue
if ($nodeVersion) {
    $version = (node --version).Substring(1)  # Remove 'v' prefix
    $majorVersion = [int]($version.Split('.')[0])
    
    if ($majorVersion -ge 14) {
        Print-Success "Node.js is installed (version $version)"
    } else {
        Print-Error "Node.js version $version is too old. Version 14 or later is required."
        Print-Info "  → Install from: https://nodejs.org/"
        Print-Info "  → Or use a version manager like nvm-windows: https://github.com/coreybutler/nvm-windows"
    }
} else {
    Print-Error "Node.js is not installed"
    Print-Info "  → Download from: https://nodejs.org/"
    Print-Info "  → Or install via winget: winget install OpenJS.NodeJS"
    Print-Info "  → Or install via Chocolatey: choco install nodejs"
}
Write-Host ""

# Check npm
Write-Host "Checking npm..." -ForegroundColor Cyan
$npmVersion = Get-Command npm -ErrorAction SilentlyContinue
if ($npmVersion) {
    $version = npm --version
    Print-Success "npm is installed (version $version)"
} else {
    Print-Error "npm is not installed"
    Print-Info "  → npm usually comes with Node.js. Reinstall Node.js if npm is missing."
}
Write-Host ""

# Check Git
Write-Host "Checking Git..." -ForegroundColor Cyan
$gitVersion = Get-Command git -ErrorAction SilentlyContinue
if ($gitVersion) {
    $version = (git --version).Split(' ')[2]
    Print-Success "Git is installed (version $version)"
    
    # Check if Git is configured
    $userName = git config user.name 2>$null
    $userEmail = git config user.email 2>$null
    
    if ($userName -and $userEmail) {
        Print-Success "Git is configured"
    } else {
        Print-Warning "Git is installed but not configured"
        Print-Info "  → Configure with:"
        Print-Info "    git config --global user.name `"Your Name`""
        Print-Info "    git config --global user.email `"your.email@example.com`""
    }
} else {
    Print-Error "Git is not installed"
    Print-Info "  → Install from: https://git-scm.com/downloads"
    Print-Info "  → Or install via winget: winget install Git.Git"
    Print-Info "  → Or install via Chocolatey: choco install git"
}
Write-Host ""

# Check API Keys (from environment variables and .env file)
Write-Host "Checking AI Model API Keys..." -ForegroundColor Cyan

# Load .env file if it exists
if (Test-Path .env) {
    Get-Content .env | ForEach-Object {
        if ($_ -match '^\s*([^#][^=]+)=(.*)$') {
            $key = $matches[1].Trim()
            $value = $matches[2].Trim()
            if ($value -and $value -ne 'your-*-api-key-here') {
                [Environment]::SetEnvironmentVariable($key, $value, "Process")
            }
        }
    }
    Print-Info "Found .env file in project directory"
}

function Check-ApiKey {
    param(
        [string]$KeyName,
        [string]$DisplayName
    )
    
    $keyValue = [Environment]::GetEnvironmentVariable($KeyName, "Process")
    if (-not $keyValue) {
        $keyValue = [Environment]::GetEnvironmentVariable($KeyName, "User")
    }
    if (-not $keyValue) {
        $keyValue = [Environment]::GetEnvironmentVariable($KeyName, "Machine")
    }
    
    if ($keyValue) {
        Print-Success "$DisplayName API key is set"
        $script:ApiKeysFound++
        return $true
    }
    return $false
}

Check-ApiKey "ANTHROPIC_API_KEY" "Anthropic (Claude)" | Out-Null
Check-ApiKey "OPENAI_API_KEY" "OpenAI" | Out-Null
Check-ApiKey "PERPLEXITY_API_KEY" "Perplexity" | Out-Null
Check-ApiKey "GOOGLE_API_KEY" "Google Gemini" | Out-Null
Check-ApiKey "MISTRAL_API_KEY" "Mistral" | Out-Null
Check-ApiKey "OPENROUTER_API_KEY" "OpenRouter" | Out-Null
Check-ApiKey "XAI_API_KEY" "xAI" | Out-Null
Check-ApiKey "AZURE_OPENAI_API_KEY" "Azure OpenAI" | Out-Null
Check-ApiKey "OLLAMA_API_KEY" "Ollama" | Out-Null

if ($ApiKeysFound -eq 0) {
    Print-Error "No AI model API keys found in environment variables or .env file"
    Print-Info ""
    Print-Info "  → QUICK SETUP: Create a .env file in your project root:"
    Print-Info "    1. Copy the example file: Copy-Item .env.example .env"
    Print-Info "    2. Edit .env and add your API keys"
    Print-Info "    3. Taskmaster will automatically load keys from .env file"
    Print-Info ""
    Print-Info "  → Get your API keys from:"
    Print-Info "    - Anthropic (recommended): https://console.anthropic.com/"
    Print-Info "    - Perplexity (optional): https://www.perplexity.ai/settings/api"
    Print-Info ""
    Print-Info "  → Alternative: Set environment variables in PowerShell:"
    Print-Info "    `$env:ANTHROPIC_API_KEY='your-key-here'"
    Print-Info "    (Add to `$PROFILE for persistence: notepad `$PROFILE)"
} else {
    Print-Success "Found $ApiKeysFound API key(s) configured"
    $anthropicKey = [Environment]::GetEnvironmentVariable("ANTHROPIC_API_KEY", "Process")
    if (-not $anthropicKey) {
        $anthropicKey = [Environment]::GetEnvironmentVariable("ANTHROPIC_API_KEY", "User")
    }
    if (-not $anthropicKey) {
        $anthropicKey = [Environment]::GetEnvironmentVariable("ANTHROPIC_API_KEY", "Machine")
    }
    if (-not $anthropicKey) {
        Print-Warning "Consider setting ANTHROPIC_API_KEY for better main model support"
    }
    $perplexityKey = [Environment]::GetEnvironmentVariable("PERPLEXITY_API_KEY", "Process")
    if (-not $perplexityKey) {
        $perplexityKey = [Environment]::GetEnvironmentVariable("PERPLEXITY_API_KEY", "User")
    }
    if (-not $perplexityKey) {
        $perplexityKey = [Environment]::GetEnvironmentVariable("PERPLEXITY_API_KEY", "Machine")
    }
    if (-not $perplexityKey) {
        Print-Warning "Consider setting PERPLEXITY_API_KEY for research features (optional)"
    }
}
Write-Host ""

# Check if task-master-ai is available (quick check - just verify npx exists)
Write-Host "Checking task-master-ai package..." -ForegroundColor Cyan
if (Get-Command npx -ErrorAction SilentlyContinue) {
    Print-Success "npx is available (task-master-ai will be downloaded automatically when first used)"
} else {
    Print-Error "npx is not available (should come with npm)"
}
Write-Host ""

# Summary
Write-Host "========================================" -ForegroundColor Cyan
if ($AllPassed -and $ApiKeysFound -gt 0) {
    Write-Host "✓ All prerequisites are met!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Green
    Write-Host "  1. Navigate to your project directory"
    Write-Host "  2. Initialize Taskmaster: npx task-master-ai init"
    Write-Host "  3. Configure models: npx task-master-ai models --set-main claude-3-5-sonnet-20241022"
    Write-Host "  4. Start the kata session!"
} elseif ($AllPassed -and $ApiKeysFound -eq 0) {
    Write-Host "⚠ Prerequisites installed, but API keys are missing" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "  1. Create .env file: Copy-Item .env.example .env"
    Write-Host "  2. Edit .env and add your API keys"
    Write-Host "  3. Run this script again to verify: .\check-prerequisites.ps1"
    Write-Host "  4. Then initialize Taskmaster: npx task-master-ai init"
} else {
    Write-Host "✗ Some prerequisites are missing" -ForegroundColor Red
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "  1. Install missing prerequisites (see suggestions above)"
    Write-Host "  2. Run this script again: .\check-prerequisites.ps1"
    Write-Host "  3. Once all checks pass, initialize Taskmaster: npx task-master-ai init"
}
Write-Host "========================================" -ForegroundColor Cyan

# Exit with appropriate code
if ($AllPassed -and $ApiKeysFound -gt 0) {
    exit 0
} else {
    exit 1
}


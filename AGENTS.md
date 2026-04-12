# AGENTS.md

This file provides guidance to AI coding agents (Claude Code, Cursor, Copilot, etc.) when working with code in this repository.

## Repository Overview

A collection of skills for Claude Code and Claude.ai. Skills are packaged instructions and optional scripts that extend Claude's capabilities.

## Skill Authoring Best Practices

When creating or modifying skills, refer to the official best practices documentation:

https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices

Key principles:
- Be concise — Claude is already smart, only add context it doesn't have
- Set appropriate degrees of freedom for the task's fragility
- Test with the models you plan to use

## Creating a New Skill

### Directory Structure

```
{skill-name}/               # kebab-case directory name
  SKILL.md                   # Required: skill definition with YAML frontmatter
  scripts/                   # Optional: executable scripts
    {script-name}.sh         # Bash scripts (preferred)
    {script-name}.py         # Python scripts
  {supporting-files}.md      # Optional: reference docs, templates, examples
```

### Naming Conventions

- **Skill directory**: `kebab-case` (e.g., `audit-website-design`, `code-review`)
- **SKILL.md**: Always uppercase, always this exact filename
- **Scripts**: `kebab-case.sh` or `kebab-case.py` (e.g., `deploy.sh`, `analyze.py`)

### SKILL.md Format

```markdown
---
name: {skill-name}
description: {One or two sentences describing what the skill does AND when to use it. Include trigger phrases. Max 1024 characters.}
---

# {Skill Title}

{Brief description of what the skill does.}

## How It Works / Workflow

{Numbered list or sections explaining the skill's workflow}

## Usage

{Show common usage patterns and examples}

## Output

{Describe or show example output}
```

**Required frontmatter fields:**

| Field | Requirements |
|-------|-------------|
| `name` | Max 64 chars, lowercase letters/numbers/hyphens only |
| `description` | Non-empty, max 1024 chars, third-person voice ("Extracts..." not "I extract...") |

**Optional frontmatter fields:**

| Field | Description |
|-------|-------------|
| `disable-model-invocation` | `true` to prevent Claude auto-triggering (manual `/name` only) |
| `user-invocable` | `false` to hide from `/` menu (background knowledge only) |
| `allowed-tools` | Space-separated tools pre-approved when skill is active |
| `argument-hint` | Hint shown in autocomplete, e.g. `[url]` or `[filename]` |
| `effort` | Reasoning effort: `low`, `medium`, `high`, `max` |
| `context` | Set to `fork` to run in a subagent |
| `agent` | Subagent type when `context: fork` (e.g., `Explore`, `Plan`) |
| `model` | Model override when skill is active |
| `paths` | Glob patterns limiting when skill activates |

### Best Practices for Context Efficiency

Skills are loaded on-demand — only the skill name and description are loaded at startup. The full `SKILL.md` loads into context only when the agent decides the skill is relevant. To minimize context usage:

- **Keep SKILL.md under 500 lines** — put detailed reference material in separate files
- **Write specific descriptions** — helps the agent know exactly when to activate the skill
- **Use progressive disclosure** — reference supporting files that get read only when needed
- **Prefer scripts over inline code** — script execution doesn't consume context (only output does)
- **File references should be one level deep** — link directly from SKILL.md to supporting files, avoid chains of references

### Script Best Practices

- Use `#!/bin/bash` shebang and `set -e` for fail-fast behavior
- Write status messages to stderr: `echo "Message" >&2`
- Write machine-readable output (JSON) to stdout where applicable
- Include a cleanup trap for temp files
- Handle errors explicitly rather than letting Claude figure them out
- Document all constants (no "magic numbers")

### End-User Installation

**Claude Code (via skills.sh):**
```bash
# Install a specific skill
skills install {skill-name}
```

**Claude Code (manual):**
```bash
cp -r {skill-name} ~/.claude/skills/
```

**Claude.ai:**
Add the skill zip to project knowledge or paste SKILL.md contents into the conversation. If the skill requires network access, add required domains at `claude.ai/settings/capabilities`.

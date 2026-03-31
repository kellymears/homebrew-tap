# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A Homebrew tap (`kellymears/tap`) that distributes formulae for CLI tools. Users install via:

```sh
brew tap kellymears/tap
brew install tarot
```

## Repository Structure

- `Formula/*.rb` — Homebrew formula files (Ruby DSL)
- Each formula defines: source URL, SHA256, dependencies, install steps, and a test block

## Formulae

| Formula | Package            | Binaries               |
| ------- | ------------------ | ---------------------- |
| `tarot` | `arcana-cli` (npm) | `arcana`, `arcana-mcp` |

## Common Operations

### Test a formula locally

```sh
brew install --build-from-source ./Formula/tarot.rb
```

### Audit a formula for Homebrew style issues

```sh
brew audit --strict --new Formula/tarot.rb
```

### Update a formula version

1. Update `url` with the new npm tarball URL
2. Update `sha256` — compute with: `npm pack arcana-cli@<version> && shasum -a 256 arcana-cli-<version>.tgz`
3. Commit, push, and users get the update on next `brew update`

### Lint formula Ruby syntax

```sh
brew style Formula/tarot.rb
```

## Formula Conventions

- Node.js CLI formulae use the `libexec` install pattern: `system "npm", "install", *std_npm_args` installs into a private prefix, then `bin.install_symlink` exposes binaries
- `depends_on "node"` — Homebrew manages the Node.js dependency
- The `test` block must verify the installed binary works (typically `--version` check)
- Formula class name is PascalCase of the filename (e.g., `tarot.rb` → `class Tarot`)

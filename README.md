# homebrew-agent-console

Homebrew tap for Agent Console.

## Repository layout

```text
Formula/
├── agent-console.rb
└── agent-console-backend.rb
```

The tap repository is separate from the application repository:

- `agent-console` contains application source and release artifacts.
- `homebrew-agent-console` contains Homebrew formula definitions.

The `agent-console` formula installs the public frontend command. The
`agent-console-backend` formula installs the backend daemon, private tmux hook
runtime, and owns the backend `brew services` configuration.

## Usage after publishing

```bash
brew tap schinwald/agent-console
brew install schinwald/agent-console/agent-console
brew services start agent-console-backend
```

`agent-console` depends on `agent-console-backend`, so one install command provides
both the frontend CLI and backend hook runtime. Starting the backend service remains
an explicit user action.

## Release artifact layout

Each versioned macOS release supplies these universal archives, each containing
both Apple Silicon and Intel executables:

```text
agent-console-darwin-universal.tar.gz
└── bin/
    ├── agent-console-darwin-arm64
    └── agent-console-darwin-x86_64

agent-console-backend-darwin-universal.tar.gz
└── libexec/
    ├── agent-console-backend-darwin-arm64
    ├── agent-console-backend-darwin-x86_64
    ├── agent-console-backend-tmux-hook-darwin-arm64
    └── agent-console-backend-tmux-hook-darwin-x86_64
```

Formula URLs and checksums are pinned to the published Agent Console `v0.1.0`
release.

## Validation

After tapping or publishing the repository, audit its formula names through the tap:

```bash
brew audit --new --strict schinwald/agent-console/agent-console
brew audit --new --strict schinwald/agent-console/agent-console-backend
```

From a local checkout, run style checks directly on the formula files:

```bash
brew style Formula/agent-console.rb Formula/agent-console-backend.rb
```

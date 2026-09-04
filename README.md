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
brew tap OWNER/agent-console
brew install OWNER/agent-console/agent-console
brew services start agent-console-backend
```

`agent-console` depends on `agent-console-backend`, so one install command provides
both the frontend CLI and backend hook runtime. Starting the backend service remains
an explicit user action.

## Release artifact layout

Each versioned macOS release supplies these architecture-specific archives:

```text
agent-console-darwin-{arm64,x86_64}.tar.gz
└── agent-console

agent-console-backend-darwin-{arm64,x86_64}.tar.gz
└── libexec/
    ├── agent-console-backend
    └── agent-console-backend-tmux-hook
```

Formula URLs and checksums remain placeholders until Agent Console publishes
these artifacts. Replace `OWNER`, release URLs, and checksums when creating the
first release formula.

## Local validation

```bash
brew audit --new Formula/agent-console.rb
brew audit --new Formula/agent-console-backend.rb
brew style Formula/agent-console.rb Formula/agent-console-backend.rb
```

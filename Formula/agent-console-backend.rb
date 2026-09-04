class AgentConsoleBackend < Formula
  desc "Backend daemon for Agent Console"
  homepage "https://github.com/OWNER/agent-console"

  # Replace this release URL and checksum when Agent Console publishes
  # a versioned universal macOS artifact.
  url "https://github.com/OWNER/agent-console/releases/download/v0.1.0/agent-console-backend-darwin-universal.tar.gz"
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on :macos

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    libexec.install "libexec/agent-console-backend-#{arch}" => "agent-console-backend"
    libexec.install "libexec/agent-console-backend-tmux-hook-#{arch}" => "agent-console-backend-tmux-hook"
  end

  service do
    run [opt_libexec/"agent-console-backend"]
    keep_alive true
    working_dir HOMEBREW_PREFIX
    log_path var/"log/agent-console-backend.log"
    error_log_path var/"log/agent-console-backend.error.log"
  end

  test do
    assert_predicate libexec/"agent-console-backend", :executable?
    assert_predicate libexec/"agent-console-backend-tmux-hook", :executable?
  end
end

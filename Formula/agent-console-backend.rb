class AgentConsoleBackend < Formula
  desc "Backend daemon for Agent Console"
  homepage "https://github.com/OWNER/agent-console"
  version "0.1.0"
  license "MIT"

  # Replace these release URLs and checksums when Agent Console publishes
  # versioned macOS artifacts.
  on_arm do
    url "https://github.com/OWNER/agent-console/releases/download/v0.1.0/agent-console-backend-darwin-arm64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_intel do
    url "https://github.com/OWNER/agent-console/releases/download/v0.1.0/agent-console-backend-darwin-x86_64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  def install
    libexec.install Dir["libexec/*"]
    share.install "share/agent-console" if Dir.exist?("share/agent-console")
  end

  service do
    run [opt_libexec/"agent-console-backend"]
    keep_alive true
    working_dir HOMEBREW_PREFIX
    log_path var/"log/agent-console-backend.log"
    error_log_path var/"log/agent-console-backend.error.log"
  end

  test do
    assert_predicate libexec/"agent-console-backend", :exist?
    assert_predicate libexec/"agent-console-backend-tmux-hook", :exist? if (libexec/"agent-console-backend-tmux-hook").exist?
  end
end

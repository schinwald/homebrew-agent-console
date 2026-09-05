class AgentConsoleBackend < Formula
  desc "Backend daemon for Agent Console"
  homepage "https://github.com/schinwald/agent-console"

  url "https://github.com/schinwald/agent-console/releases/download/v0.1.5/agent-console-backend-darwin-universal.tar.gz"
  sha256 "1a17cc00ba64f03a87e883fd190427ca2336a6eaefe3c3c7069da8ec235208c3"
  license "MIT"

  depends_on :macos

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    libexec.install "agent-console-backend-darwin-#{arch}" => "agent-console-backend"
    libexec.install "agent-console-backend-tmux-hook-darwin-#{arch}" => "agent-console-backend-tmux-hook"
  end

  service do
    run [opt_libexec/"agent-console-backend"]
    environment_variables PATH: std_service_path_env,
                          AGENT_CONSOLE_TMUX_SOCKET: "/private/tmp/tmux-#{Process.uid}/default"
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

class AgentConsoleBackend < Formula
  desc "Backend daemon for Agent Console"
  homepage "https://github.com/schinwald/agent-console"

  url "https://github.com/schinwald/agent-console/releases/download/v0.1.1/agent-console-backend-darwin-universal.tar.gz"
  sha256 "a63172db360a26c06171bf21c59bff14495eab4946078c1ae1d3b1708d5896c9"
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

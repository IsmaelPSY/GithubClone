defmodule GithubClone.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GithubCloneWeb.Telemetry,
      GithubClone.Repo,
      {DNSCluster, query: Application.get_env(:github_clone, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GithubClone.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: GithubClone.Finch},
      # Start a worker by calling: GithubClone.Worker.start_link(arg)
      # {GithubClone.Worker, arg},
      # Start to serve requests, typically the last entry
      GithubCloneWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GithubClone.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GithubCloneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

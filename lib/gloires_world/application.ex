defmodule GloiresWorld.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GloiresWorldWeb.Telemetry,
      GloiresWorld.Repo,
      {DNSCluster, query: Application.get_env(:gloires_world, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GloiresWorld.PubSub},
      # Start a worker by calling: GloiresWorld.Worker.start_link(arg)
      # {GloiresWorld.Worker, arg},
      # Start to serve requests, typically the last entry
      GloiresWorldWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GloiresWorld.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GloiresWorldWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

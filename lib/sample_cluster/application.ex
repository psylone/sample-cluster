defmodule SampleCluster.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Cluster.Supervisor, cluster_options()},
      {Plug.Cowboy, plug_options()}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SampleCluster.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp cluster_options do
    [
      Application.get_env(:libcluster, :topologies),
      [name: SampleCluster.ClusterSupervisor]
    ]
  end

  defp plug_options do
    [
      scheme: :http,
      plug: SampleCluster.Router,
      options: [port: Application.fetch_env!(:sample_cluster, :port)]
    ]
  end
end

defmodule SampleCluster.MixProject do
  use Mix.Project

  def project do
    [
      app: :sample_cluster,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SampleCluster.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.5.2"},
      {:libcluster, "~> 3.3.1"},
      {:horde, "~> 0.8.7"}
    ]
  end
end

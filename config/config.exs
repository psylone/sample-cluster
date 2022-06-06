import Config

config :libcluster,
  topologies: [
    sample: [
      strategy: Cluster.Strategy.Gossip
    ]
  ]

config :sample_cluster,
  port: System.get_env("PORT", "4000") |> String.to_integer

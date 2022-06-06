defmodule SampleCluster.User.Account do
  use Agent

  alias SampleCluster.User.AccountRegistry

  @initial_value %{}

  def start_link(opts) do
    name = Keyword.fetch!(opts, :name)

    Agent.start_link(fn -> @initial_value end, name: via_tuple(name))
  end

  def put(name, key, value) do
    Agent.update(via_tuple(name), fn current_value ->
      Map.put(current_value, key, value)
    end)
  end

  def get(name, key) do
    Agent.get(via_tuple(name), fn current_value ->
      current_value[key]
    end)
  end

  defp via_tuple(name) do
    {:via, Horde.Registry, {AccountRegistry, name}}
  end
end

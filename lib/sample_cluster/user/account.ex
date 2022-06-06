defmodule SampleCluster.User.Account do
  use Agent

  @initial_value %{}

  def start_link(opts) do
    name = Keyword.fetch!(opts, :name)

    Agent.start_link(fn -> @initial_value end, name: name)
  end

  def put(name, key, value) do
    Agent.update(name, fn current_value ->
      Map.put(current_value, key, value)
    end)
  end

  def get(name, key) do
    Agent.get(name, fn current_value ->
      current_value[key]
    end)
  end
end

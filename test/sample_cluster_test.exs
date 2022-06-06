defmodule SampleClusterTest do
  use ExUnit.Case
  doctest SampleCluster

  test "greets the world" do
    assert SampleCluster.hello() == :world
  end
end

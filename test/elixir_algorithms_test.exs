defmodule ElixirAlgorithmsTest do
  use ExUnit.Case
  doctest ElixirAlgorithms

  test "greets the world" do
    assert ElixirAlgorithms.hello() == :world
  end
end

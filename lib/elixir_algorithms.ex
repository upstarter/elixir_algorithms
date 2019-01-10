defmodule ElixirAlgorithms do
  @moduledoc """
  Documentation for ElixirAlgorithms.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirAlgorithms.hello()
      :world

  """
  alias Timed

  def run do
    Timed.inspect(QuickSort, :sort, [3_999_999, 0, 37, 97, 555, 3_945])
  end
end

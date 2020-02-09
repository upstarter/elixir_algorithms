defmodule EnumHelper do
  def permutations([]), do: [[]]

  def permutations(list) do
    for head <- list, tail <- permutations(list -- [head]), do: [head | tail]
  end
end

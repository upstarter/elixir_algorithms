defmodule QuickSort do
  def sort([]), do: []

  def sort([head | tail]) do
    {lesser, greater} = Enum.split_with(tail, &(&1 < head))
    sort(lesser) ++ [head] ++ sort(greater)
  end
end

IO.inspect(QuickSort.sort([1, 6, 3, 4, 2, 5]))

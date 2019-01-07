defmodule MergeSort do
  def sort([]), do: []
  def sort([x]), do: [x]

  def sort(l) do
    f = Enum.take_every(l, 2)
    s = Enum.drop_every(l, 2)
    merge(sort(f), sort(s), [])
  end

  def merge(f, [], r), do: r ++ f
  def merge([], s, r), do: r ++ s

  def merge(f = [fh | ft], s = [sh | st], r) do
    cond do
      fh < sh -> merge(ft, s, r ++ [fh])
      true -> merge(f, st, r ++ [sh])
    end
  end
end

IO.inspect(MergeSort.sort([1, 6, 3, 4, 2, 5, 20, 14, 13, 7, 10, 8]))

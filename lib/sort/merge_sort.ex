defmodule MergeSort do
  def ms([]), do: []
  def ms([x]), do: [x]

  def ms(l) do
    f = Enum.take_every(l, 2)
    s = Enum.drop_every(l, 2)
    merge(ms(f), ms(s), [])
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

defmodule NaiveBubbleSort do
  def call([]), do: []
  def call(list), do: call(list, 0, length(list) - 1, true)
  def call(list, idx, last_idx, false) when last_idx == idx, do: list |> call
  def call(list, idx, last_idx, true) when last_idx == idx, do: list

  def call(list, idx, last_idx, done) do
    {a, b} = values_to_compare(list, idx)

    {list, done} = process(list, idx, a, b, done)
    list |> call(idx + 1, last_idx, done)
  end

  defp values_to_compare(list, idx) do
    {Enum.at(list, idx), Enum.at(list, idx + 1)}
  end

  defp process(list, idx, a, b, _done) when a > b do
    {list |> swap_values(idx, a, b), false}
  end

  defp process(list, _idx, _a, _b, done), do: {list, done}

  defp swap_values(list, idx, a, b) do
    list |> List.replace_at(idx + 1, a) |> List.replace_at(idx, b)
  end
end

defmodule BubbleSort do
  def call([]), do: []
  def call(list), do: call(list, [], true)

  def call([a, b | list], acc, _) when a > b, do: call([a | list], [b | acc], false)
  def call([a, b | list], acc, done), do: call([b | list], [a | acc], done)
  def call([a], acc, true), do: [a | acc] |> Enum.reverse()
  def call([a], acc, false), do: [a | acc] |> Enum.reverse() |> call
end

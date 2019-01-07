defmodule ParallelMergeSort do
  def merge(list1, list2, acc \\ [])
  def merge([], [], acc), do: acc
  def merge([], list, acc), do: acc ++ list
  def merge(list, [], acc), do: acc ++ list

  def merge([head1 | tail1], [head2 | tail2], acc) do
    if head1 >= head2 do
      merge([head1 | tail1], tail2, acc ++ [head2])
    else
      merge(tail1, [head2 | tail2], acc ++ [head1])
    end
  end

  def split(list, acc \\ [[], []])
  def split([], acc), do: acc

  def split([x], [left, right]) do
    [[x | left], right]
  end

  def split([x | [y | tail]], [left, right]) do
    split(tail, [[x | left], [y | right]])
  end

  @doc """
    Sorts the numbers

    iex> ParallelMergeSort.sort([5, 4, 3, 2, 1])
    [1, 2, 3, 4, 5]
  """
  def sort([]), do: []
  def sort([a]), do: [a]

  def sort(list) do
    [left, right] = split(list)
    merge(sort(left), sort(right))
  end

  def psort(parent_id, []) do
    send(parent_id, {self(), []})
  end

  def psort(parent_id, [a]) do
    send(parent_id, {self(), [a]})
  end

  def psort(parent_id, list) do
    sorted =
      split(list)
      |> Enum.map(fn half ->
        # dispatch mergesort on the half to a
        # spawned version of itself()
        # IO.inspect(half)
        spawn_link(ParallelMergeSort, :psort, [self(), half])
      end)
      |> Enum.map(fn pid ->
        # recieve a message from the pid
        receive do
          {^pid, sorted_half} ->
            sorted_half
        after
          1000 ->
            IO.puts('error')
        end
      end)
      |> (fn [left, right] ->
            merge(left, right)
          end).()

    send(parent_id, {self(), sorted})
  end

  def parallel_sort(list) do
    pid = spawn_link(ParallelMergeSort, :psort, [self(), list])

    receive do
      {^pid, sorted} ->
        sorted
    after
      1000 ->
        {:error}
    end
  end
end

IO.inspect(ParallelMergeSort.sort([1, 6, 3, 4, 2, 5, 20, 14, 13, 7, 10, 8]))

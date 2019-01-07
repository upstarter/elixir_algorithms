defmodule RandomSearch do
  def objective_function(vector) do
    Enum.reduce(vector, 0, fn x, sum ->
      sum + :math.pow(x, 2)
    end)
  end

  def random_vector(minmax) do
    for j <- minmax do
      n = (Enum.at(j, 1) - Enum.at(j, 0)) * :rand.uniform()
      Enum.at(j, 0) + n
    end
  end

  def search(search_space, max_iter) do
    candidate = %{}
    best = nil
    do_search(search_space, candidate, max_iter, best)
  end

  def do_search(search_space, candidate, max_iter, best) when max_iter > 0 do
    candidate = Map.put(candidate, :vector, random_vector(search_space))
    candidate = Map.put(candidate, :cost, objective_function(candidate[:vector]))
    best = if best == nil or candidate[:cost] < best[:cost], do: candidate, else: best

    IO.inspect("Iteration #{max_iter}, best=#{best[:cost]}")

    do_search(search_space, candidate, max_iter - 1, best)
  end

  def do_search(search_space, candidate, max_iter, best) when max_iter < 1, do: best
end

# problem configuration
problem_size = 2
search_space = for i <- 1..problem_size, do: [5, -5]
# algorithm configuration
max_iter = 100
# execute the algorithm
best = RandomSearch.search(search_space, max_iter)

IO.puts("Done. Best Solution:")
IO.puts("c=#{best[:cost]}")
IO.write("v=")
IO.inspect(best[:vector])

defmodule AdaptiveRandomSearch do
  def objective_function(vector) do
    Enum.reduce(vector, 0, fn x, sum ->
      sum + :math.pow(x, 2)
    end)
  end

  def rand_in_bounds(min, max) do
    min + (max - min) * :rand.uniform()
  end

  def random_vector(minmax) do
    for j <- minmax do
      rand_in_bounds(Enum.at(j, 0), Enum.at(j, 1))
    end
  end

  def take_step(minmax, current, step_size) do
    for {j, i} <- Enum.with_index(current) do
      min = Enum.max(Enum.at(minmax, 0), Enum.at(current, i) - step_size)
      max = Enum.min(Enum.at(minmax, 1), Enum.at(current, i) + step_size)
      rand_in_bounds(min, max)
    end
  end

  def large_step_size(iter, options) do
    if iter > 0 and rem(options[:iter_mult], iter) == 0 do
      options[:step_size] * options[:l_factor]
    else
      options[:step_size] * options[:s_factor]
    end
  end

  def take_steps(bounds, current, step_size, big_stepsize) do
    {step, big_step} = {%{}, %{}}

    step = Map.put(step, :vector, take_step(bounds, current[:vector], step_size))
    step = Map.put(step, :cost, objective_function(step[:vector]))
    big_step = Map.put(big_step, :vector, take_step(bounds, current[:vector], big_stepsize))
    big_step = Map.put(big_step, :cost, objective_function(big_step[:vector]))
    {step, big_step}
  end

  def search(bounds, options, max_iter) do
    elem1 = Enum.at(Enum.at(bounds, 0), 1)
    elem0 = Enum.at(Enum.at(bounds, 0), 0)
    step_size = (elem1 - elem0) * options[:init_factor]
    options = Map.put(options, :step_size, step_size)

    current = %{}
    current = Map.put(current, :vector, random_vector(bounds))
    current = Map.put(current, :cost, objective_function(current[:vector]))

    do_search(bounds, current, options, 0, max_iter)
  end

  def do_search(bounds, current, options, count, max_iter) when max_iter > 0 do
    big_stepsize = large_step_size(max_iter, options)
    {step, big_step} = take_steps(bounds, current, options[:step_size], big_stepsize)

    {current, count, options} =
      if step[:cost] <= current[:cost] or big_step[:cost] <= current[:cost] do
        {step_size, current} =
          if big_step[:cost] <= step[:cost] do
            {big_stepsize, big_step}
          else
            {options[:step_size], step}
          end

        options = %{options | step_size: step_size}
        count = 0
        {current, count, options}
      else
        {count, step_size} =
          if count >= options[:max_no_impr] do
            div = options[:step_size] / options[:s_factor]
            {0, div}
          else
            {count + 1, options[:step_size]}
          end

        options = %{options | step_size: step_size}
        {current, count, options}
      end

    IO.inspect("Iteration #{max_iter}, best=#{current[:cost]}")
    do_search(bounds, current, options, count, max_iter - 1)
  end

  def do_search(bounds, current, options, count, max_iter) when max_iter < 1,
    do: current
end

# problem configuration
problem_size = 2
bounds = for i <- 1..problem_size, do: [5, -5]

# algorithm configuration
options = %{
  init_factor: 0.05,
  s_factor: 1.3,
  l_factor: 3.0,
  iter_mult: 10,
  max_no_impr: 30
}

max_iter = 1000

# execute the algorithm
best =
  AdaptiveRandomSearch.search(
    bounds,
    options,
    max_iter
  )

IO.puts("Done. Best Solution:")
IO.puts("c=#{best[:cost]}")
IO.write("v=")
IO.inspect(best[:vector])

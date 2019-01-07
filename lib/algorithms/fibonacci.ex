# tail call optimized
defmodule TCOFibonacci do
  def fib(0), do: 1
  def fib(1), do: 1
  def fib(n), do: fib(1, 1, n)

  def fib(last, _prev, 1), do: last
  def fib(last, prev, n), do: fib(last + prev, last, n - 1)
end

# returning sequence
defmodule Fibonacci do
  def find(nth) do
    list = [1, 1]
    fib(list, nth)
  end

  def fib(list, 2) do
    Enum.reverse(list)
  end

  def fib(list, n) do
    fib([hd(list) + hd(tl(list))] ++ list, n - 1)
  end
end

# mix run fibonacci.ex
Benchee.run(%{
  "Tail Call Optimized Fibonacci" => fn -> TCOFibonacci.fib(40) end,
  "Sequence Fibonacci" => fn -> Fibonacci.find(40) end
})

IO.puts(TCOFibonacci.fib(25))
IO.inspect(Fibonacci.find(25))

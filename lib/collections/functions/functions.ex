sum = fn a, b -> a + b end
sum.(2, 3)
# 5

# The & Shorthand
# Using anonymous functions is such a common practice in Elixir there is shorthand for doing so:
sum = &(&1 + &2)
sum.(2, 3)
# 5

# Lambdas
square = fn n -> n * n end
square.(20)
# & syntax
square = &(&1 * &1)
square.(20)
square = &Math.square/1

# Running
fun.(args)
apply(fun, args)
apply(module, fun, args)

# Function heads
# def join(a, b \\ nil)
# def join(a, b), when is_nil(b) do: a
# def join(a, b), do: a <> b

# Piping Anonymous functions
# We can pass the anonymous functions in two ways. One is directly using &like following..

[1, 2, 3, 4, 5]
|> length()
|> (&(&1 * &1)).()

# This is the a bit awkward. How ever, we can use the reference of the anonymous function by giving a name.

square = &(&1 * &1)

[1, 2, 3, 4, 5]
|> length()
|> square.()

# operators are macros, thus can be lambdas
Enum.reduce([1, 2, 3], 0, &+/2)
# 6
Enum.reduce([1, 2, 3], 0, &*/2)
# 0
Enum.reduce([1, 2, 3], 3, &*/2)
# 18
Enum.reduce([1, 2, 3], 3, &-/2)
# -1
Enum.reduce([1, 2, 3], 3, &//2)
# 0.5

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

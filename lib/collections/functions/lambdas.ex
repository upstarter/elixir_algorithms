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

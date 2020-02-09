# TERNARY
"no" = if 1 == 0, do: "yes", else: "no"

# CASE
case {1, 2, 3} do
  {4, 5, 6} ->
    "This clause won't match"

  {1, x, 3} ->
    "This will match and bind x to 2"

  _ ->
    "This will match any value"
end

# COND
cond do
  1 + 1 == 3 ->
    "I will never be seen"

  2 * 5 == 12 ->
    "Me neither"

  true ->
    "But I will (this is essentially an else)"
end

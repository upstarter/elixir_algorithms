# binary pattern matching
value =
  "$34.56"
  |> String.split("$")
  |> tl
  |> List.first()
  |> String.to_float()

# 34.56
# Tip Approach
# This tip makes my day easy. I recently used this is in one of my projects.
"$" <> value = "$34.56"
# "$34.56"
String.to_float(value)
# 34.56

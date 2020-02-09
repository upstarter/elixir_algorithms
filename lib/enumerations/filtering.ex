user_and_programming_languages = %{john: "elixir", latha: "elixir", hari: "erlang", toy: "perl"}

# filtering with == and other operators
user_and_programming_languages
|> Enum.filter(fn {_, lang} -> lang == "elixir" end)

# [john: "elixir", latha: "elixir"]

# OR, using match? for pattern based
user_and_programming_languages
|> Enum.filter(&match?({_, "elixir"}, &1))

# [john: "elixir", latha: "elixir"]

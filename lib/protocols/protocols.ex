defprotocol Blank do
  @doc "Returns true if data is considered blank/empty"
  def blank?(data)
end

defimpl Blank, for: List do
  def blank?([]), do: true
  def blank?(_), do: false
end

# → true
Blank.blank?([])

defimpl Blank, for: Any do
end

defmodule User do
  # Falls back to Any
  @derive Blank
  defstruct name: ""
end

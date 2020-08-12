defmodule GrandAbstraction do
  # ultrabridge which operates on bridge(s)
end

# Abstraction/Implementations Duals
defmodule Abstraction do
  def implementor do
  end
end

defmodule Implementation do
  def implement do
    # strategy which operates on composites
  end
end

# BRIDGE:
## Concrete Implementations
defmodule BasicTimeData do
  # def initialize(state.hour, minutes) do
  #  state.hour     = hour
  #  state.minutes  = minutes
  # end

  def formatted_output do
    "Time is #{state.hour}:#{state.minutes}"
  end
end

defmodule TimeWithMeridianData do
  def formatted_output do
    "Time is #{state.hour}:#{state.minutes} #{state.meridian}"
  end
end

## Bridge

defmodule TimeFormatter do
  def __init__(opts) do
  end

  def to_s do
    state.time_data.formatted_output
  end
end

## Abstract Objects linked to Concrete Implementations through Bridge

defmodule BasicTime do
  # use TimeFormatter

  # def initialize(*a, &b)
  #   state.time_data = BasicTimeData.new(*a, &b)
  # end
end

defmodule TimeWithMeridian do
  # use TimeFormatter

  # def initialize(*a, &b)
  #   state.time_data = TimeWithMeridianData.new(*a, &b)
  # end
end

## Example Usage

time1 = BasicTime.new("10", "30")
time2 = TimeWithMeridian.new("10", "30", "PM")

IO.puts(time_1)
IO.puts(time_2)

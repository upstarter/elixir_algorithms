defmodule Publisher do
  use GenStage

  def start_link() do
    GenStage.start_link(Publisher, 0, name: Publisher)
  end

  def init(counter) do
    {:producer, counter}
  end

  def handle_demand(demand, 6) when demand > 0 do
    # Stop everything when the state reaches 6. i.e. 5 iterations
    System.halt(0)
    {:stop, :normal}
  end

  def handle_demand(demand, counter) when demand > 0 do
    # return the incremented counter
    {:noreply, [counter + 1], counter + 1}
  end
end

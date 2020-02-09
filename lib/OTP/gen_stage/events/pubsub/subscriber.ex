defmodule Subscriber do
  use GenStage

  def start_link() do
    GenStage.start_link(Subscriber, :ok)
  end

  def init(:ok) do
    {:consumer, :na, subscribe_to: [{PubSub, max_demand: 1}]}
  end

  def handle_events(events, _from, state) do
    Process.sleep(250)

    IO.puts(events)

    {:noreply, [], state}
  end
end

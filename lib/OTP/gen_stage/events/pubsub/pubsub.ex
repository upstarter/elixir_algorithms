defmodule PubSub do
  use GenStage

  def start_link() do
    GenStage.start_link(PubSub, :ok, name: PubSub)
  end

  def init(:ok) do
    {:producer_consumer, :na, subscribe_to: [{Publisher, max_demand: 1}]}
  end

  @doc """
  any number of “events” can be returned. It’s only when the list of “events”
  has been depleted that demand will be sent up to the producer module.

  5 five items produced in the Publisher module, but ended up
  outputting 50 items showing that we are not limited to a mere 1:1 relationship
  between producer, publisher_consumer, and consumer, but rather a 1:n
  relationship. As more publisher_consumers are added to the flow, the
  relationship changes to a 1:n:n, vastly increasing what’s possible.
  """
  def handle_events([event], _from, state) do
    events = Enum.map(1..10, &"#{event} :: #{&1}")

    {:noreply, events, state}
  end
end

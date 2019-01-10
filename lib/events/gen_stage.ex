"""
Behaviour for exchanging events with back-pressure between Elixir processes

• Event Driven Architectures

• Back Pressure.
possible to define how many concurrent writes to the database to prevent
overloading our db or cause outages on data storage during peak moments, or
for some other unexpected reason.

• Load Shedding. so that during peak time we can ignore less important
events to preserve system health
"""

defmodule Producer do
  use GenStage

  def init(arg) do
    {:producer, :some_kind_of_state}
  end

  def handle_demand(demand, state) do
    {:noreply, things = [:whatever, :you, :want], state}
  end
end

defmodule ProducerConsumer do
  use GenStage

  def init(arg) do
    {:producer_consumer, :some_kind_of_state}
  end

  def handle_events(things, from, state) do
    {:noreply, things, state}
  end
end

defmodule Consumer do
  use GenStage

  def init(arg) do
    {:consumer, :some_kind_of_state}
  end

  def handle_events(things, from, state) do
    {:noreply, [], state}
  end
end

defmodule Go do
  def go do
    {:ok, producer} = GenStage.start_link(Producer, arg = :nonsense)
    {:ok, prod_con} = GenStage.start_link(ProducerConsumer, arg = :nonsense)
    {:ok, consumer} = GenStage.start_link(Consumer, arg = :nonsense)

    GenStage.sync_subscribe(prod_con, to: producer)
    GenStage.sync_subscribe(consumer, to: prod_con)
  end
end

defmodule EventSourcing.AnalysisProgress.EventAggregator do
  def start_link(event) do
    Task.start_link(fn ->
      # (example, not real code here) Saves to the database
      AnalysisProgress.save(event)
    end)
  end
end

defmodule EventSourcing.AnalysisProgress.EventConsumer do
  use ConsumerSupervisor

  alias EventSourcing.AnalysisProgress.EventStore
  alias EventSourcing.AnalysisProgress.EventAggregator

  def start_link(%{producer: EventStore, processor: EventAggregator}) do
    children = [
      worker(processor, [], restart: :temporary)
    ]

    ConsumerSupervisor.start_link(children,
      strategy: :one_for_one,
      subscribe_to: [
        {
          producer,
          # backpressure parameters
          # perform stress testing to find the proper configuration to your needs
          min_demand: 1, max_demand: 192
        }
      ]
    )
  end
end

<!--

If all you want is concurrency, starting multiple instances of the same stage is enough. Layers in GenStage must be created when there is a need for back-pressure or to route the data in different ways.

For example, if you need the data to go over multiple steps but without a need for back-pressure or without a need to break the data apart, do not design it as such:

[Producer] -> [Step 1] -> [Step 2] -> [Step 3]

Instead it is better to design it as:

             [Consumer]
            /
[Producer]-<-[Consumer]
            \
             [Consumer]

where “Consumer” are multiple processes running the same code that subscribe to the same “Producer”.

Data Transformation Pipeline — Map/Reduce topologies. Producers don’t have to be simple number generators. We could produce events from a database or even another source like Apache’s Kafka. With a combination of producer-consumers and consumers, we could process, sort, catalog, and store metrics as they become available.

Work Queue — Since events can be anything, we could produce works of unit to be completed by a series of consumers.

Event Processing — Similar to a data pipeline, we could receive, process, sort, and take action on events emitted in real time from our sources.

Using Event Sourcing:

When you need an audit log of every event in the system or micro service as opposed to only the current state of the system.

When you need Event Replay: We replay events in the system with updated application logic to correct incorrect processing of events. Useful for fixing bugs in code and then doing a replay to correct the data.

When you need to be able to reverse events.

When you want to use the Event Log for debugging.

When it’s valuable to expose the Event Log to support personnel to fix account specific issues by knowing exactly how the account got into a compromised state.

When you want to create test environments from the event log. Having the event log can allow you to create environments based on the state of the system at different points in time by replaying only a subset of events.

-->

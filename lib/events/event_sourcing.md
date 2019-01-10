<!--
When to use event sourcing pattern:

When you need an audit log of every event in the system or micro service as opposed to only the current state of the system.

When you need Event Replay: We replay events in the system with updated application logic to correct incorrect processing of events. Useful for fixing bugs in code and then doing a replay to correct the data.

When you need to be able to reverse events.

When you want to use the Event Log for debugging.

When it’s valuable to expose the Event Log to support personnel to fix account specific issues by knowing exactly how the account got into a compromised state.

When you want to create test environments from the event log. Having the event log can allow you to create environments based on the state of the system at different points in time by replaying only a subset of events.

-->

queue = :queue.new()
# {[], []}
queue = :queue.in(1, queue)
# {[1], []}
queue = :queue.in(2, queue)
# {[2], [1]}
queue = :queue.in(3, queue)
# {[3, 2], [1]}
:queue.out(queue)
# {{:value, 1}, {[3], [2]}}
{{:value, head}, queue} = :queue.out(queue)
# {{:value, 1}, {[3], [2]}}
IO.puts(head)
# 1
{{:value, head}, queue} = :queue.out(queue)
# {{:value, 2}, {[], [3]}}
IO.puts(head)
# 2
{{:value, head}, queue} = :queue.out(queue)
# {{:value, 3}, {[], []}}
IO.puts(head)
# 3
:queue.out(queue)
# {:empty, {[], []}}

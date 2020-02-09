list = [{:name, "John"}, {:age, 15}]
list[:name]
# For string-keyed keyword lists
list = [{"size", 2}, {"type", "shoe"}]
# → {"size", 2}
List.keyfind(list, "size", 0)

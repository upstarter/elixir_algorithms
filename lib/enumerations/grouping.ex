hotel_bookings = [
  %{name: "John", country: "usa", booking_status: :success},
  %{name: "Hari", country: "india", booking_status: :fail},
  %{name: "Mahesh", country: "austria", booking_status: :pending},
  %{name: "Ruchi", country: "paris", booking_status: :success},
  %{name: "Nitesh", country: "malasia", booking_status: :success},
  %{name: "Manoj", country: "japan", booking_status: :fail},
  %{name: "Akhilesh", country: "china", booking_status: :pending},
  %{name: "Rajesh", country: "india", booking_status: :fail},
  %{name: "Payal", country: "london", booking_status: :success},
  %{name: "Kumar", country: "france", booking_status: :fail}
]

# Let’s group the things.

IO.inspect(Enum.group_by(hotel_bookings, &Map.get(&1, :booking_status)))
#
# %{
#   fail: [
#     %{booking_status: :fail, country: "india", name: "Hari"},
#     %{booking_status: :fail, country: "japan", name: "Manoj"},
#     %{booking_status: :fail, country: "india", name: "Rajesh"},
#     %{booking_status: :fail, country: "france", name: "Kumar"}
#   ],
#   pending: [
#     %{booking_status: :pending, country: "austria", name: "Mahesh"},
#     %{booking_status: :pending, country: "china", name: "Akhilesh"}
#   ],
#   success: [
#     %{booking_status: :success, country: "usa", name: "John"},
#     %{booking_status: :success, country: "paris", name: "Ruchi"},
#     %{booking_status: :success, country: "malasia", name: "Nitesh"},
#     %{booking_status: :success, country: "london", name: "Payal"}
#   ]
# }

# This is well and good but I need only name in the list instead of map. I mean some thing like %{fail: ["Hari", "Manoj"], ...}

# We just need to tell the group_by what to return in return of grouping

IO.inspect(Enum.group_by(hotel_bookings, &Map.get(&1, :booking_status), &Map.get(&1, :name)))

# %{
#   fail: ["Hari", "Manoj", "Rajesh", "Kumar"],
#   pending: ["Mahesh", "Akhilesh"],
#   success: ["John", "Ruchi", "Nitesh", "Payal"]
# }

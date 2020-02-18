string = "Hello aionlabs! Medium-is-5*"
String.split(string, [" ", "!", "-", "*"])
# output
# ["Hello", "aionlabs", "", "Medium", "is", "5", ""]

# Checking the closeness of strings
# You can find the distance between the two strings using String.jaro_distance/2. This gives a float value in the range 0..1 Taking the 0 for no close and 1 is for exact closeness.

String.jaro_distance("ping", "pong")
# 0.8333333333333334

String.jaro_distance("color", "colour")
# 0.9444444444444445
String.jaro_distance("foo", "foo")
# 1.0

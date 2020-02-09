# We all know that = does the pattern match for left and right side. We cannot do [a, b, c] = [1, 2, 3, 4] this raise a MatchError

[a, b, c] = [1, 2, 3, 4]
# ** (MatchError) no match of right hand side value: [1, 2, 3, 4]
# We can use destructure/2 to do the job.

destructure [a, b, c], [1, 2, 3, 4]
# [1, 2, 3]
{a, b, c}
# {1, 2, 3}

using Algorithm101
using Test

filename = [
    "mergesort",
    "quicksort",
    "binarysearch",
]

for f in filename
    teststr = "# Test '$(f)' #"
    len = length(teststr)
    teststr = "\n$("#"^len)\n$(teststr)\n$("#"^len)\n"
    @info teststr

    fname = string(f, ".jl")
    include(fname)
end

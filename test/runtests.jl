using Algorithm101
using Test

filename = [
    "mergesort",
]

for f in filename
    fname = string(f, ".jl")
    include(fname)
end

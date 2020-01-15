using Algorithm101
using Test

filename = [
    "mergesort",
]

for f in filename
    @info "\n
        ##########\n
        $(f)\n
        ##########"
    fname = string(f, ".jl")
    include(fname)
end

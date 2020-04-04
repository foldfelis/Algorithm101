using Algorithm101
using Test

filename = [
    "merge_sort",
    "quick_sort",
    "binary_search",
    "tree_traverse",
    "binary_search_tree",
    "bfs",
    "dfs",
    "topological_sort",
]

for f in filename
    teststr = "# Test '$(f)' #"
    len = length(teststr)
    teststr = "\n$("#"^len)\n$(teststr)\n$("#"^len)\n"
    println()
    @info teststr

    fname = string(f, ".jl")
    include(fname)
end

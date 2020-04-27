filename = [
    "merge_sort",
    "quick_sort",
    "binary_search",
    "tree_traverse",
    "binary_search_tree",
    "bfs",
    "dfs",
    "topological_sort",
    "monte_carlo_integral"
]

for f in filename
    teststr = "# Test '$(f)' #"
    len = length(teststr)
    teststr = "\n$("#"^len)\n$(teststr)\n$("#"^len)\n"
    println()
    @info teststr

    include("$(f).jl")
end

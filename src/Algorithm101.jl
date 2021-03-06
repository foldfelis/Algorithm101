module Algorithm101

    filename = [
        "max_subarray",
        "merge_sort",
        "quick_sort",
        "binary_search",
        "tree_traverse",
        "binary_search_tree",
        "bfs",
        "dfs",
        "topological_sort",
        "monte_carlo_integral",
        "mcm",
        "mst",
    ]

    for f in filename
        include("$(f).jl")
    end

end # module

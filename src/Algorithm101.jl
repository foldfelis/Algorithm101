module Algorithm101

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
        include("$(f).jl")
    end

end # module

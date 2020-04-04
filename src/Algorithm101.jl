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
        fname = string(f, ".jl")
        include(fname)
    end
end # module

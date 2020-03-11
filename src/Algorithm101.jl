module Algorithm101
    import Base: push!, length, pushfirst!, deleteat!, insert!,
        maximum, minimum, getindex
    using DataStructure101: value, BinaryTree, root, TreeNode, NullNode,
        leftchild, rightchild, Graph, neighbor

    export
    # MergeSort
    merge_sort,

    # QuickSort
    quick_sort!,

    # BinarySearch
    binary_search,

    # TreeTraverse
    preorder,
    inorder,
    posorder,

    # BinarySearchTree
    find,
    insert!,
    maximum,
    minimum,
    getindex,

    # BFS
    bfs,

    # DFS
    dfs

    filename = [
        "mergesort",
        "quicksort",
        "binarysearch",
        "treetraverse",
        "binarysearchtree",
        "bfs",
        "dfs",
    ]

    for f in filename
        fname = string(f, ".jl")
        include(fname)
    end
end # module

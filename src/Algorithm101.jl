module Algorithm101
    import Base: push!, length, pushfirst!, deleteat!
    using DataStructure101: value, BinaryTree, root, TreeNode, NullNode,
        leftchild, rightchild

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
    posorder


    filename = [
        "mergesort",
        "quicksort",
        "binarysearch",
        "treetraverse",
    ]

    for f in filename
        fname = string(f, ".jl")
        include(fname)
    end
end # module

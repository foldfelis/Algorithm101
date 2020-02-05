module Algorithm101
    import Base: push!, length, pushfirst!, deleteat!

    export
    # MergeSort
    merge_sort,

    # QuickSort
    quick_sort!,

    # BinarySearch
    binary_search

    filename = [
        "mergesort",
        "quicksort",
        "binarysearch",
    ]

    for f in filename
        fname = string(f, ".jl")
        include(fname)
    end
end # module

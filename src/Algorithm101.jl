module Algorithm101
    import Base: push!, length, pushfirst!, deleteat!

    export
    # MergeSort
    merge_sort,

    # QuickSort
    quick_sort

    filename = [
        "mergesort",
        "quicksort",
    ]

    for f in filename
        fname = string(f, ".jl")
        include(fname)
    end
end # module

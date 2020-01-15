module Algorithm101
    import Base: push!, length

    export

    merge_sort

    filename = [
        "mergesort",
    ]

    for f in filename
        fname = string(f, ".jl")
        include(fname)
    end
end # module

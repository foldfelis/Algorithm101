function quick_sort!(arr::Vector, h::Int64, t::Int64)
    len = t-h+1
    if len < 2
        return arr
    end

    n, i = h, h
    pivot = arr[t]
    for n = h:t
        if arr[n] <= pivot
            arr[i], arr[n] = arr[n], arr[i]
            i += 1
        end
    end

    if i > t
        i = t
    end

    quick_sort!(arr, h, i-1)
    quick_sort!(arr, i, t)

    return arr
end

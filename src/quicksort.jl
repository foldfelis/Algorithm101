function quick_sort(arr::Vector, h::Int64, t::Int64)
    len = t-h+1
    if len < 2
        return arr
    end

    n, i = h, h
    pivot = arr[t]
    while n <= t
        if arr[n] <= pivot
            arr[i], arr[n] = arr[n], arr[i]
            i += 1
        end
        n += 1
    end

    if i > t
        i = t
    end

    arr = quick_sort(arr, h, i-1)
    arr = quick_sort(arr, i, t)

    return arr
end

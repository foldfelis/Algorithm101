export quick_sort!, hoare_qsort!

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

function hoare_qsort!(arr::Vector, p::Int64, r::Int64)
    if p >= r
        return arr
    end
    x = arr[p]
    i = p - 1
    j = r + 1
    while true
        j -= 1
        while arr[j] > x
            j -= 1
        end
        i += 1
        while arr[i] < x
            i += 1
        end

        if i < j
            arr[i], arr[j] = arr[j], arr[i]
        else
            break
        end
    end

    hoare_qsort!(arr, p, j);
    hoare_qsort!(arr, j+1, r);

    return arr
end

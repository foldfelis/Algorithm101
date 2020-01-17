function quick_sort(arr::Vector)
    len = length(arr)
    if len < 2 return arr end

    pivote = 1
    i = 2
    while i <= len
        data = arr[i]
        if data < arr[pivote]
            deleteat!(arr, i)
            pushfirst!(arr, data)
            pivote += 1
        else
            i += 1
        end
    end

    arr1 = quick_sort(arr[1:pivote])
    arr2 = quick_sort(arr[pivote+1:end])
    arr = append!(arr1, arr2)

    return arr
end

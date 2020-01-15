function merge_sort(array::Vector)
    divided = divide(array)

    if length(divided) > 1
        merged1 = merge_sort(divided[1])
        merged2 = merge_sort(divided[2])

        merged = merge(merged1, merged2)
    else
        merged = divided
    end

    return merged
end

function divide(array::Vector)
    if length(array) > 1
        split = trunc(Int64, length(array)/2)
        arr1 = array[1:split]
        arr2 = array[split+1:end]
        return (arr1, arr2)
    end

    return array
end

function merge(arr1::Vector, arr2::Vector)
    # TODO:　Implement merge
    
    return (append!(arr1, arr2))
end

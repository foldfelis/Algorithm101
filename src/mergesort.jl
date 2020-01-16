function merge_sort(array::Vector)
    if length(array) > 1
        divided = divide(array)
        merged1 = merge_sort(divided[1])
        merged2 = merge_sort(divided[2])
        merged = merge(merged1, merged2)
    else
        merged = array
    end

    return merged
end

function divide(array::Vector)
    split = trunc(Int64, length(array)/2)
    arr1 = array[1:split]
    arr2 = array[split+1:end]
    
    return (arr1, arr2)
end

function merge(arr1::Vector, arr2::Vector)
    merged = []

    while !(isempty(arr1) || isempty(arr2))
        if arr1[1] <= arr2[1]
            push!(merged, popfirst!(arr1))
        else
            push!(merged, popfirst!(arr2))
        end
    end

    if !isempty(arr1)
        append!(merged, arr1)
    end
    if !isempty(arr2)
        append!(merged, arr2)
    end

    return merged
end

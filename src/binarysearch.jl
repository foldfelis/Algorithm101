function binary_search(
    array::Vector{T}, target::T) where T

    left = 1
    right = length(array)

    while left <= right
        mid = trunc(Int, (left+right)/2)
        if array[mid] > target
            right = mid
        elseif array[mid] < target
            left = mid
        elseif array[mid] == target
            return mid
        end

        # when left == mid, and didn't return,
        # the target is eather at the right boundary or not in the array
        # Therefore, if not at the right boundary, target is not in the array
        if left == mid && array[mid+1] > target break end
    end

    return -1
end

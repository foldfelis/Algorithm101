function binary_search(array::Vector{T}, target::T) where T
    left = 1
    right = length(array)

    while left <= right
        mid = trunc(Int, left+(right-left)/2)
        if array[mid] > target
            right = mid-1
        elseif array[mid] < target
            left = mid+1
        else
            return mid
        end
    end
end

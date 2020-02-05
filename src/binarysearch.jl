function binary_search(
    array::Vector{T}, target::T;
    _left=1, _right=length(array)) where T

    left = _left
    right = _right
    mid = trunc(Int, (left+right)/2)

    if array[mid] > target
        right = mid
    elseif array[mid] < target
        left = mid
    else
        return mid
    end

    return binary_search(array, target, _left=left, _right=right)
end

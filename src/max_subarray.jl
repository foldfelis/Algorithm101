export find_max_sunarray, iterative_find_max_subarray

#=
#                   Case III
#          <--- cross the midpoint --->
# [p][][][][][][][][][q][q+1][][][][][][][][][r]
# <--- in arr[p..q] ---><--- in arr[q+1..r] --->
#         Case I                Case II
=#

function find_max_crossing(arr::Vector, p::Int64, q::Int64, r::Int64)
    s1 = -Inf
    max_left = 0
    current_sum = 0
    for i=q:-1:p
        current_sum += arr[i]
        if current_sum > s1
            s1 = current_sum
            max_left = i
        end
    end

    s2 = -Inf
    max_right = 0
    current_sum = 0
    for i=q+1:r
        current_sum += arr[i]
        if current_sum > s2
            s2 = current_sum
            max_right = i
        end
    end

    return (max_left, max_right, s1+s2)
end

function find_max_subarray(arr::Vector, p::Int64, r::Int64)
    if p == r
        return (p, p, arr[p])
    end

    q = floor(Int, (p+r)/2)

    # case I
    i1, j1, s1 = find_max_subarray(arr, p, q)
    # case II
    i2, j2, s2 = find_max_subarray(arr, q+1, r)
    # case III
    i3, j3, s3 = find_max_crossing(arr, p, q, r)

    if s1 > s2
        return (i1, j1, s1)
    elseif s2 > s3
        return (i2, j2, s2)
    else
        return (i3, j3, s3)
    end
end

#=
# [][][i][][][][][][][][][j][j+1][][][]
# <----either this range--->
#     <----- or this range ----->
=#

function iterative_find_max_subarray(arr::Vector)
    n = length(arr)

    max_sum = -Inf
    max_i = max_j = 0
    sum = 0
    sum_i = 1

    for j=1:n
        sum += arr[j]
        if sum > max_sum
            max_i = sum_i; max_j = j
            max_sum = sum
        elseif sum < 0
            sum = 0
            sum_i = j+1
        end
    end

    return (max_i, max_j, max_sum)
end

export Dim
export check_dim, multiplice_matrix_chain

struct Dim
    name::String
    row::Int64
    col::Int64
end

function check_dim(chain::Vector{Dim})
    for i = 1:(length(chain)-1)
        (chain[i].col != chain[i+1].row) && (return false)
    end

    return true
end

function print_chain(chain::Vector{Dim}, s::Array, i::Int64, j::Int64; order="")
    if i == j
        order *= "$(chain[i].name)"
    else
        order *= "("
        order = print_chain(chain, s, i, s[i, j], order=order)
        order = print_chain(chain, s, s[i, j]+1, j, order=order)
        order *= ")"
    end

    return order
end

function multiplice_matrix_chain(chain::Vector{Dim})
    if !check_dim(chain) throw(DimensionMismatch) end

    e = []
    for dim in chain
        push!(e, dim.row)
    end
    push!(e, chain[end].col)

    n = length(chain)
    m = zeros(Int, n, n)
    s = zeros(Int, n, n)

    for d = 2:n
        for i = 1:(n-d+1)
            j = i+d-1
            m[i, j] = typemax(Int64)
            for k = i:(j-1)
                temp = m[i, k] + m[k+1, j] + e[i]*e[k+1]*e[j+1]
                (temp < m[i, j]) && (m[i, j] = temp; s[i, j] = k)
            end
        end
    end

    order = print_chain(chain, s, 1, n)
    complexity = m[1, n]

    return order, complexity
end

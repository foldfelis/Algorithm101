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

function to_dims(chain::Vector{Dim})
    dims = []
    for dim in chain
        push!(dims, dim.row)
    end
    push!(dims, chain[end].col)

    return dims
end

function print_chain(
    chain::Vector{Dim},
    references::Array,
    i::Int64, j::Int64;
    order=""
)
    if i == j
        order *= "$(chain[i].name)"
    else
        order *= "("
        order = print_chain(chain, references, i, references[i, j], order=order)
        order = print_chain(chain, references, references[i, j]+1, j, order=order)
        order *= ")"
    end

    return order
end

function multiplice_matrix_chain(chain::Vector{Dim})
    if !check_dim(chain) throw(DimensionMismatch) end

    dims = to_dims(chain)
    n = length(chain)

    m = zeros(Int, n, n)
    references = zeros(Int, n, n)

    for d = 2:n
        for i = 1:(n-d+1)
            j = i+d-1
            m[i, j] = typemax(Int64)
            for k = i:(j-1)
                temp = m[i, k] + m[k+1, j] + dims[i]*dims[k+1]*dims[j+1]
                (temp < m[i, j]) && (m[i, j] = temp; references[i, j] = k)
            end
        end
    end

    order = print_chain(chain, references, 1, n)
    complexity = m[1, n]

    return order, complexity
end

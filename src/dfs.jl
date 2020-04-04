using DataStructure101
const DS = DataStructure101

export dfs

function dfs!(g::DS.Graph, v::Int64, traversed::Vector{Int64}=Int[])
    push!(traversed, v)

    neighbors = DS.neighbor(g, v)
    for n in neighbors
        !(n in traversed) && dfs!(g, n, traversed)
    end

    return traversed
end

dfs(g::DS.Graph, v::Int64) = dfs!(g, v)

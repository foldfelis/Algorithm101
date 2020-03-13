function dfs(g::Graph, v::Int64, traversed::Vector{Int64}=Int[])
    push!(traversed, v)

    neighbors = neighbor(g, v)
    for n in neighbors
        !(n in traversed) && dfs(g, n, traversed)
    end

    return traversed
end

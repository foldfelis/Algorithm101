function dfs(g::Graph, v::Int64, traversed::Vector{Int64})
    push!(traversed, v)

    neighbors = neighbor(g, v)
    for n in neighbors
        if !(n in traversed) traversed = dfs(g, n, traversed) end
    end

    return traversed
end

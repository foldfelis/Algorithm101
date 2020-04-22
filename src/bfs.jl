using DataStructure101
const DS = DataStructure101

export bfs

function bfs(g::DS.AbstractGraph, v::Int64)
    traversed = Int[]
    queue = Int[]
    push!(queue, v)

    while length(queue) > 0
        current_v = queue[1]
        push!(traversed, popfirst!(queue))

        neighbors = DS.neighbor(g, current_v)
        for n in neighbors
            if !(n in traversed || n in queue) push!(queue, n) end
        end
    end

    return traversed
end

using DataStructure101
const DS = DataStructure101

export prims

# struct Edge
#     vertex::Tuple{Int, Int}
#     weight::Float64
# end

"""
    prims(graph::DS.WeightedAdjacencyList{Float64})

Pirim's algorithm for MST, by using DataStructure101.MimHeap.
Support DataStructure101.WeightedAdjacencyList{Float64} only.

Note: Weights must be unique and Int.

# Examples
```julia-repl

```
"""
function prims(g::DS.WeightedAdjacencyList{Int64})
    intree = [1, ]
    edges = Dict()
    sorted_weight = DS.MinHeap()

    # loop over all vertex
    for vertex in intree
        # loop over all neighbor
        neighbors = DS.neighbor(g, vertex)
        i=1
        while i <= length(neighbors)
            neighbor = neighbors[i]
            (neighbor in intree) && (i += 1; continue)
            # 1. push weight into MinHeap
            weight = g.weight[vertex][i]
            push!(edges, weight=>(vertex, neighbor))
            push!(sorted_weight, weight)
            # 2. unrelate edges
            DS.unrelate!(g, vertex, neighbor)
        end
        DS.build!(sorted_weight)

        # loop until estebish an edge
        while length(sorted_weight) > 0
            weight = pop!(sorted_weight)
            edge = edges[weight]
            (edge[2] in intree) && continue
            DS.relate!(g, edge[1], edge[2], weight)
            push!(intree, edge[2])
            break
        end
    end

    return g
end

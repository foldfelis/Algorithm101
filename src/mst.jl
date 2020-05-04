using DataStructure101
const DS = DataStructure101

export prims!, kruskals!, mst!

"""
    prims(graph::DS.WeightedAdjacencyList{Float64})

Pirim's algorithm for MST, by using DataStructure101.MimHeap.
Support DataStructure101.WeightedAdjacencyList{Float64} only.

Note: Weights must be unique and Int.

# Examples
```julia-repl
julia> g = DataStructure101Graph(7, :w_list, T=Int64)
julia> DS.relate!(g, 2, 5, 1)
julia> DS.relate!(g, 1, 6, 2)
julia> DS.relate!(g, 1, 4, 3)
julia> DS.relate!(g, 2, 3, 4)
julia> DS.relate!(g, 1, 5, 5)
julia> DS.relate!(g, 1, 2, 6)
julia> DS.relate!(g, 5, 6, 7)
julia> DS.relate!(g, 5, 7, 8)
julia> DS.relate!(g, 2, 7, 9)
julia> DS.relate!(g, 6, 7, 10)
julia> g
WeightedAdjacencyList{Int64}(
    1[6(2), 4(3), 5(5), 2(6), ],
    2[5(1), 3(4), 1(6), 7(9), ],
    3[2(4), ],
    4[1(3), ],
    5[2(1), 1(5), 6(7), 7(8), ],
    6[1(2), 5(7), 7(10), ],
    7[5(8), 2(9), 6(10), ],
)

julia> prims!(g)
WeightedAdjacencyList{Int64}(
    1[6(2), 4(3), 5(5), ],
    2[5(1), 3(4), ],
    3[2(4), ],
    4[1(3), ],
    5[1(5), 2(1), 7(8), ],
    6[1(2), ],
    7[5(8), ],
)
```
"""
function prims!(g::DS.WeightedAdjacencyList{Int64})
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

struct Edge
    vertex::Tuple{Int, Int}
    weight::Number
end

function Base.push!(edges::Vector{Edge}, edge::Edge)
    len = length(edges)
    for i in 1:len
        (edges[i].weight > edge.weight) && (insert!(edges, i, edge); return)
    end
    insert!(edges, len+1, edge)
end

function kruskals!(g::DS.WeightedAdjacencyList{Int64})
    subset = DS.DisjointSet(DS.nv(g))
    edges::Vector{Edge} = []

    # loop over all vertexes
    for vertex in 1:(DS.nv(g))
        # loop over all neighbor
        neighbors = DS.neighbor(g, vertex)
        while length(neighbors) > 0
            neighbor = neighbors[1]
            # 1. push weight into sorted array
            push!(edges, Edge((vertex, neighbor), g.weight[vertex][1]))
            # 2. unrelate edges
            DS.unrelate!(g, vertex, neighbor)
        end
    end

    # loop over all sorted edges
    for edge in edges
        v1 = edge.vertex[1]
        v2 = edge.vertex[2]
        if DS.find(subset, v1) != DS.find(subset, v2)
            DS.union!(subset, v1, v2)
            DS.relate!(g, v1, v2, edge.weight)
        end
    end

    return g
end

function mst!(g::DS.WeightedAdjacencyList{Int64}; algo::Symbol)
    if algo == :prims
        return prims!(g)
    end
end

function findentrances(g::Graph)
    vs = collect(1:nv(g))
    entrances = collect(1:nv(g))
    for v in vs
        entrances = filter!(e -> !(e in neighbor(g, v)), entrances)
    end

    return entrances
end

function topologicalsort(g::Graph)
    sorted = Int[]
    entrances = findentrances(g)

    while length(entrances) > 0
        v = popfirst!(entrances)
        push!(sorted, v)

        ns = neighbor(g, v)
        for n in ns
            if !(n in sorted || n in entrances) push!(entrances, n) end
        end
    end # while

    return sorted
end

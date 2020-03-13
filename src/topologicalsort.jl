function calc_in_degree(g::Graph)
    in_degrees = zeros(nv(g))

    for v = 1:nv(g)
        for n in neighbor(g, v)
            in_degrees[n] += 1
        end # for
    end # for

    return in_degrees
end

function findentrances(g::Graph)
    entrances = Int[]
    
    in_degrees = calc_in_degree(g)
    for (v, in_degree) in enumerate(in_degrees)
        in_degree == 0 && push!(entrances, v)
    end # for

    return entrances
end # function

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

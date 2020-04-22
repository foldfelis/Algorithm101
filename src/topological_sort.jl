using DataStructure101
const DS = DataStructure101

export find_entrances, topological_sort

function calc_in_degree(g::DS.AbstractGraph)
    in_degrees = zeros(DS.nv(g))

    for v = 1:DS.nv(g)
        for n in DS.neighbor(g, v)
            in_degrees[n] += 1
        end # for
    end # for

    return in_degrees
end

function find_entrances(g::DS.AbstractGraph)
    entrances = Int[]

    in_degrees = calc_in_degree(g)
    for (v, in_degree) in enumerate(in_degrees)
        in_degree == 0 && push!(entrances, v)
    end # for

    return entrances
end # function

function topological_sort(g::DS.AbstractGraph)
    sorted = Int[]
    entrances = find_entrances(g)

    while length(entrances) > 0
        v = popfirst!(entrances)
        push!(sorted, v)

        ns = DS.neighbor(g, v)
        for n in ns
            if !(n in sorted || n in entrances) push!(entrances, n) end
        end
    end # while

    return sorted
end

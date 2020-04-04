using DataStructure101
const DS = DataStructure101

@testset "TopologicalSort" begin

    # dict = Dict(
    #     1 => "Underwear",
    #     2 => "T-Shirt",
    #     3 => "Pents",
    #     4 => "Jasket",
    #     5 => "Socks",
    #     6 => "Shoes"
    # )

    g = DS.AdjacencyMatrix(6)

    DS.relate!(g, 1, 2)
    DS.relate!(g, 1, 3)

    DS.relate!(g, 2, 4)
    DS.relate!(g, 2, 6)

    DS.relate!(g, 3, 6)

    DS.relate!(g, 5, 6)

    @test find_entrances(g) == [1, 5]
    @test topological_sort(g) == [1, 5, 2, 3, 6, 4]

end

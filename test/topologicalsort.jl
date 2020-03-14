@testset "TopologicalSort" begin

    # dict = Dict(
    #     1 => "Underwear",
    #     2 => "T-Shirt",
    #     3 => "Pents",
    #     4 => "Jasket",
    #     5 => "Socks",
    #     6 => "Shoes"
    # )

    g = AdjacencyMatrix(6)

    relate!(g, 1, 2)
    relate!(g, 1, 3)

    relate!(g, 2, 4)
    relate!(g, 2, 6)

    relate!(g, 3, 6)

    relate!(g, 5, 6)

    @test findentrances(g) == [1, 5]
    @test topologicalsort(g) == [1, 5, 2, 3, 6, 4]

end

@testset "BFS" begin

    g = AdjacencyMatrix(10)

    relate!(g, 10, 9)
    relate!(g, 10, 8)

    relate!(g, 9, 7)
    relate!(g, 9, 6)
    relate!(g, 8, 5)
    relate!(g, 8, 4)

    relate!(g, 7, 3)
    relate!(g, 7, 2)
    relate!(g, 6, 1)

    @test bfs(g, 10) == [10, 8, 9, 4, 5, 6, 7, 1, 2, 3]

    n = 100
    city = WeightedAdjacencyMatrix{Float64}(n=n, random_g=true)
    @test bfs(city, 1) == collect(1:100)

end

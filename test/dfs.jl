using Test

using Algorithm101
const ALGO = Algorithm101

using DataStructure101
const DS = DataStructure101

@testset "DFS" begin

    g = DS.AdjacencyMatrix(10)

    DS.relate!(g, 10, 9)
    DS.relate!(g, 10, 8)

    DS.relate!(g, 9, 7)
    DS.relate!(g, 9, 6)
    DS.relate!(g, 8, 5)
    DS.relate!(g, 8, 4)

    DS.relate!(g, 7, 3)
    DS.relate!(g, 7, 2)
    DS.relate!(g, 6, 1)

    @test ALGO.dfs(g, 10) == [10, 8, 4, 5, 9, 6, 1, 7, 2, 3]

    n = 100
    city = DS.WeightedAdjacencyMatrix{Float64}(n=n, random_g=true)
    @test ALGO.dfs(city, 1) == collect(1:100)

end

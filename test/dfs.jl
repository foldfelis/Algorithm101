using Test

using Algorithm101
const ALGO = Algorithm101

using DataStructure101
const DS = DataStructure101

@testset "DFS" begin

    g = DS.Graph(10, :di_matrix)

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
    city = DS.Graph(100, :w_di_matrix, random=true)
    @test ALGO.dfs(city, 1) == collect(1:100)

end

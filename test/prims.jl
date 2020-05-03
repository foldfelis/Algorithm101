using Test
using DataStructure101
const DS = DataStructure101
using Algorithm101
const ALGO = Algorithm101

@testset "Prim's" begin
    #= number shows on the edge represents weight:

        v[4]---3---v[1]---2---v[6]
                    | \      / |
                    |  5    7  |
                    |   \  /   |
                    6    v[5]  10
                    |   /  \   |
                    |  1    8  |
                    | /      \ |
        v[3]---4---v[2]---9---v[7]
    =#
    g = DS.Graph(7, :w_list, T=Int64)
    DS.relate!(g, 2, 5, 1)
    DS.relate!(g, 1, 6, 2)
    DS.relate!(g, 1, 4, 3)
    DS.relate!(g, 2, 3, 4)
    DS.relate!(g, 1, 5, 5)
    DS.relate!(g, 1, 2, 6)
    DS.relate!(g, 5, 6, 7)
    DS.relate!(g, 5, 7, 8)
    DS.relate!(g, 2, 7, 9)
    DS.relate!(g, 6, 7, 10)

    #= number shows on the edge represents order:

        v[4]---2---v[1]---1---v[6]
                      \
                       3
                        \
                         v[5]
                        /  \
                       4    6
                      /      \
        v[3]---5---v[2]      v[7]
    =#
    g_ans = DS.Graph(7, :w_list, T=Int64)
    DS.relate!(g_ans, 1, 6, 2)
    DS.relate!(g_ans, 1, 4, 3)
    DS.relate!(g_ans, 1, 5, 5)
    DS.relate!(g_ans, 2, 5, 1)
    DS.relate!(g_ans, 2, 3, 4)
    DS.relate!(g_ans, 5, 7, 8)

    g = ALGO.prims(g)
    @test g.relation == g_ans.relation
    @test g.weight == g_ans.weight
end

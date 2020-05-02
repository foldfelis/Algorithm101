using Test
using DataStructure101
const DS = DataStructure101
using Algorithm101
const ALGO = Algorithm101

@testset "Prim's" begin
    g = DS.Graph(7, :w_list)

    DS.relate!(g, 2, 5, 1.0)
    DS.relate!(g, 1, 6, 2.0)
    DS.relate!(g, 1, 4, 3.0)
    DS.relate!(g, 2, 3, 4.0)
    DS.relate!(g, 1, 5, 5.0)
    DS.relate!(g, 1, 2, 6.0)
    DS.relate!(g, 5, 6, 7.0)
    DS.relate!(g, 5, 7, 8.0)
    DS.relate!(g, 2, 7, 9.0)
    DS.relate!(g, 6, 7, 10.0)


end

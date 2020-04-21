using Test

using Algorithm101
const ALGO = Algorithm101

using DataStructure101
const DS = DataStructure101

@testset "Tree Traverse" begin

    bt = DS.BinaryTree()
    @test bt isa DS.BinaryTree

    for i=1:10
        bt[i] = i
    end
    @test ALGO.pre_order(DS.root(bt)) == [1,2,4,8,9,5,10,3,6,7]
    @test ALGO.in_order(DS.root(bt)) == [8,4,9,2,10,5,1,6,3,7]
    @test ALGO.pos_order(DS.root(bt)) == [8,9,4,10,5,2,6,7,3,1]

end

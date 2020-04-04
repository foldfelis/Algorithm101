using DataStructure101
const DS = DataStructure101

@testset "Tree Traverse" begin

    bt = DS.BinaryTree{Int64}(1)
    @test bt isa DS.BinaryTree

    for i=2:10
        push!(bt, i)
    end
    @test pre_order(DS.root(bt)) == [1,2,4,8,9,5,10,3,6,7]
    @test in_order(DS.root(bt)) == [8,4,9,2,10,5,1,6,3,7]
    @test pos_order(DS.root(bt)) == [8,9,4,10,5,2,6,7,3,1]

end

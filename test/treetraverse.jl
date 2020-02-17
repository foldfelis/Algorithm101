@testset "Tree Traverse" begin

    bt = BinaryTree{Int64}(1)
    @test bt isa BinaryTree

    for i=2:10
        push!(bt, i)
    end
    @test preorder(root(bt)) == [1,2,4,8,9,5,10,3,6,7]


end
@testset "Tree Traverse" begin

    bt = BinaryTree{Int64}(1)
    @test bt isa BinaryTree

    for i=2:10
        push!(bt, i)
    end
    @test preorder(root(bt)) == [1,2,4,8,9,5,10,3,6,7]
    @test inorder(root(bt)) == [8,4,9,2,10,5,1,6,3,7]
    @test posorder(root(bt)) == [8,9,4,10,5,2,6,7,3,1]

end

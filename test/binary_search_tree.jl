using Random
using Test

using DataStructure101
const DS = DataStructure101

using Algorithm101
const ALGO = Algorithm101

@testset "Binary Search Tree" begin

    tn = DS.TreeNode{Pair{Int64, String}}(11=>"Demo")

    @test ALGO.key(tn) == 11
    @test ALGO.value(tn) == "Demo"

    @test ALGO.find(tn, 10) == nothing
    @test ALGO.find(tn, 11) == tn
    @test ALGO.find(tn, 12) == nothing

    bst = ALGO.BinarySearchTree{String}()
    @test eltype(bst) == String
    @test length(bst) == 0

    push!(bst, 11=>"Demo")
    @test length(bst) == 1

    @test ALGO.key(ALGO.root(bst)) == 11
    @test ALGO.value(ALGO.root(bst)) == "Demo"

    @test maximum(bst) == "Demo"
    @test minimum(bst) == "Demo"

    bst = ALGO.BinarySearchTree{String}(11=>"Demo")
    @test length(bst) == 1

    @test ALGO.key(ALGO.root(bst)) == 11
    @test ALGO.value(ALGO.root(bst)) == "Demo"

    @test maximum(bst) == "Demo"
    @test minimum(bst) == "Demo"

end

@testset "Binary Search Tree Searching" begin

    data = [
        1 => "Chinese",
        2 => "Hindi",
        3 => "Spanish",
        4 => "English",
        5 => "Arabic",
        6 => "Portuguese",
        7 => "Bengali",
        8 => "Russian",
        9 => "Japanese",
        10 => "German",
    ]

    Random.seed!(100);
    shuffled_index = Random.shuffle(1:10)
    # shuffled_index = [3,5,1,8,4,9,2,10,6,7]

    bst = ALGO.BinarySearchTree{String}()
    for index in shuffled_index
        push!(bst, data[index])
    end
    @test length(bst) == length(data)

    @test maximum(bst) == data[end].second
    @test minimum(bst) == data[1].second
    for i in shuffled_index
        @test bst[i] == data[i].second
    end

    @test repr(bst) == "BinaryTree{String}(\n\n" *
        "\t\t\tTreeNode(10 => \"German\")\n\n" *
        "\t\t\t\tTreeNode(9 => \"Japanese\")\n\n" *
        "\t\t\t\t\tTreeNode(8 => \"Russian\")\n\n" *
        "\t\tTreeNode(7 => \"Bengali\")\n\n" *
        "\tTreeNode(6 => \"Portuguese\")\n\n" *
        "\t\tTreeNode(5 => \"Arabic\")\n\n" *
        "\t\t\tTreeNode(4 => \"English\")\n\n" *
        "TreeNode(3 => \"Spanish\")\n\n" *
        "\t\tTreeNode(2 => \"Hindi\")\n\n" *
        "\tTreeNode(1 => \"Chinese\")\n" *
    ")"
end

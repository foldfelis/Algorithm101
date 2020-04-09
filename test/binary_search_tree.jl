using Random
using Test

using Algorithm101
const ALGO = Algorithm101

@testset "Binary Search Tree" begin

    tn = ALGO.BinarySearchTreeNode{String}(11=>"Demo")
    @test tn isa ALGO.BinarySearchTreeNode

    @test ALGO.key(tn) == 11
    @test ALGO.value(tn) == "Demo"

    @test ALGO.find(tn, 10) == nothing
    @test ALGO.find(tn, 11) == tn
    @test ALGO.find(tn, 12) == nothing

    @test ALGO.root(tn) == tn

    @test maximum(tn) == tn.data
    @test minimum(tn) == tn.data

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
    shuffled_index = Random.shuffle(1:10)
    # shuffled_index = [3,5,1,8,4,9,2,10,6,7]

    tn = ALGO.BinarySearchTreeNode{String}(data[shuffled_index[1]])
    for index in shuffled_index[2:end]
        insert!(tn, data[index])
    end

    @test maximum(tn) == data[end]
    @test minimum(tn) == data[1]
    for i in shuffled_index
        @test tn[i] == data[i].second
    end

end

using Random
using DataStructure101
const DS = DataStructure101
const ALGO = Algorithm101

@testset "Binary Search Tree" begin

    data = Dict(
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
    )
    shuffled_index = Random.shuffle(1:10)
    # shuffled_index = [3,5,1,8,4,9,2,10,6,7]

    bt = DS.BinaryTree{String}(data[shuffled_index[1]], shuffled_index[1])
    for index in shuffled_index[2:end]
        insert!(bt, index => data[index])
    end

    @test maximum(bt) == (10 => "German")
    @test minimum(bt) == (1 => "Chinese")
    for i in shuffled_index
        @test bt[i] == data[i]
    end

    @test DS.NullNode()[11] == nothing

end
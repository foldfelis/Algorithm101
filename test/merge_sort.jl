using Test
using Algorithm101
const ALGO = Algorithm101

@testset "Test MergeSort" begin

    # Test: 1 elements Vector
    answer = [0]
    @test ALGO.merge_sort([0]) == answer

    # Test: 7 elements Vector
    data = [4,6,5,7,1,3,2]
    answer = sort(data)
    @test ALGO.merge_sort(data) == answer

    # Test: 100 elements Vector
    data = rand(100)
    answer = sort(data)
    @test ALGO.merge_sort(data) == answer

end

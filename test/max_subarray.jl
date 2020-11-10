using Test
using Algorithm101
const ALGO = Algorithm101

@testset "Find max subarray" begin
    arr = [
        13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7
    ]

    @test ALGO.find_max_subarray(arr, 1, 16) == (8, 11, 43)

    arr = [
        13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7
    ]

    @test ALGO.iterative_find_max_subarray(arr) == (8, 11, 43)
end

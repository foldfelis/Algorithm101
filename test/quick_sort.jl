using Test
using Algorithm101
const ALGO = Algorithm101

@testset "Test QuickSort" begin

    # Test: 5 elements
    data = [5,2,4,3,1]
    answer = sort(data)
    @test ALGO.quick_sort!(data, 1, length(data)) == answer

    # Test: 100 elements
    data = rand(100)
    answer = sort(data)
    @test ALGO.quick_sort!(data, 1, length(data)) == answer

    # Test: 5 element
    data = [5,2,4,3,1]
    answer = sort(data)
    @test ALGO.hoare_qsort!(data, 1, length(data)) == answer

    # Test: 100 elements
    data = rand(100)
    answer = sort(data)
    @test ALGO.hoare_qsort!(data, 1, length(data)) == answer

end

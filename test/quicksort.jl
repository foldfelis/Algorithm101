@testset "Test QuickSort" begin

    # Test: 5 elements
    data = [5,2,4,3,1]
    answer = sort(data)
    @test quick_sort!(data, 1, length(data)) == answer

    # Test: 100 elements
    data = rand(100)
    answer = sort(data)
    @test quick_sort!(data, 1, length(data)) == answer

end

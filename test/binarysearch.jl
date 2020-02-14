@testset "Test BinarySearch" begin

    # Test: 1:7:1000 sorted array
    array = collect(1:7:1000)
    target_i = rand(1:length(array))
    target = array[target_i]
    @test binary_search(array, target) == target_i

    # Test: If element is not in the array
    target = 6
    find_i =
    @test binary_search(array, target) == -1

end
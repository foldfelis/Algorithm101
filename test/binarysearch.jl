@info "Test: 1:7:1000 sorted array"
array = collect(1:7:1000)
println(array, "\n")

target_i = rand(1:length(array))
target = array[target_i]
@info "Target: $(target), at index: $(target_i)"

find_i = binary_search(array, target)
@info "Found target at index: $(find_i)"
println(@test target_i == find_i)
println()

@info "Test: If element is not in the array"
target = 6
@info "Target: $(target), and is not in the array"
find_i = binary_search(array, target)
@info "Can't find and return index: $(find_i)"
println(@test -1 == find_i)

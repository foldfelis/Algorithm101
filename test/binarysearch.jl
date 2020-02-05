@info "Test: 1:7:1000 sorted array"
array = Vector(collect(1:7:1000))
println(array, "\n")

target_i = rand(1:length(array))
target = array[target_i]
@info "Target: $(target), at index: $(target_i)"

find_i = binary_search(array, target)
@info "Found target at index: $(find_i)"
println(@test target_i == find_i)

@info "Test: 1 elements Vector"
answer = [0]
print(@test merge_sort([0]) == answer)
println(" : $(answer)\n")

@info "Test: 7 elements Vector"
answer = [1,2,3,4,5,6,7]
print(@test merge_sort([4,6,5,7,1,3,2]) == answer)
println(" : $(answer)\n")

@info "Test: 100 elements Vector"
data = rand(Float32, 100)
answer = sort(data)
print(@test merge_sort(data) == answer)
println(" : $(answer)\n")

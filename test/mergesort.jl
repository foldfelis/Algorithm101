@info "Test: 1 elements Vector"
answer = [0]
print(@test merge_sort([0]) == answer)
println(" : $(answer)")

@info "Test: 7 elements Vector"
answer = [1,2,3,4,5,6,7]
print(@test merge_sort([4,6,5,7,1,3,2]) == answer)
println(" : $(answer)")

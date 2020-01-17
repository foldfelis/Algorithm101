@info "Test: 5 elements"
data = [5,2,4,3,1]
answer = sort(data)
print(@test quick_sort(data) == answer)
println(" : $(answer)\n")

@info "Test: 100 elements"
data = rand(100)
answer = sort(data)
print(@test quick_sort(data) == answer)
println(" : $(answer)\n")

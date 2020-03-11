using Algorithm101
using DataStructure101: BinaryTree, root, value, WeightedAdjacencyMatrix,
    AdjacencyMatrix, relate!
using Test

filename = [
    "mergesort",
    "quicksort",
    "binarysearch",
    "treetraverse",
    "binarysearchtree",
    "bfs",
    "dfs",
]

for f in filename
    teststr = "# Test '$(f)' #"
    len = length(teststr)
    teststr = "\n$("#"^len)\n$(teststr)\n$("#"^len)\n"
    println()
    @info teststr

    fname = string(f, ".jl")
    include(fname)
end

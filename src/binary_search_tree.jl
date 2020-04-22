using DataStructure101
const DS = DataStructure101

export key, value

key(tn::DS.TreeNode) = tn.value.first

value(tn::DS.TreeNode) = tn.value.second

function find(tn::DS.TreeNode, k::Int64)
    if k == key(tn)
        return tn
    elseif k < key(tn)
        return find(tn.left, k)
    else
        return find(tn.right, k)
    end
end

find(tn::DS.NullNode, k::Int64) = nothing

mutable struct BinarySearchTree
    root::DS.AbstractNode
    length::Int

    BinarySearchTree(value::Pair{Int64,<:Any}) = new(DS.TreeNode(value), 1)
    BinarySearchTree() = new(DS.NullNode(), 0)
end

root(bst::BinarySearchTree) = bst.root

Base.length(bst::BinarySearchTree) = bst.length

Base.eltype(bst::BinarySearchTree) = Base.eltype(bst.root)

function Base.show(io::IO, bst::BinarySearchTree)
    print(io, "BinarySearchTree($(DS.tree_repr(root(bst))))")
end

function close_to(tn::DS.TreeNode{Pair{Int64, T}}, k::Int64) where T
    if k <= key(tn)
        left = tn.left
        return (left isa DS.NullNode) ? tn : close_to(left, k)
    else
        right = tn.right
        return (right isa DS.NullNode) ? tn : close_to(right, k)
    end
end

function Base.maximum(bst::BinarySearchTree)
    tn = close_to(root(bst), typemax(Int64))
    return value(tn)
end

function Base.minimum(bst::BinarySearchTree)
    tn = close_to(root(bst), typemin(Int64))
    return value(tn)
end

function Base.push!(bst::BinarySearchTree, data::Pair{Int64,T}) where T
    tn = DS.TreeNode(data)

    if root(bst) isa DS.NullNode
        bst.root = tn
        bst.length += 1
        return
    end

    parent = close_to(root(bst), data.first)
    tn.parent = parent

    if data.first < key(parent)
        parent.left = tn
    elseif data.first > key(parent)
        parent.right = tn
    end

    bst.length += 1
end

Base.getindex(bst::BinarySearchTree, k::Int) = value(find(root(bst), k))

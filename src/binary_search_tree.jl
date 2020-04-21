using DataStructure101
const DS = DataStructure101

export key, value

key(tn::DS.TreeNode{Pair{Int64, T}}) where T = tn.value.first

value(tn::DS.TreeNode{Pair{Int64, T}}) where {T} = tn.value.second

function find(tn::DS.TreeNode{Pair{Int64, T}}, k::Int64) where T
    if k == key(tn)
        return tn
    elseif k < key(tn)
        left = tn.left
        find(left, k)
    else
        right = tn.right
        find(right, k)
    end
end

find(tn::DS.NullNode, k::Int64) = nothing

mutable struct BinarySearchTree{T}
    root::DS.AbstractNode
    length::Int
end

function BinarySearchTree{T}(value::Pair{Int64, T}) where T
    return BinarySearchTree{T}(DS.TreeNode{Pair{Int64, T}}(value), 1)
end

BinarySearchTree{T}() where T = BinarySearchTree{T}(DS.NullNode(), 0)

root(bst::BinarySearchTree) = bst.root

Base.length(bst::BinarySearchTree) = bst.length

Base.eltype(bst::BinarySearchTree{T}) where T = T

function Base.show(io::IO, bst::BinarySearchTree{T}) where T
    print(io, "BinaryTree{$T}($(DS.tree_repr(root(bst))))")
end

function close_to(tn::DS.TreeNode{Pair{Int64, T}}, k::Int64) where T
    if k <= key(tn)
        left = tn.left
        if left isa DS.NullNode return tn end
        close_to(left, k)
    else
        right = tn.right
        if right isa DS.NullNode return tn end
        close_to(right, k)
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

function Base.push!(bst::BinarySearchTree{T}, data::Pair{Int64,T}) where T
    tn = DS.TreeNode{Pair{Int64, T}}(data)

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

Base.getindex(bst::BinarySearchTree{T}, k::Int) where T = value(find(root(bst), k))

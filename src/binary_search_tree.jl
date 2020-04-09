export BinarySearchTreeNode, root, key, value

abstract type AbstractBinarySearchTreeNode end

struct NullBinarySearchTreeNode <: AbstractBinarySearchTreeNode end

mutable struct BinarySearchTreeNode{T} <: AbstractBinarySearchTreeNode
    data::Pair{Int64, T}
    parent::AbstractBinarySearchTreeNode
    left::AbstractBinarySearchTreeNode
    right::AbstractBinarySearchTreeNode

    BinarySearchTreeNode{T}(data::Pair{Int64, T}) where T =
        new(
            data, 
            NullBinarySearchTreeNode(), 
            NullBinarySearchTreeNode(), 
            NullBinarySearchTreeNode()
        )
end

key(tn::BinarySearchTreeNode) = tn.data.first

value(tn::BinarySearchTreeNode{T}) where {T} = tn.data.second

function find(tn::BinarySearchTreeNode{T}, k::Int64) where T
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

find(tn::NullBinarySearchTreeNode, k::Int64) = nothing

function root(tn::BinarySearchTreeNode)
    parent = tn.parent
    if !(parent isa NullBinarySearchTreeNode) tn = root(parent) end
    
    return tn
end

function close_to(tn::BinarySearchTreeNode{T}, k::Int64) where T
    if k <= key(tn)
        left = tn.left
        if left isa NullBinarySearchTreeNode return tn end
        close_to(left, k)
    else
        right = tn.right
        if right isa NullBinarySearchTreeNode return tn end
        close_to(right, k)
    end
end

function Base.maximum(tn::BinarySearchTreeNode)
    tn = close_to(root(tn), typemax(Int64))
    return tn.data
end

function Base.minimum(tn::BinarySearchTreeNode)
    tn = close_to(root(tn), typemin(Int64))
    return tn.data
end

function Base.insert!(tn::BinarySearchTreeNode{T}, data::Pair{Int64,T}) where T
    parent = close_to(root(tn), data.first)
    tn = BinarySearchTreeNode{T}(data)
    tn.parent = parent

    if data.first < key(parent)
        parent.left = tn
    elseif data.first > key(parent)
        parent.right = tn
    end
end

Base.getindex(tn::BinarySearchTreeNode{T}, k::Int) where T = value(find(root(tn), k))

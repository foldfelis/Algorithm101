key(tn::TreeNode) = tn.index

find(tn::NullNode, k::Int64) = nothing

function find(tn::TreeNode{T}, k::Int64) where T
    if k == key(tn)
        return tn
    elseif k < key(tn)
        left = leftchild(tn)
        find(left, k)
    else
        right = rightchild(tn)
        find(right, k)
    end
end

function closeto(tn::TreeNode{T}, k::Int64) where T
    if k <= key(tn)
        left = leftchild(tn)
        if left isa NullNode return tn end
        closeto(left, k)
    else
        right = rightchild(tn)
        if right isa NullNode return tn end
        closeto(right, k)
    end
end

function maximum(bt::BinaryTree)
    tn = closeto(root(bt), typemax(Int64))
    return key(tn) => value(tn)
end

function minimum(bt::BinaryTree)
    tn = closeto(root(bt), typemin(Int64))
    return key(tn) => value(tn)
end

function insert!(bt::BinaryTree{T}, data::Pair{Int64,T}) where T
    parent = closeto(root(bt), data.first)
    tn = TreeNode{T}(data.second, data.first)
    tn.parent = parent

    if data.first < key(parent)
        parent.left = tn
    elseif data.first > key(parent)
        parent.right = tn
    end
end

getindex(bt::BinaryTree{T}, k::Int) where T = value(find(root(bt), k))

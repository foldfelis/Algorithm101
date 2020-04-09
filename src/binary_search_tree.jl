using DataStructure101
const DS = DataStructure101
const ALGO = Algorithm101

export find, bst_maximum, bst_minimum, get_bst_index

key(tn::DS.TreeNode) = tn.index

find(tn::DS.NullNode, k::Int64) = nothing

function find(tn::DS.TreeNode{T}, k::Int64) where T
    if k == key(tn)
        return tn
    elseif k < key(tn)
        left = DS.left_child(tn)
        find(left, k)
    else
        right = DS.right_child(tn)
        find(right, k)
    end
end

function close_to(tn::DS.TreeNode{T}, k::Int64) where T
    if k <= key(tn)
        left = DS.left_child(tn)
        if left isa DS.NullNode return tn end
        close_to(left, k)
    else
        right = DS.right_child(tn)
        if right isa DS.NullNode return tn end
        close_to(right, k)
    end
end

function bst_maximum(bt::DS.BinaryTree)
    tn = close_to(DS.root(bt), typemax(Int64))
    return key(tn) => DS.value(tn)
end

function bst_minimum(bt::DS.BinaryTree)
    tn = close_to(DS.root(bt), typemin(Int64))
    return key(tn) => DS.value(tn)
end

function Base.insert!(bt::DS.BinaryTree{T}, data::Pair{Int64,T}) where T
    parent = close_to(DS.root(bt), data.first)
    tn = DS.TreeNode{T}(data.second, data.first)
    tn.parent = parent

    if data.first < key(parent)
        parent.left = tn
    elseif data.first > key(parent)
        parent.right = tn
    end
end

get_bst_index(bt::DS.BinaryTree{T}, k::Int) where T = DS.value(ALGO.find(DS.root(bt), k))
get_bst_index(bt::DS.NullNode, k::Int) where T = ALGO.find(bt, k)

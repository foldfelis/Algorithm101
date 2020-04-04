using DataStructure101
const DS = DataStructure101

export pre_order, in_order, pos_order

function pre_order(node::DS.TreeNode{T}, result::Vector{T}=T[]) where T
    push!(result, DS.value(node))
    pre_order(DS.left_child(node), result)
    pre_order(DS.right_child(node), result)

    return result
end

pre_order(node::DS.NullNode, result::Vector{T}=T[]) where T = result

function in_order(node::DS.TreeNode{T}, result::Vector{T}=T[]) where T
    in_order(DS.left_child(node), result)
    push!(result, DS.value(node))
    in_order(DS.right_child(node), result)

    return result
end

in_order(node::DS.NullNode, result::Vector{T}=T[]) where T = result


function pos_order(node::DS.TreeNode{T}, result::Vector{T}=T[]) where T
    pos_order(DS.left_child(node), result)
    pos_order(DS.right_child(node), result)
    push!(result, DS.value(node))

    return result
end

pos_order(node::DS.NullNode, result::Vector{T}=T[]) where T = result

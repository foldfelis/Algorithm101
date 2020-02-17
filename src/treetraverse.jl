function preorder(node::TreeNode{T}, result::Vector{T}=T[]) where T
    push!(result, value(node))
    preorder(leftchild(node), result)
    preorder(rightchild(node), result)

    return treearr
end

preorder(node::NullNode, result::Vector{T}=T[]) where T = result
function preorder(node::TreeNode{T}, result::Vector{T}=T[]) where T
    push!(result, value(node))
    preorder(leftchild(node), result)
    preorder(rightchild(node), result)

    return result
end

preorder(node::NullNode, result::Vector{T}=T[]) where T = result

function inorder(node::TreeNode{T}, result::Vector{T}=T[]) where T
    inorder(leftchild(node), result)
    push!(result, value(node))
    inorder(rightchild(node), result)

    return result
end

inorder(node::NullNode, result::Vector{T}=T[]) where T = result

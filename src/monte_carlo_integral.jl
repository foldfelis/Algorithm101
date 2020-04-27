export mc_integral

function mc_integral(f::Function, range::StepRangeLen)
    start = Float64(range.ref)
    δ = Float64(range.step)
    len = Int(range.len)
    stop = start + δ * (len-1)

    xs = rand(len) .* (stop-start) .+ start
    ys = f.(xs)

    return sum(ys) * δ
end

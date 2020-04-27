using Test
using Algorithm101
const ALGO = Algorithm101

@testset "Monte Carlo Integral" begin
    f(x) = x
    @test isapprox(ALGO.mc_integral(f, 0:0.00001:1), 0.5, atol=1e-2)

    f(x) = x^2
    @test isapprox(ALGO.mc_integral(f, 0:0.00001:1), 0.333, atol=1e-2)

    f(x) = x * (atan(x))^2
    @test isapprox(ALGO.mc_integral(f, 0:0.00001:1), 0.173, atol=1e-2)

    f(x) = 1 / (1 + (tan(x))^4)
    @test isapprox(ALGO.mc_integral(f, 0:0.00001:1), 0.769, atol=1e-2)
end

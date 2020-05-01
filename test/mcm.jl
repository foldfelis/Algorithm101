using Test
using Algorithm101
const ALGO = Algorithm101

@testset "Matrix Chain Multiplication" begin
    @testset "Utils" begin
        chain = [
            ALGO.Dim("A", 2, 6),
            ALGO.Dim("B", 6, 3),
            ALGO.Dim("C", 3, 5),
            ALGO.Dim("D", 5, 10),
            ALGO.Dim("E", 10, 2),
        ]

        @test ALGO.check_dim(chain)
    end

    @testset "MCM" begin
        chain = [
            ALGO.Dim("A", 30, 35),
            ALGO.Dim("B", 35, 15),
            ALGO.Dim("C", 15, 5),
            ALGO.Dim("D", 5, 10),
            ALGO.Dim("E", 10, 20),
            ALGO.Dim("F", 20, 25),
        ]
        @test ALGO.multiplice_matrix_chain(chain) == ("((A(BC))((DE)F))", 15125)
    end
end

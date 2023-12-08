@testset "Test constructors, labelling and codes for verb pattern" begin
    vpattern =  hmpVerbPattern(1)
    @test vpattern == gmpPerson("qal")
    @test code(vpattern) == 1
    @test label(vpattern) == "qal"
end

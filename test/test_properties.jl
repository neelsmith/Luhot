@testset "Test constructors, labelling and codes for verb pattern" begin
    vpattern =  HMPVerbPattern(1)
    @test vpattern == hmpVerbPattern("qal")
    @test code(vpattern) == 1
    @test label(vpattern) == "qal"


    tns = HMPTense(1)
    @test tns == hmpTense("perfect")
    @test code(tns) == 1
    @test label(tns) == "perfect"


    p = HMPPerson(1)
    @test p == hmpPerson("first")
    @test code(p) == 1
    @test label(p) == "first"
end

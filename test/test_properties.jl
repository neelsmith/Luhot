@testset "Test constructors, labelling and codes for finite verb properties" begin
    vpattern =  HMPVerbPattern(1)
    @test vpattern == hmpPattern("qal")
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

    n = HMPNumber(1)
    @test n == hmpNumber("singular")
    @test code(n) == 1
    @test label(n) == "singular"

    g = HMPGender(1)
    @test g == hmpGender("masculine")
    @test code(g) == 1
    @test label(g) == "masculine"
end


@testset "Test constructors, labelling and codes for noun properties" begin
    st = HMPSubstantiveState(1)
    @test st == hmpSubstantiveState("absolute")
    @test code(st) == 1
    @test label(st) == "absolute"

end
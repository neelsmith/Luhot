@testset "Test constructors, labelling and codes for verb pattern" begin
    vpattern =  HMPVerbPattern(1)
    @test vpattern == hmpVerbPattern("qal")
    #@test code(vpattern) == 1
    #@test label(vpattern) == "qal"
end

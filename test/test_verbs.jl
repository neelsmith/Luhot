@testset "Test verb forms" begin
    # Test accessor functions
    pattern = hmpPattern("qal")
    tense = hmpTense("perfect")
    pers = hmpPerson("third")
    num = hmpNumber("singular")
    gender = hmpGender("masculine")
    verb = HebrewFiniteVerb(
        pattern, tense,
        pers, num, gender
    )
    @test verb isa HebrewFiniteVerb
    @test label(hmpPattern(verb)) = "qal"
    @test label(hmpTense(verb)) = "perfect"
    @test label(hmpPerson(verb)) == "third"
    @test label(hmpNumber(verb)) == "singular"
    @test label(hmpGender(verb)) == "masculine"

end


@testset "Test generating strings" begin
    
end

@testset "Test verb forms" begin
    # Test accessor functions
    pattern = hmpPattern("qal")
    tense = hmpTense("perfect")
    pers = hmpPerson("third")
    num = hmpNumber("singular")
    gender = hmpGender("masculine")
    verbform = HebrewFiniteVerb(
        pattern, tense,
        pers, num, gender
    )
    @test verbform isa HebrewFiniteVerb
    @test label(hmpPattern(verbform)) == "qal"
    @test label(hmpTense(verbform)) == "perfect"
    @test label(hmpPerson(verbform)) == "third"
    @test label(hmpNumber(verbform)) == "singular"
    @test label(hmpGender(verbform)) == "masculine"

end


@testset "Test generating strings" begin
    pattern = hmpPattern("qal")
    tense = hmpTense("perfect")
    pers = hmpPerson("third")
    num = hmpNumber("singular")
    gender = hmpGender("masculine")
    verbform = HebrewFiniteVerb(
        pattern, tense,
        pers, num, gender
    )
    verbdata = "verbs.BDB4250|bdb.BDB4250|כתב|sound"
    verbstem = Luhot.readstemrow(verbdata, Luhot.VerbIO())
    expected = "כָתַב"
    @test generate(verbstem, verbform) == expected
end

@testset "Test accessor functions on verb forms" begin
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


@testset "Test CITE interfaces on finite verbs" begin
    pattern = hmpPattern("qal")
    tense = hmpTense("perfect")
    pers = hmpPerson("third")
    num = hmpNumber("singular")
    gender = hmpGender("masculine")
    verbform = HebrewFiniteVerb(
        pattern, tense,
        pers, num, gender
    )

    @test citable(verbform)
    @test urn(verbform) == Cite2Urn("urn:cite2:luhot:forms.v1:31131100")
    @test label(verbform) == "verb: qal perfect third singular masculine"


    
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
    verbstem = fromcex(verbdata, LuhotVerbStem)
    expected = "כָתַב"
    @test generate(verbstem, verbform) == expected
end

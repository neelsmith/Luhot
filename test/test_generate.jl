@testset "Test generating finite verb forms" begin
    pattern = hmpPattern("qal")
    tense = hmpTense("perfect")
    pers = hmpPerson("third")
    num = hmpNumber("singular")
    gender = hmpGender("masculine")
    verbform = HebrewFiniteVerb(
        pattern, tense,
        pers, num, gender
    )

    datarow = "verbs.BDB4250|bdb.BDB4250|כתב|sound"
    verbstem = Luhot.readstemrow(datarow, Luhot.VerbIO())
    result = generate(verbstem, verbform)
    expected = "כָתַב"
    @test result == expected

    # Verify that first person forms treat all genders the same:
    pers1 = hmpPerson("first")
    firstsgmasc = HebrewFiniteVerb(
        pattern, tense,
        pers1, num, gender
    )
    firstsgfem = HebrewFiniteVerb(
        pattern, tense,
        pers1, num, hmpGender("feminine")
    )
    firstsgcommon = HebrewFiniteVerb(
        pattern, tense,
        pers1, num, hmpGender("common")
    )

    @test generate(verbstem,firstsgmasc) == generate(verbstem,firstsgfem) == generate(verbstem, firstsgcommon)


    piel = HebrewFiniteVerb(
        hmpPattern("piel"), tense,
        pers, num, gender
    )
    @test_broken generate(verbstem, piel) == "??"

    pual = HebrewFiniteVerb(
        hmpPattern("pual"), tense,
        pers, num, gender
    )
    @test_broken generate(verbstem, pual) == "??"

    hiphil = HebrewFiniteVerb(
        hmpPattern("hiphil"), tense,
        pers, num, gender
    )
    @test_broken generate(verbstem, hiphil) == "??"

    hophal = HebrewFiniteVerb(
        hmpPattern("hophal"), tense,
        pers, num, gender
    )
    @test_broken generate(verbstem, hophal) == "??"

    hithpael = HebrewFiniteVerb(
        hmpPattern("hithpael"), tense,
        pers, num, gender
    )
    @test_broken generate(verbstem, hithpael) == "??"

    
end
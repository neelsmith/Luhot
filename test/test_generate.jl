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

    datarow = "verbs.BDB7394|bdb.BDB7394|קָטַל|sound"
    verbstem = fromcex(datarow, LuhotVerbStem)
    result = generate(verbstem, verbform)
    expected = "קָטַל"
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
    

    niphal = HebrewFiniteVerb(
        hmpPattern("niphal"), tense,
        pers, num, gender
    )
    @test_broken generate(verbstem,niphal) == ""

    piel = HebrewFiniteVerb(
        hmpPattern("piel"), tense,
        pers, num, gender
    )
    @test_broken generate(verbstem, piel) == ""

    pual = HebrewFiniteVerb(
        hmpPattern("pual"), tense,
        pers, num, gender
    )
    @test_broken generate(verbstem, pual) == ""

    hiphil = HebrewFiniteVerb(
        hmpPattern("hiphil"), tense,
        pers, num, gender
    )
    @test_broken generate(verbstem, hiphil) == ""

    hophal = HebrewFiniteVerb(
        hmpPattern("hophal"), tense,
        pers, num, gender
    )
    @test_broken generate(verbstem, hophal) == ""


    hithpael = HebrewFiniteVerb(
        hmpPattern("hithpael"), tense,
        pers, num, gender
    )
    @test_broken generate(verbstem, hithpael) == ""

    # Test imperfects:
    niphalimpft = HebrewFiniteVerb(hmpPattern("niphal"), hmpTense("imperfect"),
        pers, num, gender
    )
    @test_broken generate(verbstem, niphalimpft) == ""

    pielimpft = HebrewFiniteVerb(hmpPattern("piel"), hmpTense("imperfect"),
    pers, num, gender)
    @test_broken generate(verbstem, pielimpft) == ""

    pualimpft =  HebrewFiniteVerb(hmpPattern("pual"), hmpTense("imperfect"),
    pers, num, gender)
    @test_broken generate(verbstem, pualimpft) == ""


    hiphilimpft = HebrewFiniteVerb(hmpPattern("hiphil"), hmpTense("imperfect"),
    pers, num, gender)
    @test_broken generate(verbstem, hiphilimpft) == ""

    hophalimpft = HebrewFiniteVerb(hmpPattern("hophal"), hmpTense("imperfect"),
    pers, num, gender)
    @test_broken generate(verbstem, hophalimpft) == ""


    hithpaelimpft = HebrewFiniteVerb(hmpPattern("hithpael"), hmpTense("imperfect"),
    pers, num, gender)
    @test_broken generate(verbstem, hithpaelimpft) == ""
end
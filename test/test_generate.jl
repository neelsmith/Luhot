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
    

    niphal = HebrewFiniteVerb(
        hmpPattern("niphal"), tense,
        pers, num, gender
    )
    @test generate(verbstem,niphal) == "נִכְתַב"

    piel = HebrewFiniteVerb(
        hmpPattern("piel"), tense,
        pers, num, gender
    )
    @test generate(verbstem, piel) == "כִתֵּב"

    pual = HebrewFiniteVerb(
        hmpPattern("pual"), tense,
        pers, num, gender
    )
    @test generate(verbstem, pual) == "כֻתַּב"

    hiphil = HebrewFiniteVerb(
        hmpPattern("hiphil"), tense,
        pers, num, gender
    )
    @test generate(verbstem, hiphil) == "הִכְתִיב"

    hophal = HebrewFiniteVerb(
        hmpPattern("hophal"), tense,
        pers, num, gender
    )
    @test generate(verbstem, hophal) == "הָכְתַיב"


    hithpael = HebrewFiniteVerb(
        hmpPattern("hithpael"), tense,
        pers, num, gender
    )
    @test generate(verbstem, hithpael) == "הִתְכַתֵּיב"

    # Test imperfects:
    niphalimpft = HebrewFiniteVerb(hmpPattern("niphal"), hmpTense("imperfect"),
        pers, num, gender
    )
    @test generate(verbstem, niphalimpft) == "יִכָּתֵב" 

    pielimpft = HebrewFiniteVerb(hmpPattern("piel"), hmpTense("imperfect"),
    pers, num, gender)
    @test generate(verbstem, pielimpft) == "יְכַתֵּב"

    pualimpft =  HebrewFiniteVerb(hmpPattern("pual"), hmpTense("imperfect"),
    pers, num, gender)
    @test generate(verbstem, pualimpft) == "יְכֻתַּב"


    hiphilimpft = HebrewFiniteVerb(hmpPattern("hiphil"), hmpTense("imperfect"),
    pers, num, gender)
    @test generate(verbstem, hiphilimpft) == "יַכְתִיב"

    hophalimpft = HebrewFiniteVerb(hmpPattern("hophal"), hmpTense("imperfect"),
    pers, num, gender)
    @test generate(verbstem, hophalimpft) == "יָכְתַב"


    hithpaelimpft = HebrewFiniteVerb(hmpPattern("hithpael"), hmpTense("imperfect"),
    pers, num, gender)
    @test generate(verbstem, hithpaelimpft) == "יִתְכַתֵּיב"
end
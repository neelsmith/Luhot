@testset "Test generating finite verb forms" begin
    # TBA...
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

end
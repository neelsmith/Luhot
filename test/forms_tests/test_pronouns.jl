@testset "Test accessor functions on pronoun forms" begin

    pers = hmpPerson("second")
    num = hmpNumber("singular")
    gender = hmpGender("feminine")
    pronform = HebrewObjectPronoun(
        pers, num, gender
    )

    @test pronform isa HebrewObjectPronoun
    @test label(hmpPerson(pronform)) == "second"
    @test label(hmpNumber(pronform)) == "singular"
    @test label(hmpGender(pronform)) == "feminine"

end
@testset "Test reading verb stems" begin
    verbdata = "verbs.BDB4250|bdb.BDB4250|כתב|sound"
    vs = Luhot.readstemrow(verbdata, Luhot.VerbIO())
    @test vs isa Luhot.LuhotVerbStem

    @test Luhot.pos(vs) == :verb # This is wrong?
    @test Luhot.stemstring(vs) == "כתב"
    @test Luhot.lexeme(vs) == LexemeUrn("bdb.BDB4250")
    @test label(vs) == "Verb stem כתב (bdb.BDB4250)"
end
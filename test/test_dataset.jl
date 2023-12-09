@testset "Test creating files dataset"  begin
    dir = joinpath(pwd(), "dataset")
    ds = filesDataset(dir)
    @test ds isa Luhot.FilesDataset

    stems = Luhot.stemsarray(ds)
    verbstems = filter(stems) do s
        s isa Luhot.VerbStem
    end
    @test length(verbstems) == 1

end
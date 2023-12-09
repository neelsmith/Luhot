using Pkg
Pkg.activate("..")


using Luhot#, BiblicalHebrew
using CitableParserBuilder
using Unicode
using Orthography

using Test
using TestSetExtensions



@testset "All the tests" begin
    println(map(s -> replace(s, r".jl$" => ""), ARGS))
    @includetests map(s -> replace(s, r".jl$" => ""), ARGS)
end

"""Abstract type of a morphological parser."""
abstract type LuhotParser <: CitableParser end

Pkg.project()
const RULE_URN = Cite2Urn(string("urn:cite2:luhot:rules.algorithmic:", replace(string(Pkg.project().version), "." => "_")))

"""Catch all method of `parsetoken` function.
$(SIGNATURES)
"""
function parsetoken(s::AbstractString, p::T) where {T <: LuhotParser}
    @warn("Function parsetoken is not implemented for type $(typeof(p))")::Vector{Analysis}
    []
end


"""Parse a list of tokens using parser `parser`.

$(SIGNATURES)
Returns a Dict mapping strings to a (possibly empty) vector of `Analysis` objects.
"""
function parsewordlist(vocablist, parser::LuhotParser; data = nothing, countinterval = 100) 
    @info("Parsing list of $(length(vocablist)) tokens.")
    parses = []
    for (i,s) in enumerate(vocablist)
        push!(parses, parsetoken(s, parser))
        if i % countinterval == 0
            @info("$(i) ($(s))...")
        end
    end
    parses
end


"""Catch all method of `lexemes` function.
$(SIGNATURES)
"""
function lexemes(p::T) where {T <: LuhotParser}
    @warn("Function lexemes is not implemented for type $(typeof(p))")
    []
end


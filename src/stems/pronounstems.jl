"""A record for a single uninflected stem.

$(SIGNATURES)
"""
struct LuhotPronounStem <: LuhotStem
    stemid::StemUrn
    lexid::LexemeUrn
    root::AbstractString
    stemclass::AbstractString
    person::hmpPerson
    number::hmpNumber
    gender::hmpGender
    enclitic::Bool
end


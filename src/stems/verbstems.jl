"""A record for a single uninflected stem.

$(SIGNATURES)
"""
struct VerbStem <: LuhotStem
    stemid::AbbreviatedUrn
    lexid::AbbreviatedUrn
    root::AbstractString
end


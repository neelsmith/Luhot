struct HMPTense <: HebrewMorphologicalProperty
    code::Int64
    function HMPTense(code)
        code in keys(codetopatterndict) ? new(code) : throwDomainError(string(code, " is out of range for a Hebrew tense."))
    end
end

"""Create a `HMPTense` from its string name."""
function hmpTense(s::S)::HMPTense where S <: AbstractString
    if s in keys(tensetocodedict) 
        HMPVerbPattern(tensetocodedict[s])
    else 
        DomainError(string(s, " is not a valid value for tense."))
    end
end

"""Create a `HMPTense` from its integer code."""
function hmpTense(code::Int64)
    HMPTense(code)
end

"""Find code for tense."""
function code(tns::HMPTense)
    tns.code
end


"""Find label for tense."""
function label(tns::HMPTense)
    codetotensedict[tns.code]
end

"""Dict mapping codes to labels for verb pattern.

$(SIGNATURES)
"""
const codetotensedict = Dict(
    1 => "perfect",
    2 => "imperfect"
)


const tensetocodedict = Dict(
    "perfect"  => 1,
    "imperfect" => 2
)
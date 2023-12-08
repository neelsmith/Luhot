struct HMPPerson <: HebrewMorphologicalProperty
    code::Int64
    function HMPPerson(code)
        code in keys(codetopersondict) ? new(code) : throwDomainError(string(code, " is out of range for a Hebrew person."))
    end
end

"""Create a `HMPPerson` from its string name."""
function hmpPerson(s::S)::HMPPerson where S <: AbstractString
    if s in keys(persontocodedict) 
        HMPPerson(persontocodedict[s])
    else 
        DomainError(string(s, " is not a valid value for person."))
    end
end

"""Create a `HMPPerson` from its integer code."""
function hmpPerson(code::Int64)
    HMPPerson(code)
end

"""Find code for person."""
function code(p::HMPPerson)
    p.code
end


"""Find label for person."""
function label(p::HMPPerson)
    codetopersondict[p.code]
end

"""Dict mapping codes to labels for person.

$(SIGNATURES)
"""
const codetopersondict = Dict(
    1 => "first",
    2 => "second",
    3 => "third"
)


"""Dict mapping codes to labels for person.

$(SIGNATURES)
"""
const persontocodedict = Dict(
    "first"  => 1,
    "second" => 2,
    "third" => 3
)

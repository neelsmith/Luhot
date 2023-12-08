struct HMPNumber <: HebrewMorphologicalProperty
    code::Int64
    function HMPNumber(code)
        code in keys(codetonumberdict) ? new(code) : throwDomainError(string(code, " is out of range for a Hebrew number."))
    end
end

"""Create a `HMPNumber` from its string name."""
function hmpNumber(s::S)::HMPNumber where S <: AbstractString
    if s in keys(numbertocodedict) 
        HMPNumber(numbertocodedict[s])
    else 
        DomainError(string(s, " is not a valid value for number."))
    end
end

"""Create a `HMPNumber` from its integer code."""
function hmpNumber(code::Int64)
    HMPNumber(code)
end

"""Find code for number."""
function code(n::HMPNumber)
    n.code
end


"""Find label for number."""
function label(n::HMPNumber)
    codetonumberdict[n.code]
end

"""Dict mapping codes to labels for number.

$(SIGNATURES)
"""
const codetonumberdict = Dict(
    1 => "singular",
    2 => "dual",
    3 => "plural"
)

"""Dict mapping labels to code for number.

$(SIGNATURES)
"""
const numbertocodedict = Dict(
    "singular"  => 1,
    "dual" => 2,
    "plural" => 3
)

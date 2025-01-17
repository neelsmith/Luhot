struct HMPVerbPattern <: HebrewMorphologicalProperty
    code::Int64
    function HMPVerbPattern(code)
        code in keys(codetopatterndict) ? new(code) : throwDomainError(string(code, " is out of range for Hebrew verb pattern."))
    end
end


"""Override Base.show for verb pattern property.
$(SIGNATURES)
"""
function show(io::IO, prop::HMPVerbPattern)
    print(io, label(prop))
end


"""Create a `HMPVerbPattern` from its string name."""
function hmpPattern(s::S)::HMPVerbPattern where S <: AbstractString
    if s in keys(patterntocodedict) 
        HMPVerbPattern(patterntocodedict[s])
    else 
        DomainError(string(s, " is not a valid value for verb pattern."))
    end
end


"""Create a `HMPVerbPattern` from its integer code."""
function hmpPattern(code::Int64)
    HMPVerbPattern(code)
end

"""Find code for a verbal pattern."""
function code(verbpattern::HMPVerbPattern)
    verbpattern.code
end


"""Find lable for a verbal pattern."""
function label(verbpattern::HMPVerbPattern)
    codetopatterndict[verbpattern.code]
end

"""Dict mapping codes to labels for verb pattern.

$(SIGNATURES)
"""
const codetopatterndict = Dict(
    1 => "qal",
    2 => "niphal",
    3 => "piel",
    4 => "pual",
    5 => "hiphil",
    6 => "hophal",
    7 => "hithpael"
)


const patterntocodedict = Dict(
    "qal"  => 1,
    "niphal" => 2,
    "piel" => 3,
    "pual" => 4,
    "hiphil" => 5,
    "hophal" => 6,
    "hithpael" => 7
)
struct HMPVerbPattern <: HebrewMorphologicalProperty
    code::Int32
    function HMPVerbPattern(code)
        code in keys(verbpatterndict) ? new(code) : throwDomainError(string(code, " is out of range for Hebrew verb pattern."))
    end
end

function hmpVerbPattern(s::S) where S <: AbstractString
    s in keys(verbpatterndict) ? HMPVerbPattern(verbpatterndict[s]) : DomainError(string(s, " is not a valid value for verb pattern.")) 
end
#=
struct GMPPerson <: GreekMorphologicalProperty
    code::Int64
    function GMPPerson(code)
        code in keys(personlabeldict) ? new(code) : throw(DomainError(string(code, " is out of range.")))
    end
end

function gmpPerson(s::AbstractString)
    s in keys(personcodedict) ? GMPPerson(personcodedict[s]) : DomainError(string(s, " is not a valid value for person.")) 
end

function gmpPerson(code::Int64)
    GMPPerson(code)
end

function code(person::GMPPerson)
    person.code
end

function label(person::GMPPerson)
    personlabeldict[person.code]
end

=#
"""Dict mapping codes to labels for verb pattern.

$(SIGNATURES)
"""
const verbpatterndict = Dict(
    1 => "qal",
    2 => "niphil",
    3 => "piel",
    4 => "pual",
    5 => "hiphil",
    6 => "hophal",
    7 => "hithpael"
)
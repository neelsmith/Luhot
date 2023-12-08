struct HMPVerbPattern <: HebrewMorphologicalProperty
    code::Int64
    function HMPVerbPattern(code)
        code in keys(codetopatterndict) ? new(code) : throwDomainError(string(code, " is out of range for Hebrew verb pattern."))
    end
end

"""Create a `HMPVerbPattern` from its string name."""
function hmpVerbPattern(s::S) where S <: AbstractString
    klist = keys(patterntocodedict) |> collect
    @info("Looking for $(s) in $(klist)")

    if s in keys(patterntocodedict) 
        HMPVerbPattern(patterntocodedict[s])
    else 
        DomainError(string(s, " is not a valid value for verb pattern."))
    end
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
const codetopatterndict = Dict(
    1 => "qal",
    2 => "niphil",
    3 => "piel",
    4 => "pual",
    5 => "hiphil",
    6 => "hophal",
    7 => "hithpael"
)


const patterntocodedict = Dict(
    "qal"  => 1,
    "niphil" => 2,
    "piel" => 3,
    "pual" => 4,
    "hiphil" => 5,
    "hophal" => 6,
    "hithpael" => 7
)
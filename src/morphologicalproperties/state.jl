struct HMPSubstantiveState <: HebrewMorphologicalProperty
    code::Int64
    function HMPSubstantiveState(code)
        code in keys(codetonumberdict) ? new(code) : throwDomainError(string(code, " is out of range for a Hebrew number."))
    end
end

"""Override Base.show for substantive state property.
$(SIGNATURES)
"""
function show(io::IO, prop::HMPSubstantiveState)
    print(io, label(prop))
end

"""Create a `HMPSubstantiveState` from its string name."""
function hmpSubstantiveState(s::S)::HMPSubstantiveState where S <: AbstractString
    if s in keys(statetocodedict) 
        hmpSubstantiveState(statetocodedict[s])
    else 
        DomainError(string(s, " is not a valid value for substantive state."))
    end
end

"""Create a `HMPSubstantiveState` from its integer code."""
function hmpSubstantiveState(code::Int64)
    HMPSubstantiveState(code)
end

"""Find code for substantive state."""
function code(st::HMPSubstantiveState)
    st.code
end

"""Find label for substantive state."""
function label(st::HMPSubstantiveState)
    codetostatedict[st.code]
end


"""Dict mapping codes to labels for number.

$(SIGNATURES)
"""
const codetostatedict = Dict(
    1 => "absolute",
    2 => "construct"
)

"""Dict mapping labels to code for number.

$(SIGNATURES)
"""
const statetocodedict = Dict(
    "absolute"  => 1,
    "construct" => 2
)


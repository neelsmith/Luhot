abstract type Dataset end

"""Collect all stems in `ds`.
$(SIGNATURES)
"""
function stemsarray(ds::T) where {T <: Dataset}
    @warn("Function stemsarray not implemented for type $(typeof(ds))")
    nothing
end
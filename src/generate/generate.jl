
"""Generate the correct string for a given stem and form.
$(SIGNATURES)
"""
function generate(stem::S, form::F) where {S <: LuhotStem, F <: HebrewForm}
    @warn("generate function not implemented for type $(typeof(form))")
    nothing
end

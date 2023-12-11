
"""Generate the correct string for a given stem and form.
$(SIGNATURES)
"""
function generate(stem::S, form::F) where {S <: LuhotStem, F <: HebrewForm}
    @warn("generate function not implemented for combination of stem type $(typeof(stem)) and form type $(typeof(form))")
    nothing
end

"""Generate the correct string for a form built from a given root string.
$(SIGNATURES)
"""
function generate(root::S, form::F) where {S <: AbstractString, F <: HebrewForm}
    @warn("generate function not implemented for combination of stem type $(typeof(stem)) and form type $(typeof(form))")
    nothing
end

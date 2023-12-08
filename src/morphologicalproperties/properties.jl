"""Abstract type of a morphological property in Luhot."""
abstract type HebrewMorphologicalProperty end


"""Default method for `code` function on subtypes of `HebrewMorphologicalProperty`."""
function code(hmp::T) where {T <: HebrewMorphologicalProperty}
    @warn "Function `code`` not implemented for forms of type $(typeof(hmp))."
    nothing
end


"""Default method for `label` function on subtypes of `HebrewMorphologicalProperty`."""
function label(hmp::T) where {T <: HebrewMorphologicalProperty}
    @warn "Function `label`` not implemented for forms of type $(typeof(hmp))."
    nothing
end

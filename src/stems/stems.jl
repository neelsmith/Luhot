abstract type LuhotStem <: Stem end
abstract type LuhotIrregularStem <: LuhotStem end

"""Default method for function `pos` for subtypes of `LuhotStem`."""
function pos(stem::T) where {T <: LuhotStem}
    @warn "Function lexeme not implemented for stems of type $(typeof(stem))."
    nothing
end

"""Default method for function `lexeme` for subtypes of `LuhotStem`."""
function lexeme(stem::T) where {T <: LuhotStem}
    @warn "Function lexeme not implemented for stems of type $(typeof(stem))."
    nothing
end

"""Default method for function `hmpVerbPattern` for subtypes of `LuhotStem`."""
function hmpVerbPattern(stem::T) where {T <: LuhotStem}
    @warn "Function hmpVerbPattern not implemented for stems of type $(typeof(stem))."
    nothing
end

"""Default method for function `hmpTense` for subtypes of `LuhotStem`."""
function hmpTense(stem::T) where {T <: LuhotStem}
    @warn "Function hmpTense not implemented for stems of type $(typeof(stem))."
    nothing
end


"""Default method for function `hmpGender` for subtypes of `LuhotStem`."""
function hmpGender(stem::T) where {T <: LuhotStem}
    @warn "Function hmpGender not implemented for stems of type $(typeof(stem))."
    nothing
end


"""Default method for function `hmpNumber` for subtypes of `LuhotStem`."""
function hmpNumber(stem::T) where {T <: LuhotStem}
    @warn "Function hmpNumber not implemented for stems of type $(typeof(stem))."
    nothing
end


"""Default method for function `hmpPerson` for subtypes of `LuhotStem`."""
function hmpPerson(stem::T) where {T <: LuhotStem}
    @warn "Function hmpPerson not implemented for stems of type $(typeof(stem))."
    nothing
end


"""Default method for function `hmpUninflected` for subtypes of `LuhotStem`."""
function hmpUninflected(stem::T) where {T <: LuhotStem}
    @warn "Function hmpUninflected not implemented for stems of type $(typeof(stem))."
    nothing
end

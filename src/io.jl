"""
Implementations of this type can read and write delimited text formatting of Luhot morphological data.

$(SIGNATURES)
"""
abstract type LuhotIO end


"""
LuhotIO type for reading and writing data for finite verb form.

$(SIGNATURES)
"""    
struct VerbIO <: LuhotIO
end
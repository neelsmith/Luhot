"""A record for a single uninflected stem.

$(SIGNATURES)
"""
struct VerbStem <: LuhotStem
    stemid::StemUrn
    lexid::LexemeUrn
    root
    stemclass
end


"""Implementation of reading one row of a stems table for finite verbs.

$(SIGNATURES)
"""
function readstemrow(delimited::AbstractString, io::VerbIO ; delimiter = "|")
    #stem|lexeme|root|class
    parts = split(delimited, delimiter)
    if length(parts) < 4
        throw(ArgumentError("readstemrow for verb: too few parts in $(delimited)"))
    end
    stemid = StemUrn(parts[1])
    lexid = LexemeUrn(parts[2])
    root = parts[3]
    stemclass = parts[4]
   
    VerbStem(stemid,lexid,root,stemclass)
end

"""Part of speech value for a `VerbStem`."""
function pos(vb::VerbStem)
    :verb
end


"""Verb stems are citable by Cite2Urn"""
CitableTrait(::Type{VerbStem}) = CitableByCite2Urn()


"""Identify value of stem string for `vs`.
$(SIGNATURES)
"""
function stemstring(vs::VerbStem)
   vs.root
end



"""Identify lexeme for `vs`.
$(SIGNATURES)
"""
function lexeme(vs::VerbStem)
    vs.lexid
end

"""Synonym for generic `stemstring` function when
stem is a `VerbStem`.
$(SIGNATURES)
"""
function root(vs::VerbStem)
    vs.root
end



"""Human-readlable label for a `VerbStem`.

$(SIGNATURES)
Required for `CitableTrait`.
"""
function label(vs::VerbStem)
    string("Verb stem ", 
        root(vs),
        " (",  lexeme(vs), ")")
end


#=
"""Identifying URN for a `VerbStem`.  If
no registry is included, use abbreviated URN;
otherwise, expand to full `Cite2Urn`.

$(SIGNATURES)
Required for `CitableTrait`.
"""
function urn(vs::VerbStem; registry = nothing)
    if isnothing(registry)
        vs.stemid
    else
        expand(vs.stemid, registry)
    end
end


"""Compose CEX text for a `VerbStem`.
If `registry` is nothing, use abbreivated URN;
otherwise, expand identifier to full `Cite2Urn`.

$(SIGNATURES)
Required for `CitableTrait`.
"""
function cex(vs::VerbStem; delimiter = "|", registry = nothing)
    if isnothing(registry)
        join([vs.stemid, label(vs), stemstring(vs), lexeme(vs), inflectionclass(vs)], delimiter)
    else
        c2urn = expand(vs.stemid, registry)
        join([c2urn, label(vs), stemstring(vs), lexeme(vs), inflectionclass(vs)], delimiter)
    end
end
=#


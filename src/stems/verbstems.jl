"""A record for a single uninflected stem.

$(SIGNATURES)
"""
struct LuhotVerbStem <: LuhotStem
    stemid::StemUrn
    lexid::LexemeUrn
    root::AbstractString
    stemclass::AbstractString
end


"""Override Base.show for verb stem type.
$(SIGNATURES)
"""
function show(io::IO, vb::LuhotVerbStem)
    print(io, label(vb))
end

"""Override Base.== for verb stem type.
$(SIGNATURES)
"""
function ==(s1::LuhotVerbStem, s2::LuhotVerbStem)
    urn(s1) == urn(s2) &&
    lexeme(s1) == lexeme(s2) &&
    stemvalue(s1) == stemvalue(s2)  &&

    inflectionclass(s1) == inflectionclass(s2)
end


CitableTrait(::Type{LuhotVerbStem}) = CitableByCite2Urn()
"""Verb stems are citable by Cite2Urn
$(SIGNATURES)
"""
function citabletrait(::Type{LuhotVerbStem})
    CitableByCite2Urn()
end



"""Human-readlable label for a `LuhotVerbStem`.

$(SIGNATURES)
Required for `CitableTrait`.
"""
function label(vs::LuhotVerbStem)
    string("Verb stem ", 
        root(vs),
        " (",  lexeme(vs), ")")
end



"""Identifying URN for a `LuhotVerbStem`.  If
no registry is included, use abbreviated URN;
otherwise, expand to full `Cite2Urn`.

$(SIGNATURES)
Required for `CitableTrait`.
"""
function urn(vs::LuhotVerbStem; registry = nothing)
    if isnothing(registry)
        vs.stemid
    else
        expand(vs.stemid, registry)
    end
end



struct LuhotVerbStemCex <: CexTrait end
"""Verb stems are are CEX serializable.
$(SIGNATURES)
"""
function cextrait(::Type{LuhotVerbStem})  
    LuhotVerbStemCex()
end


"""Compose CEX text for a `LuhotVerbStem`.
If `registry` is nothing, use abbreivated URN;
otherwise, expand identifier to full `Cite2Urn`.

$(SIGNATURES)
Required for `CitableTrait`.
"""
function cex(vs::LuhotVerbStem; delimiter = "|", registry = nothing)
    if isnothing(registry)
        join([vs.stemid, label(vs), stemstring(vs), lexeme(vs)], delimiter)
    else
        c2urn = expand(vs.stemid, registry)
        join([c2urn, label(vs), stemstring(vs), lexeme(vs)], delimiter)
    end
end



"""Instantiate a verb stem from delimited-text source.
$(SIGNATURES)
"""
function fromcex(traitvalue::LuhotVerbStemCex, cexsrc::AbstractString, T;      
    delimiter = "|", configuration = nothing, strict = true)
    parts = split(cexsrc, delimiter)
    if length(parts) < 4
        throw(ArgumentError("readstemrow for verb: too few parts in $(delimited)"))
    end
    stemid = StemUrn(parts[1])
    lexid = LexemeUrn(parts[2])
    root = parts[3]
    stemclass = parts[4]
   
    LuhotVerbStem(stemid,lexid,root,stemclass)
end


"""Part of speech value for a `LuhotVerbStem`."""
function pos(vb::LuhotVerbStem)
    :verb
end



"""Identify value of stem string for `vs`.
$(SIGNATURES)
"""
function stemstring(vs::LuhotVerbStem)
   vs.root
end

"""Identify lexeme for `vs`.
$(SIGNATURES)
"""
function lexeme(vs::LuhotVerbStem)
    vs.lexid
end

"""Synonym for generic `stemstring` function when
stem is a `LuhotVerbStem`.
$(SIGNATURES)
"""
function root(vs::LuhotVerbStem)::String
    vs.root |> String
end



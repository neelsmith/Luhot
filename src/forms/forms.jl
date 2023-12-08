"""Abstract type of a morphological form in Luhot."""
abstract type HebrewForm end

"""Hebrew morphological forms are citable by Cite2Urn"""
CitableTrait(::T) where {T <: HebrewForm} = CitableByCite2Urn()


#=
Add rest of CITE interface here....

"""Convert a `GreekMorphologicalForm` to a Cite2Urn.

$(SIGNATURES)

All subclasses of `GreekMorphologicalForm` should implement this specifically for their subclass.
"""
function urn(mf::T) where {T <: GreekMorphologicalForm}
    @warn("urn: unrecognized type of GreekMorphologicalForm.")
    nothing
end

"""Label for a form.

$(SIGNATURES)

All subclasses of `GreekMorphologicalForm` should implement this specifically for their subclass.
"""
function label(mf::T) where {T <: GreekMorphologicalForm}
    @warn("urn: unrecognized type of GreekMorphologicalForm.")
    nothing
end

"""Convert a `GreekMorphologicalForm` form to a delimited-text string. 

$(SIGNATURES)
"""
function cex(mf::T; delimiter = "|") where {T <: GreekMorphologicalForm}
    join([urn(mf), label(mf)], delimiter)
end


=#




#=
"""Create a `GreekMorphologicalForm` from a form code.
$(SIGNATURES)
"""
function greekForm(codestr::AbstractString)
    if poscode(codestr) == ADJECTIVE
        gmfAdjective(codestr)
    elseif poscode(codestr) == NOUN
        gmfNoun(codestr)
    elseif poscode(codestr) == FINITEVERB
        gmfFiniteVerb(codestr)
    elseif poscode(codestr) == VERBALADJECTIVE
        gmfVerbalAdjective(codestr)
    elseif poscode(codestr) == INFINITIVE
        gmfInfinitive(codestr)
    elseif poscode(codestr) == PARTICIPLE
        gmfParticiple(codestr)
    elseif poscode(codestr) == PRONOUN
        gmfPronoun(codestr)
    elseif poscode(codestr) == UNINFLECTED
        gmfUninflected(codestr)
    end
end

"""Create a `GreekMorphologicalForm` from a `FormUrn`.
$(SIGNATURES)
"""
function greekForm(u::CitableParserBuilder.FormUrn)
    greekForm(CitableParserBuilder.objectid(u))
end

"""Create a `GreekMorphologicalForm` from `u`, a `Cite2Urn` identifying a form.
$(SIGNATURES)
"""
function greekForm(u::Cite2Urn)
    greekForm(objectcomponent(u))
end

"""Create a `GreekMorphologicalForm` from the `FormUrn` in `a`.
$(SIGNATURES)
"""
function greekForm(a::Analysis)
    greekForm(a.form)
end


function greekForm(r::T) where {T <: KanonesRule}
    formurn(r) |> greekForm
end
=#
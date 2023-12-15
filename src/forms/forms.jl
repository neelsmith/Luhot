"""Abstract type of a morphological form in Luhot."""
abstract type HebrewForm end

const COLLECTION_ID = "forms"
const BASE_MORPHOLOGY_URN = "urn:cite2:luhot:$(COLLECTION_ID).v1:"


"""Hebrew morphological forms are citable by Cite2Urn"""
CitableTrait(::T) where {T <: HebrewForm} = CitableByCite2Urn()


"""Return Luhot code for analytical type
encoded in first digit of `codestring`.
$(SIGNATURES)
"""
function poscode(codestring::AbstractString)
    parse(Int32, codestring[1])
end

"""Compose CEX representation of all possible forms.
$(SIGNATURES)
"""
function allformscex()
    string(finiteverbscex(),"\n")
    # nouns, etc....
end

"""Create a `HebrewForm` from a form code.
$(SIGNATURES)
"""
function hebrewForm(codestr::AbstractString)
    if poscode(codestr) == FINITEVERB
        hmfFiniteVerb(codestr)
    else
        @warn("PoS code $(poscode(codestr)) not recognized or notyet implemented.")
        nothing
        #=
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
        =#
    end
end

"""Create a `HebrewForm` from a `Cite2Urn`.
$(SIGNATURES)
"""
function hebrewForm(u::Cite2Urn)
    hebrewForm(objectcomponent(u))
end

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
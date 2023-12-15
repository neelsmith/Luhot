struct HebrewFiniteVerb <: HebrewForm
    vpattern::HMPVerbPattern
    vtense::HMPTense
    vperson::HMPPerson
    vnumber::HMPNumber
    vgender::HMPGender

    # object endings?

end

"""Compose a readable label for the form of a `HebrewFiniteVerb`.
$(SIGNATURES)
"""
function label(v::HebrewFiniteVerb)
    pieces = ["verb:", label(v.vpattern), label(v.vtense), 
    label(v.vperson), label(v.vnumber), label(v.vgender)]
    join(pieces, " ")
end

"""Shorthand summary of person, number and gender 
properties as 3-letter string.
$(SIGNATURES)
"""
function pngSummary(v::HebrewFiniteVerb)
    string(
        hmpPerson(v).code,
        label(hmpNumber(v))[1],
        label(hmpGender(v))[1]
    )
end

"""Find verb pattern for a `HebrewFiniteVerb`.
$(SIGNATURES)
"""
function hmpPattern(v::HebrewFiniteVerb)
    v.vpattern
end

"""Find verb pattern for a `HebrewFiniteVerb`.
$(SIGNATURES)
"""
function hmpTense(v::HebrewFiniteVerb)
    v.vtense
end

"""Find person for a `HebrewFiniteVerb`.
$(SIGNATURES)
"""
function hmpPerson(v::HebrewFiniteVerb)
    v.vperson
end

"""Find person for a `HebrewFiniteVerb`.
$(SIGNATURES)
"""
function hmpNumber(v::HebrewFiniteVerb)
    v.vnumber
end


"""Find gender for a `HebrewFiniteVerb`.
$(SIGNATURES)
"""
function hmpGender(v::HebrewFiniteVerb)
    v.vgender
end

"""Create a `HebrewFiniteVerb` from a string value.

$(SIGNATURES)
"""
function hmfFiniteVerb(code::AbstractString)
    # PosPatTPNGStateUinflcat
    morphchars = split(code,"")
    pttrn = hmpPattern(parse(Int64, morphchars[2]))
    tns = hmpTense(parse(Int64, morphchars[3]))
    prsn = hmpPerson(parse(Int64, morphchars[4]))
    nmbr = hmpNumber(parse(Int64, morphchars[5]))
    gndr = hmpGender(parse(Int64, morphchars[6]))

    HebrewFiniteVerb(
        pttrn, tns, prsn, nmbr, gndr
    )
end

"""Compose delimited-text representation of CITE collection for morphological forms of finite verbs.

$(SIGNATURES)
"""
function finiteverbscex()
    # Sequence of integers in code string:
    # PosPatTPNGStateUninfcat

    # Pad out 0s for other properties TBD
    padothers = "00"

    lines = []
    # Limit person/number on imperative
    PERFECT = 1
    IMPERFECT = 2
    IMPERATIVE = 3
    JUSSIVE = 4

    patternkeys = keys(Luhot.codetopatterndict) |> collect |> sort
    personkeys = keys(Luhot.codetopersondict) |> collect |> sort

    SINGULAR = 1
    PLURAL = 3
    numberkeys  = [SINGULAR, PLURAL]

    MASCULINE = 1
    FEMININE  = 2
    genderkeys = [MASCULINE, FEMININE]
    for pttrn in patternkeys
        for tns in [PERFECT, IMPERFECT, JUSSIVE]
            for prsn in personkeys
                for nmbr in numberkeys
                    for gndr in genderkeys
                        u = string(BASE_MORPHOLOGY_URN,FINITEVERB, pttrn, tns, prsn, nmbr, gndr, padothers)
                        textlabel = string("verb: ", 
                        label(hmpPattern(pttrn))," ",
                        label(hmpTense(tns)), " ",
                        label(hmpPerson(prsn)), " ",
                        label(hmpNumber(nmbr))," ",
                        label(hmpGender(gndr))
                        )
                        push!(lines, string(u, "|", textlabel))
                    end
                end
            end
        end
    end

    SECOND = 2
    for pttrn in patternkeys
        for tns in [IMPERATIVE]
            for prsn in [SECOND]
                for nmbr in numberkeys
                    for gndr in genderkeys
                        u = string(BASE_MORPHOLOGY_URN,FINITEVERB, pttrn, tns, prsn, nmbr, gndr, padothers)
                        textlabel = string("verb: ", 
                        label(hmpPattern(pttrn))," ",
                        label(hmpTense(tns)), " ",
                        label(hmpPerson(prsn)), " ",
                        label(hmpNumber(nmbr))," ",
                        label(hmpGender(gndr))
                        )
                        push!(lines, string(u, "|", textlabel))
                    end
                end
            end
        end
    end

    join(lines, "\n")  
end

"""Finite verb forms are citable by Cite2Urn"""
CitableTrait(::Type{HebrewFiniteVerb}) = CitableByCite2Urn()

"""Compose a digital code for `verb`.
$(SIGNATURES)
"""
function code(verb::HebrewFiniteVerb)
    string(FINITEVERB, code(verb.vpattern),code(verb.vtense), code(verb.vperson),code(verb.vnumber), code(verb.vgender),"00")
end


"""Compose a Cite2Urn for a `HebrewFiniteVerb`.

$(SIGNATURES)
"""
function urn(verb::HebrewFiniteVerb)
    Cite2Urn(BASE_MORPHOLOGY_URN * code(verb) )
end

"""Create a `HebrewFiniteVerb` from a `Cite2Urn`.

$(SIGNATURES)
"""
function hmfFiniteVerb(urn::Cite2Urn)
    hmfFiniteVerb(objectcomponent(urn))
end

#=




"""Create a `HebrewFiniteVerb` from a `FormUrn`.

$(SIGNATURES)
"""
function gmfFiniteVerb(f::FormUrn)
    gmfFiniteVerb(f.objectid)
end

"""Create a `HebrewFiniteVerb` from an `Analysis`.

$(SIGNATURES)
"""
function gmfFiniteVerb(a::Analysis)
    gmfFiniteVerb(a.form)
end



"""Compose a `FormUrn` for a `HebrewFiniteVerb`.

$(SIGNATURES)
"""
function formurn(verbform::HebrewFiniteVerb)
    FormUrn(string("$(COLLECTION_ID).", code(verbform)))
end


=#
struct HebrewFiniteVerb <: HebrewForm
    vpattern::HMPVerbPattern
    vtense::HMPTense
    vperson::HMPPerson
    vnumber::HMPNumber
    vgender::HMPGender

    # object endings?

end

"""Shorthand summary of person, number and gender 
properties as 3-letter string."""
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
    morphchars = split(code,"")
    
    # PosPatTPNG...

    #=
    vpattern::HMPVerbPattern
    vtense::HMPTense
    vperson::HMPPerson
    vnumber::HMPNumber
    vgender::HMPGender
    =#



    #=
    tns = gmpTense(parse(Int64, morphchars[4]))
    md = gmpMood(parse(Int64, morphchars[5]))
    vc = gmpVoice(parse(Int64,morphchars[6]))
    prsn = gmpPerson(parse(Int64, morphchars[2]))
    nmbr = gmpNumber(parse(Int64, morphchars[3]))
    =#


    #=
    HebrewFiniteVerb(
        ptrn, tns, prsn, nmbr, gndr
    )
    =#
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
    join(lines, "\n")  
end




"""Finite verb forms are citable by Cite2Urn"""
CitableTrait(::Type{HebrewFiniteVerb}) = CitableByCite2Urn()

#=
"""Compose a digital code for `verb`.
$(SIGNATURES)
"""
function code(verb::HebrewFiniteVerb)
    string(FINITEVERB, code(verb.vperson),code(verb.vnumber), code(verb.vtense), code(verb.vmood), code(verb.vvoice),"0000")
end


"""Compose a label for a `HebrewFiniteVerb`

$(SIGNATURES)
"""
function label(verb::HebrewFiniteVerb)
    join(
        [
        "finite verb: ",
        label(verb.vtense), 
        label(verb.vmood), 
        label(verb.vvoice),
        label(verb.vperson),  
        label(verb.vnumber)
        ], " ")
end

"""Compose a Cite2Urn for a `HebrewFiniteVerb`.

$(SIGNATURES)
"""
function urn(verb::HebrewFiniteVerb)
    # PosPNTMVGCDCat
    Cite2Urn(BASE_MORPHOLOGY_URN * code(verb) )
end

"""Create a `HebrewFiniteVerb` from a string value.

$(SIGNATURES)
"""
function gmfFiniteVerb(code::AbstractString)
    morphchars = split(code,"")
    # PosPNTMVGCDCat
    
    tns = hmpTense(parse(Int64, morphchars[4]))
    md = hmpMood(parse(Int64, morphchars[5]))
    vc = hmpVoice(parse(Int64,morphchars[6]))
    prsn = hmpPerson(parse(Int64, morphchars[2]))
    nmbr = hmpNumber(parse(Int64, morphchars[3]))
    
    HebrewFiniteVerb(
        prsn,
        nmbr,
        tns,
        md, 
        vc
    )
end


"""Create a `HebrewFiniteVerb` from a `Cite2URN`.

$(SIGNATURES)
"""
function gmfFiniteVerb(urn::Cite2Urn)
    gmfFiniteVerb(objectcomponent(urn))
end


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
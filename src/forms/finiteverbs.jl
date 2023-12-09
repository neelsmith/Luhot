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





"""Finite verb forms are citable by Cite2Urn"""
CitableTrait(::Type{HebrewFiniteVerb}) = CitableByCite2Urn()

#=
"""Compose a digital code for `adj`.
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


"""Compose delimited-text representation of CITE collection for morphological forms of finite verbs.

$(SIGNATURES)
"""
function finiteverbscex()

    #tensekeys = keys(Kanones.tenselabeldict)   |> collect |> sort 
    moodkeys = keys(Kanones.moodlabeldict)   |> collect |> sort 
    voicekeys = keys(Kanones.voicelabeldict)   |> collect |> sort 
    personkeys = keys(Kanones.personlabeldict)  |> collect |> sort 
    numberkeys = keys(Kanones.numberlabeldict)  |> collect |> sort 

    lines = []
    PRESENT = 1
    IMPERFECT = 2
    FUTURE = 3
    AORIST = 4
    PERFECT = 5
    PLUPERFECT = 6
    
    
    # indic mood only: imperfect, pluperfect
    INDICATIVE = 1
    # PosPNTMVGCDCat
    for tense in [IMPERFECT, PLUPERFECT]
        for pers in personkeys
            for num in numberkeys
                for voice in voicekeys
                    u = string(BASE_MORPHOLOGY_URN, FINITEVERB, 
                     pers, num, tense, INDICATIVE, voice,"00000")
                    
                    label = string("verb: ", 
                    label(hmpPerson(pers)), 
                    label(hmpNumber(num)), 
                    label(hmpTense(tense)), 
                    "indicative", 
                    label(hmpVoice(voice)))
                    
                    cex = string(u, "|", label)
                    push!(lines, cex)
                end
            end
        end 
    end

    # indicative and optative moods only: future
    OPTATIVE = 3
    for mood in [INDICATIVE, OPTATIVE]
        for pers in personkeys
            for num in numberkeys
                for voice in voicekeys
                    u = string(BASE_MORPHOLOGY_URN, FINITEVERB, 
                    pers, num, FUTURE, mood, voice,"00000")
                    
                    label = string("verb: ", 
                    code(hmpPerson(pers)), 
                    code(hmpNumber(num))s, 
                    "future", 
                    code(hmpMood(mood)), 
                    code(hmpVoice(voice)))
                    
                    cex = string(u, "|", label)
                    push!(lines, cex)
                end
            end
        end 
    end
  
    # all tense/mood combinations
    # present, aorist, perfect
    for tense in [PRESENT, AORIST, PERFECT]
        for pers in personkeys
            for num in numberkeys
                for mood in moodkeys
                    for voice in voicekeys
                        u = string(BASE_MORPHOLOGY_URN, FINITEVERB, 
                        pers, num, tense, mood, voice,"00000")
                        
                        label = string("verb: ", 
                        code(hmpPerson(pers)), 
                        code(hmpNumber(num)), 
                        code(hmpTense(tense)), 
                        code(hmpMood(mood)), 
                        code(hmpVoice(voice)))
                        
                        cex = string(u, "|", label)
                        push!(lines, cex)
                    end
                end
            end
        end 
    end
    join(lines, "\n")  
end
=#
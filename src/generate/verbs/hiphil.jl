"""Compose a string for the given person, number, gender form of 
the given verb in the imperative of the *hiphil* pattern.
$(SIGNATURES)
"""
function hiphil_imperative(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
    hiphil_imperative_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end

"""Compose a string for the given person, number, gender form of 
the given sound verb in the imperative of the *hiphil* pattern.
$(SIGNATURES)
"""
function hiphil_imperative_sound(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    pe = consonants[1]
    ayin = consonants[2]
    lamed = consonants[3]
    form = pngSummary(verb)
    if form == "2sm"
        string(BiblicalHebrew.patah("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.tsere(ayin), lamed)
    elseif form == "2sf"
        string(BiblicalHebrew.patah("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.hiriq(ayin)),"י",  BiblicalHebrew.hiriq(lamed), "י")
    elseif form == "2pm"
        string(BiblicalHebrew.patah("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.hiriq(ayin)),"י", lamed, BiblicalHebrew.mappiq("ו"))
    elseif form == "2pf"
        string(BiblicalHebrew.patah("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.tsere(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.qamats("נ"), "ה")
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
end




"""Compose a string for the given person, number, gender form of 
the given verb in the perfect tense of the *hiphil* pattern.
$(SIGNATURES)
"""
function hiphil_perfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
        hiphil_perfect_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end



"""Compose a string for the given person, number, gender form of 
the given sound verb in the perfect tense of the *hiphil* pattern.
$(SIGNATURES)
"""
function hiphil_perfect_sound(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    pe = consonants[1]
    ayin = consonants[2]
    lamed = consonants[3]
    form = pngSummary(verb)
    # initial = check if consonants[1] is in the begadkefat and
    # if so add daghesh
    #
    # for consonants 2-3, check depending on person-number for need of dagesh

    if form == "3sm"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.hiriq(ayin), "י", lamed)
    elseif form == "3sf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.hiriq(ayin)), "י", BiblicalHebrew.qamats(lamed),"ה")
    elseif form == "2sm"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.patah(ayin)),  BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.qamats("ת")))
    elseif form == "2sf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.patah(ayin),  BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.sheva("ת")))        
    elseif form == "1sc" || form == "1sm" || form == "1sf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.patah(ayin)),  BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.hiriq("ת")),"י")    
       
        
    elseif form == "3pc" || form == "3pm" || form == "3pf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.hiriq(ayin)), "י", lamed, BiblicalHebrew.mappiq("ו"))
    elseif form == "2pm"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.patah(ayin), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.seghol("ת")), "ם")    
    elseif form == "2pf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.patah(ayin), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.seghol("ת")), "ן")
    elseif form == "1pc" || form == "1pm" || form == "1pf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.patah(ayin)), BiblicalHebrew.sheva(lamed), "נ", BiblicalHebrew.mappiq("ו"))
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
    
end




"""Compose a string for the given person, number, gender form of 
the given verb in the imperfect tense of the *hiphil* pattern.
$(SIGNATURES)
"""
function hiphil_imperfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
        hiphil_imperfect_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end

"""Compose a string for the given person, number, gender form of 
the given sound verb in the imperfect tense of the *hiphil* pattern.
$(SIGNATURES)
"""
function hiphil_imperfect_sound(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    pe = consonants[1]
    ayin = consonants[2]
    lamed = consonants[3]
    form = pngSummary(verb)
    
    if form == "3sm"
        string(BiblicalHebrew.patah( "י"), BiblicalHebrew.sheva(pe), BiblicalHebrew.hiriq(ayin), "י", lamed)
    elseif form == "3sf"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.patah("ת")), BiblicalHebrew.sheva(pe), BiblicalHebrew.hiriq(ayin), "י", lamed)
    elseif form == "2sm"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.patah("ת")), BiblicalHebrew.sheva(pe), BiblicalHebrew.hiriq(ayin), "י", lamed)
    elseif form == "2sf"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.patah("ת")), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.hiriq(ayin)), "י", BiblicalHebrew.hiriq(lamed),"י")    
    elseif form == "1sc" || form == "1sm" || form == "1sf"
        string(BiblicalHebrew.patah("א"), BiblicalHebrew.sheva(pe), BiblicalHebrew.hiriq(ayin), "י", lamed)


    elseif form == "3pm"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.patah("י")), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.hiriq(ayin)), "י", lamed,BiblicalHebrew.mappiq("ו"))
    elseif form == "3pf"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.patah("ת")), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.tsere(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.qamats("נ"), "ה")
    elseif form == "2pm"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.patah("ת")), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.hiriq(ayin)), "י", lamed,BiblicalHebrew.mappiq("ו"))
    elseif form == "2pf"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.patah("ת")), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.tsere(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.qamats("נ"), "ה")
    elseif form == "1pc"
        string(BiblicalHebrew.patah("נ"), BiblicalHebrew.sheva(pe), BiblicalHebrew.hiriq(ayin), "י", lamed)

    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
    
end
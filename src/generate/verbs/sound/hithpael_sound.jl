
"""Compose a string for the given person, number, gender form of 
the given sound verb in the cohortative-jussive of the *hithpael* pattern.
$(SIGNATURES)
"""
function hithpael_jussive_sound(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    pe = consonants[1]
    ayin = consonants[2]
    lamed = consonants[3]
    form = pngSummary(verb)

    if form == "3sm"
        "hi: jusssive"
    elseif form == "3sf"
        "hi: jusssive"
    elseif form == "2sm"
        "hi: emphatic imperative"
    elseif form == "2sf"
        "hi: emphatic imperative"
    elseif form == "1sc" || form == "1sm" || form == "1sf"
        "hi: cohortative"

    elseif form == "3pm"
        "hi: jussive"
    elseif form == "3pf"
        "hi: jussive"  
    elseif form == "2pm"
        "hi: emphatic imperative"
    elseif form == "2pf"
        "hi: emphatic imperative"        
    elseif form == "1pc" || form == "1pm" || form == "1pf"
        "hi: cohortative"    
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
end


"""Compose a string for the given person, number, gender form of 
the given sound verb in the imperative of the *hithpael* pattern.
$(SIGNATURES)
"""
function hithpael_imperative_sound(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    pe = consonants[1]
    ayin = consonants[2]
    lamed = consonants[3]
    form = pngSummary(verb)
    if form == "2sm"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.dagesh(BiblicalHebrew.tsere(ayin)), lamed)
    elseif form == "2sf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.dagesh(BiblicalHebrew.sheva(ayin)), BiblicalHebrew.hiriq(lamed), "י")
    elseif form == "2pm"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.dagesh(BiblicalHebrew.sheva(ayin)), lamed, BiblicalHebrew.mappiq("ו"))
    elseif form == "2pf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.ole(BiblicalHebrew.dagesh(BiblicalHebrew.tsere(ayin))), BiblicalHebrew.sheva(lamed), BiblicalHebrew.qamats("נ"), "ה")
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
end


"""Compose a string for the given person, number, gender form of 
the given sound verb in the perfect of the *hithpael* pattern.
$(SIGNATURES)
"""
function hithpael_perfect_sound(root::String,verb::HebrewFiniteVerb)
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
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.tsere(BiblicalHebrew.dagesh(ayin)), BiblicalHebrew.sheva(lamed))
    elseif form == "3sf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.dagesh(BiblicalHebrew.sheva(ayin)), BiblicalHebrew.qamats(lamed), "ה")
    elseif form == "2sm"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.ole(BiblicalHebrew.dagesh(BiblicalHebrew.patah(ayin))), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.qamats("ת")))
    elseif form == "2sf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.dagesh(BiblicalHebrew.patah(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.sheva("ת")))   
    elseif form == "1sc" || form == "1sm" || form == "1sf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.ole(BiblicalHebrew.dagesh(BiblicalHebrew.patah(ayin))), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.hiriq("ת")), "י")   
        
    elseif form == "3pc" || form == "3pm" || form == "3pf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.sheva(BiblicalHebrew.dagesh(ayin)), lamed, BiblicalHebrew.mappiq("ו"))       
    elseif form == "2pm"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.patah(BiblicalHebrew.dagesh(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.seghol("ת")), "ם")
    elseif form == "2pf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.patah(BiblicalHebrew.dagesh(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.seghol("ת")), "ן")
    elseif form == "1pc" || form == "1pm" || form == "1pf"
        string(BiblicalHebrew.hiriq("ה"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.ole(BiblicalHebrew.patah(BiblicalHebrew.dagesh(ayin))), BiblicalHebrew.sheva(lamed), "נ", BiblicalHebrew.mappiq("ו"))
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
    
end


"""Compose a string for the given person, number, gender form of 
the given sound verb in the imperative of the *hithpael* pattern.
$(SIGNATURES)
"""
function hithpael_imperfect_sound(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    pe = consonants[1]
    ayin = consonants[2]
    lamed = consonants[3]
    form = pngSummary(verb)
    
    if form == "3sm"
        string(BiblicalHebrew.hiriq("י"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.tsere(BiblicalHebrew.dagesh(ayin)), "י", lamed)
    elseif form == "3sf"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.hiriq("ת")), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.tsere(BiblicalHebrew.dagesh(ayin)), "י", lamed)

    elseif form == "2sm"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.hiriq("ת")), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.tsere(BiblicalHebrew.dagesh(ayin)), "י", lamed)

    elseif form == "2sf"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.hiriq("ת")), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.sheva(BiblicalHebrew.dagesh(ayin)),  BiblicalHebrew.hiriq(lamed),"י")
    

    elseif form == "1sc" || form == "1sm" || form == "1sf"
        string(BiblicalHebrew.seghol("א"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.tsere(BiblicalHebrew.dagesh(ayin)), "י", lamed)


    elseif form == "3pm"
        string(BiblicalHebrew.hiriq("י"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.sheva(BiblicalHebrew.dagesh(ayin)), lamed, BiblicalHebrew.mappiq("ו"))

    elseif form == "3pf"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.hiriq("ת")), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.ole(BiblicalHebrew.tsere(BiblicalHebrew.dagesh(ayin))), BiblicalHebrew.sheva(lamed), BiblicalHebrew.qamats("נ"), "ה")

    elseif form == "2pm"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.hiriq("ת")), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.sheva(BiblicalHebrew.dagesh(ayin)), lamed, BiblicalHebrew.mappiq("ו"))

    elseif form == "2pf"
        string(BiblicalHebrew.dagesh(BiblicalHebrew.hiriq("ת")), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.ole(BiblicalHebrew.tsere(BiblicalHebrew.dagesh(ayin))), BiblicalHebrew.sheva(lamed), BiblicalHebrew.qamats("נ"), "ה")


    elseif form == "1pc" || form == "1pm" || form == "1pc"
        string(BiblicalHebrew.hiriq("נ"), BiblicalHebrew.sheva("ת"), BiblicalHebrew.patah(pe), BiblicalHebrew.sheva(BiblicalHebrew.dagesh(ayin)), lamed)

    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
    
end

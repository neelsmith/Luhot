"""Compose a string for the given person, number, gender form of 
the given verb in the cohortative-jussive of the *qal* pattern.
$(SIGNATURES)
"""
function qal_jussive(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
    qal_jussive_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end

"""Compose a string for the given person, number, gender form of 
the given sound verb in the cohortative-jussive of the *qal* pattern.
$(SIGNATURES)
"""
function qal_jussive_sound(root::String,verb::HebrewFiniteVerb)
    #consonants = collect(BiblicalHebrew.unpointed(root))
    #pe = consonants[1]
    #ayin = consonants[2]
    #lamed = consonants[3]
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
the given verb in the imperative of the *qal* pattern.
$(SIGNATURES)
"""
function qal_imperative(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
    qal_imperative_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end

"""Generate requested person+number+gender of the *qal* imperative for the given sound verb."""
function qal_imperative_sound(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    pe = consonants[1]
    ayin = consonants[2]
    lamed = consonants[3]
    form = pngSummary(verb)
    if form == "2sm"
        string(BiblicalHebrew.sheva(pe), BiblicalHebrew.holam(ayin), lamed)
    elseif form == "2sf"
        string(BiblicalHebrew.hiriq(pe), BiblicalHebrew.sheva(ayin), BiblicalHebrew.hiriq(lamed),"י" )
    elseif form == "2pm"
        string(BiblicalHebrew.hiriq(pe), BiblicalHebrew.sheva(ayin), lamed, BiblicalHebrew.mappiq("ו"))
    elseif form == "2pf"
        string(BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.holam(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.qamats("נ"), "ה")
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
end

"""Compose a string for the given person, number, gender form of 
the given verb in the  perfect tense of the *qal* pattern.
$(SIGNATURES)
"""
function qal_perfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
        qal_perfect_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end

"""Generate requested person+number+gender of the perfect for the given sound verb."""
function qal_perfect_sound(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    form = pngSummary(verb)
    # initial = check if consonants[1] is in the begadkefat and
    # if so add daghesh
    #
    # for consonants 2-3, check depending on person-number for need of dagesh

    if form == "3sm"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.patah(consonants[2]), consonants[3])

    elseif form == "3sf"
        string(BiblicalHebrew.qamats(consonants[1]) |> BiblicalHebrew.metheg, BiblicalHebrew.sheva(consonants[2]), BiblicalHebrew.qamats(consonants[3]), BiblicalHebrew.he_ch)

    elseif form == "2sm"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.patah(BiblicalHebrew.ole(consonants[2])), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.dagesh("ת") |> BiblicalHebrew.qamats)

    elseif form == "2sf"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.patah(consonants[2]), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.dagesh("ת") |> BiblicalHebrew.sheva)
    

    elseif form == "1sc" || form == "1sm" || form == "1sf"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.patah(BiblicalHebrew.ole(consonants[2])), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.mappiq("נו"))


    elseif form == "3pc"  || form == "3pm" || form == "3pf"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.sheva(consonants[2]), consonants[3], BiblicalHebrew.mappiq("נו"))


    elseif form == "2pm"
        string(BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.patah(consonants[2]), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.seghol(BiblicalHebrew.dagesh("ת")), "מ")

    elseif form == "2pf"
        string(BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.patah(consonants[2]), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.seghol(BiblicalHebrew.dagesh("ת")), "ן")


    elseif form == "1pc"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.ole(BiblicalHebrew.patah(consonants[2])), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.mappiq("נו"))


    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
    
end



"""Generate requested person+number+gender of the imperfect for the given sound verb."""
function qal_imperfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
        qal_imperfect_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end


"""Generate requested person+number+gender of the perfect for the given sound verb."""
function qal_imperfect_sound(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    pe = consonants[1]
    ayin = consonants[2]
    lamed = consonants[3]

    form = pngSummary(verb)
    if form == "3sm"
        string(BiblicalHebrew.hiriq("י"), BiblicalHebrew.sheva(pe), BiblicalHebrew.holam(ayin),lamed)

    elseif form == "3sf"
        string(BiblicalHebrew.hiriq(BiblicalHebrew.dagesh("ת")), BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.holam(consonants[2]), consonants[3])

    elseif form == "2sm"
        string(BiblicalHebrew.hiriq(BiblicalHebrew.dagesh("ת")), BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.holam(consonants[2]), consonants[3])

    elseif form == "2sf"
        string(BiblicalHebrew.hiriq(BiblicalHebrew.dagesh("ת")), BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.sheva(consonants[2]), BiblicalHebrew.hiriq(consonants[3]), "י")

    elseif form == "1sc" || form == "1sm" || form == "1sf"
        string(BiblicalHebrew.seghol("א"), BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.holam(consonants[2]), consonants[3])

    elseif form ==  "3pm" 
        string(BiblicalHebrew.hiriq(BiblicalHebrew.dagesh("י")), BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.sheva(consonants[2]), consonants[3], BiblicalHebrew.mappiq("ו"))

    elseif form ==  "3pf" 
        string(BiblicalHebrew.hiriq(BiblicalHebrew.dagesh("ת")), BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.sheva(consonants[2]), BiblicalHebrew.hiriq(consonants[3]), "י")


    elseif form == "2pm"
        #string(BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.patah(consonants[2]), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.seghol(BiblicalHebrew.dagesh("ת")), "מ")
        string(BiblicalHebrew.hiriq(BiblicalHebrew.dagesh("ת")), BiblicalHebrew.sheva(pe), 
        BiblicalHebrew.sheva(ayin),lamed,  BiblicalHebrew.mappiq("ו")) 


    elseif form == "2pf"

        string(BiblicalHebrew.hiriq(BiblicalHebrew.dagesh("ת")), BiblicalHebrew.sheva(pe), 
        BiblicalHebrew.ole(BiblicalHebrew.holam(ayin)), lamed,  BiblicalHebrew.qamats("נ"), "ה")

    elseif form == "1pc" || form == "1pm" || form == "1pf"
        string(BiblicalHebrew.hiriq("נ"), BiblicalHebrew.sheva(pe), BiblicalHebrew.holam(ayin), lamed)

    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
    
end
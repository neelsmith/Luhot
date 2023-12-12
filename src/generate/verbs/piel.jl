"""Compose a string for the given person, number, gender form of 
the given verb in the imperative of the *piel* pattern.
$(SIGNATURES)
"""
function piel_imperative(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :strong
    piel_imperative_strong(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end

"""Generate requested person+number+gender of the *piel* imperative for the given strong verb.
$(SIGNATURES)
"""
function piel_imperative_strong(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    pe = consonants[1]
    ayin = consonants[2]
    lamed = consonants[3]
    form = pngSummary(verb)
    if form == "2sm"
       "Hmm"
    elseif form == "2sf"
        "Hmm"
    elseif form == "2pm"
        "Hmm"
    elseif form == "2pf"
        "Hmm"
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
end


"""Generate requested person+number+gender of the *piel* perfect for the given verb.
$(SIGNATURES)
"""
function piel_perfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :strong
        piel_perfect_strong(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end

"""Generate requested person+number+gender of the perfect for the given strong verb.
$(SIGNATURES)
"""
function piel_perfect_strong(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    pe = consonants[1]
    ayin = consonants[2]
    lamed = consonants[3]
    form = pngSummary(verb)
    # initial = check if pe is in the begadkefat and
    # if so add daghesh
    #
    # for consonants 2-3, check depending on person-number for need of dagesh

    if form == "3sm"
        string(BiblicalHebrew.hiriq(pe), BiblicalHebrew.tsere(BiblicalHebrew.dagesh(ayin)), lamed)
    elseif form == "3sf"
        string(BiblicalHebrew.hiriq(pe), BiblicalHebrew.dagesh(BiblicalHebrew.sheva(ayin)), BiblicalHebrew.qamats(lamed), "ה")
    elseif form == "2sm"
        string(BiblicalHebrew.hiriq(pe), BiblicalHebrew.ole(BiblicalHebrew.dagesh(BiblicalHebrew.patah(ayin))), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.qamats("ת")))
    elseif form == "2sf"
        string(BiblicalHebrew.hiriq(pe), BiblicalHebrew.ole(BiblicalHebrew.dagesh(BiblicalHebrew.patah(ayin))), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.sheva("ת")))        
    elseif form == "1sc" || form == "1sm" || form == "1sf"
        string(BiblicalHebrew.hiriq(pe), BiblicalHebrew.ole(BiblicalHebrew.dagesh(BiblicalHebrew.patah(ayin))), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.hiriq("ת")), "י")     
       
        
    elseif form == "3pc" || form == "3pm" || form == "3pf"
        string(BiblicalHebrew.hiriq(pe), BiblicalHebrew.dagesh(BiblicalHebrew.sheva(ayin)), lamed, BiblicalHebrew.mappiq("ו"))
    elseif form == "2pm"
        string(BiblicalHebrew.hiriq(pe), BiblicalHebrew.dagesh(BiblicalHebrew.patah(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.mappiq(BiblicalHebrew.seghol("ת")), "ם")
    elseif form == "2pf"
        string(BiblicalHebrew.hiriq(pe), BiblicalHebrew.dagesh(BiblicalHebrew.patah(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.mappiq(BiblicalHebrew.seghol("ת")), "ן")
    elseif form == "1pc" || form == "1pm" || form == "1pf"
        string(BiblicalHebrew.hiriq(pe), BiblicalHebrew.ole(BiblicalHebrew.dagesh(BiblicalHebrew.patah(ayin))), BiblicalHebrew.sheva(lamed), "נ", BiblicalHebrew.mappiq("ו"))
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
    
end




function piel_imperfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :strong
        piel_imperfect_strong(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end


"""Generate requested person+number+gender of the perfect for the given strong verb."""
function piel_imperfect_strong(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    form = pngSummary(verb)
    
    if form == "3sm"
        #string(BiblicalHebrew.hiriq("י"), BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.holam(consonants[2]), consonants[3])

        string(BiblicalHebrew.sheva("י"), BiblicalHebrew.patah(consonants[1]), 
        BiblicalHebrew.tsere(BiblicalHebrew.dagesh(consonants[2])), consonants[3])
        
        #=
    elseif form == "3sf"
        string(BiblicalHebrew.qamats(consonants[1]) |> BiblicalHebrew.metheg, BiblicalHebrew.sheva(consonants[2]), BiblicalHebrew.qamats(consonants[3]), BiblicalHebrew.he_ch)

    elseif form == "2sm"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.patah(BiblicalHebrew.ole(consonants[2])), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.dagesh("ת") |> BiblicalHebrew.qamats)

    elseif form == "2sf"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.patah(consonants[2]), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.dagesh("ת") |> BiblicalHebrew.sheva)
    

    elseif form == "1sc" || form == "1sm" || form == "1sf"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.patah(BiblicalHebrew.ole(consonants[2])), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.mappiq("נו"))


    elseif form == "3pc"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.sheva(consonants[2]), consonants[3], BiblicalHebrew.mappiq("נו"))


    elseif form == "2pm"
        string(BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.patah(consonants[2]), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.seghol(BiblicalHebrew.dagesh("ת")), "מ")

    elseif form == "2pf"
        string(BiblicalHebrew.sheva(consonants[1]), BiblicalHebrew.patah(consonants[2]), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.seghol(BiblicalHebrew.dagesh("ת")), "ן")


    elseif form == "1pc"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.ole(BiblicalHebrew.patah(consonants[2])), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.mappiq("נו"))

=#
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
    
end
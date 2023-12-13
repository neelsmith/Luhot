

function hophal_perfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :strong
        hophal_perfect_strong(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end

"""Generate requested person+number+gender of the perfect for the given strong verb.
$(SIGNATURES)
"""
function hophal_perfect_strong(root::String,verb::HebrewFiniteVerb)
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
        string(BiblicalHebrew.qamats("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.patah(ayin), lamed)
    elseif form == "3sf"
        string(BiblicalHebrew.qamats("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.sheva(ayin), BiblicalHebrew.qamats(lamed), "ה")
    elseif form == "2sm"
        string(BiblicalHebrew.qamats("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.patah(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.qamats("ת")))
    elseif form == "2sf"
        string(BiblicalHebrew.qamats("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.patah(ayin), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.sheva("ת")))       
    elseif form == "1sc" || form == "1sm" || form == "1sf"
        string(BiblicalHebrew.qamats("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.patah(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.hiriq("ת")), "י")   
       
        
    elseif form == "3pc" || form == "3pm" || form == "3pf"
        string(BiblicalHebrew.qamats("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.sheva(ayin), lamed, BiblicalHebrew.mappiq("ו"))  
    elseif form == "2pm"
        string(BiblicalHebrew.qamats("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.sheva(ayin), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.seghol("ת")), "ם")    
    elseif form == "2pf"
        string(BiblicalHebrew.qamats("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.sheva(ayin), BiblicalHebrew.sheva(lamed), BiblicalHebrew.dagesh(BiblicalHebrew.seghol("ת")), "ן")   
    elseif form == "1pc" || form == "1pm" || form == "1pf"
        string(BiblicalHebrew.qamats("ה"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.patah(ayin)), BiblicalHebrew.sheva(lamed), "נ", BiblicalHebrew.mappiq("ו"))  
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
    
end



"""Generate requested person+number+gender of the *hophal* form of the imperfect for the given verb.
$(SIGNATURES)
"""
function hophal_imperfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :strong
        hophal_imperfect_strong(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end


"""Generate requested person+number+gender of the *hophal* form of the imperfect for the given strong verb.
$(SIGNATURES)
"""
function hophal_imperfect_strong(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    pe = consonants[1]
    ayin = consonants[2]
    lamed = consonants[3]
    form = pngSummary(verb)
    
    if form == "3sm"       
        string(BiblicalHebrew.qamats( "י"), BiblicalHebrew.sheva(pe), BiblicalHebrew.patah(ayin), lamed)
    elseif form == "3sf"
        string(BiblicalHebrew.qamats("ת"), BiblicalHebrew.sheva(pe), BiblicalHebrew.patah(ayin), lamed)
    elseif form == "2sm"
        string(BiblicalHebrew.qamats("ת"), BiblicalHebrew.sheva(pe), BiblicalHebrew.patah(ayin), lamed)
    elseif form == "2sf"
        string(BiblicalHebrew.qamats("ת"), BiblicalHebrew.sheva(pe), BiblicalHebrew.sheva(ayin), BiblicalHebrew.hiriq(lamed), "י")
    elseif form == "1sc" || form == "1sm" || form == "1sf"
        string(BiblicalHebrew.qamats("א"), BiblicalHebrew.sheva(pe), BiblicalHebrew.patah(ayin), lamed)    
       
        
    elseif form == "3pm"
        string(BiblicalHebrew.qamats( "י"), BiblicalHebrew.sheva(pe), BiblicalHebrew.sheva(ayin), lamed, BiblicalHebrew.mappiq("ו"))     
    elseif form == "3pf"        
        string(BiblicalHebrew.qamats("ת"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.patah(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.qamats("נ"),"ה" )
    elseif form == "2pm"
        string(BiblicalHebrew.qamats("ת"), BiblicalHebrew.sheva(pe), BiblicalHebrew.sheva(ayin), lamed, BiblicalHebrew.mappiq("ו"))
    elseif form == "2pf"
        string(BiblicalHebrew.qamats("ת"), BiblicalHebrew.sheva(pe), BiblicalHebrew.ole(BiblicalHebrew.patah(ayin)), BiblicalHebrew.sheva(lamed), BiblicalHebrew.qamats("נ"),"ה" )  
    elseif form == "1pc" || form == "1pm" || form == "1pf"
        string(BiblicalHebrew.qamats("נ"), BiblicalHebrew.sheva(pe), BiblicalHebrew.patah(ayin), lamed)
        
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
    
end
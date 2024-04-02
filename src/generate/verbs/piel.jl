"""Compose a string for the given person, number, gender form of 
the given verb in the cohortative-jussive of the *piel* pattern.
$(SIGNATURES)
"""
function piel_jussive(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
    qal_jussive_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end



"""Compose a string for the given person, number, gender form of 
the given verb in the imperative of the *piel* pattern.
$(SIGNATURES)
"""
function piel_imperative(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
    piel_imperative_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end



"""Generate requested person+number+gender of the *piel* perfect for the given verb.
$(SIGNATURES)
"""
function piel_perfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
        piel_perfect_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end

"""Generate requested person+number+gender of the imperfect for the given verb.
$(SIGNATURES)
"""
function piel_imperfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
        piel_imperfect_sound(root, form)
    #elseif verbclass ==
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end

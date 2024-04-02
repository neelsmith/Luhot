"""Compose a string for the given person, number, gender form of 
the given verb in the cohortative-jussive of the *niphal* pattern.
$(SIGNATURES)
"""
function niphal_jussive(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
    qal_jussive_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end




"""Compose a string for the requested person, number, gender form of 
the given verb in the imperative of the *niphal* pattern.
$(SIGNATURES)
"""
function niphal_imperative(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
    niphal_imperative_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end


"""Compose a string for the requested person, number, gender form of 
the given verb in the perfect tense of the *niphal* pattern.
$(SIGNATURES)
"""
function niphal_perfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
        niphal_perfect_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end




"""Compose a string for the requested person, number, gender form of 
the given verb in the imperfect tense of the *niphal* pattern.
$(SIGNATURES)
"""
function niphal_imperfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
        niphal_imperfect_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end

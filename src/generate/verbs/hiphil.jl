"""Compose a string for the given person, number, gender form of 
the given verb in the cohortative-jussive of the *hiphil* pattern.
$(SIGNATURES)
"""
function hiphil_jussive(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
    qal_jussive_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end



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

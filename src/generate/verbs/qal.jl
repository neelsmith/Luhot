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


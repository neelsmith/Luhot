"""Compose a string for the given person, number, gender form of 
the given verb in the cohortative-jussive of the *hithpael* pattern.
$(SIGNATURES)
"""
function hithpael_jussive(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
    qal_jussive_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end



"""Compose a string for the given person, number, gender form of 
the given verb in the imperative of the *hithpael* pattern.
$(SIGNATURES)
"""
function hithpael_imperative(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
    hithpael_imperative_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end
end


"""Compose a string for the given person, number, gender form of 
the given verb in the perfect of the *hithpael* pattern.
$(SIGNATURES)
"""
function hithpael_perfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
        hithpael_perfect_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end




"""Compose a string for the given person, number, gender form of 
the given verb in the imperfect of the *hithpael* pattern.
$(SIGNATURES)
"""
function hithpael_imperfect(root::String,form::HebrewFiniteVerb)
    #verbclass = rootclass(root)    

    #if verbclass == :sound
        hithpael_imperfect_sound(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end

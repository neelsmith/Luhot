"""Determine root class of a verb.
$(SIGNATURES)
"""
function rootclass(verb)::Symbol
        consonants = collect(BiblicalHebrew.unpointed(verb))
        if length(consonants) != 3
                @warn("Analysis only available for roots with 3 consonants")
                nothing
        #elseif BiblicalHebrew.isguttural(consonants[1])
        #        :pe_guttural
        elseif consonants[3] == 'א'
                :lamedh_aleph

        # handle others here....
        # pe-nun
        # ayin-guttural
        # lamed-guttural
        # lamed-aleph
        # pe-waw and pe-yod
        # ayin-waw and ayin-yod
        # lamed-he
        # double ayin
        # various doubly weak combos

        else
                :sound
        end

        # pe-guttural
end

"""Generate the correct string for a given stem and finite verb form.
$(SIGNATURES)
"""
function generate(stem::VerbStem, verb::HebrewFiniteVerb)::Union{String, Nothing}
        generate(root(stem), verb)
end

"""Generate the correct string for a given stem and finite verb form.
$(SIGNATURES)
"""
function generate(root::S, verb::HebrewFiniteVerb)::Union{String,Nothing} where S <: AbstractString
  
        if label(hmpPattern(verb)) == "qal" && label(hmpTense(verb)) == "perfect"
                qal_perfect(root, verb)
        elseif label(hmpPattern(verb)) == "qal" && label(hmpTense(verb)) == "imperfect"
                qal_imperfect(root, verb)
        elseif label(hmpPattern(verb)) == "qal" && label(hmpTense(verb)) == "imperative"
                qal_imperative(root, verb)
        elseif label(hmpPattern(verb)) == "qal" && label(hmpTense(verb)) == "cohortative-jussive"
                qal_jussive(root, verb)

        elseif label(hmpPattern(verb)) == "niphal" && label(hmpTense(verb)) == "perfect"
                niphal_perfect(root, verb)
        elseif label(hmpPattern(verb)) == "niphal" && label(hmpTense(verb)) == "imperfect"
                niphal_imperfect(root, verb)   
        elseif label(hmpPattern(verb)) == "niphal" && label(hmpTense(verb)) == "imperative"
                niphal_imperative(root, verb) 
        elseif label(hmpPattern(verb)) == "niphal" && label(hmpTense(verb)) == "cohortative-jussive"
                niphal_jussive(root, verb)                           
            
        elseif label(hmpPattern(verb)) == "piel" && label(hmpTense(verb)) == "perfect"
                piel_perfect(root, verb)
        elseif label(hmpPattern(verb)) == "piel" && label(hmpTense(verb)) == "imperfect"
                piel_imperfect(root, verb)            
        elseif label(hmpPattern(verb)) == "piel" && label(hmpTense(verb)) == "imperative"
                piel_imperative(root, verb)                  
        elseif label(hmpPattern(verb)) == "piel" && label(hmpTense(verb)) == "cohortative-jussive"
                piel_jussive(root, verb)                           
            


        elseif label(hmpPattern(verb)) == "pual" && label(hmpTense(verb)) == "perfect"
                pual_perfect(root, verb)
        elseif label(hmpPattern(verb)) == "pual" && label(hmpTense(verb)) == "imperfect"
                pual_imperfect(root, verb) 
        elseif label(hmpPattern(verb)) == "pual" && label(hmpTense(verb)) == "cohortative-jussive"
                pual_jussive(root, verb)    


        elseif label(hmpPattern(verb)) == "hiphil" && label(hmpTense(verb)) == "perfect"
                hiphil_perfect(root, verb)
        elseif label(hmpPattern(verb)) == "hiphil" && label(hmpTense(verb)) == "imperfect"
                hiphil_imperfect(root, verb)             
        elseif label(hmpPattern(verb)) == "hiphil" && label(hmpTense(verb)) == "imperative"
                hiphil_imperative(root, verb) 
        elseif label(hmpPattern(verb)) == "hiphil" && label(hmpTense(verb)) == "cohortative-jussive"
                hiphil_jussive(root, verb)             

        elseif label(hmpPattern(verb)) == "hophal" && label(hmpTense(verb)) == "perfect"
                hophal_perfect(root, verb)
        elseif label(hmpPattern(verb)) == "hophal" && label(hmpTense(verb)) == "imperfect"
                hophal_imperfect(root, verb)  
        elseif label(hmpPattern(verb)) == "hophal" && label(hmpTense(verb)) == "cohortative-jussive"
                hophal_jussive(root, verb)                     

        elseif label(hmpPattern(verb)) == "hithpael" && label(hmpTense(verb)) == "perfect"
                hithpael_perfect(root, verb)
        elseif label(hmpPattern(verb)) == "hithpael" && label(hmpTense(verb)) == "imperfect"
                hithpael_imperfect(root, verb)     
        elseif label(hmpPattern(verb)) == "hithpael" && label(hmpTense(verb)) == "imperative"
                hithpael_imperative(root, verb) 
        elseif label(hmpPattern(verb)) == "hithpael" && label(hmpTense(verb)) == "cohortative-jussive"
                hithpael_jussive(root, verb)                         

    else
        @warn("")
        #@warn("$(verbhead) + $(tense) not recognized or not yet implemented")
        ""
    end
end


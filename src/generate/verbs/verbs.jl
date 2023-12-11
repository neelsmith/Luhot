"""Determine root class of a verb.
$(SIGNATURES)
"""
function rootclass(verb)::Symbol
        consonants = collect(BiblicalHebrew.unpointed(verb))
        if length(consonants) != 3
                @warn("Analysis only available for roots with 3 consonants")
                nothing
        elseif BiblicalHebrew.isguttural(consonants[1])
                :pe_guttural

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
                :strong
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

    elseif label(hmpPattern(verb)) == "niphal" && label(hmpTense(verb)) == "perfect"
            niphal_perfect(root, verb)

    elseif label(hmpPattern(verb)) == "niphal" && label(hmpTense(verb)) == "imperfect"
            niphal_imperfect(root, verb)   
            
    elseif label(hmpPattern(verb)) == "piel" && label(hmpTense(verb)) == "perfect"
            piel_perfect(root, verb)

    elseif label(hmpPattern(verb)) == "piel" && label(hmpTense(verb)) == "imperfect"
            piel_imperfect(root, verb)            

    elseif label(hmpPattern(verb)) == "pual" && label(hmpTense(verb)) == "perfect"
            pual_perfect(root, verb)

    elseif label(hmpPattern(verb)) == "pual" && label(hmpTense(verb)) == "imperfect"
            pual_imperfect(root, verb) 


    elseif label(hmpPattern(verb)) == "hiphil" && label(hmpTense(verb)) == "perfect"
            hiphil_perfect(root, verb)

    elseif label(hmpPattern(verb)) == "hiphil" && label(hmpTense(verb)) == "imperfect"
            hiphil_imperfect(root, verb)             

    elseif label(hmpPattern(verb)) == "hophal" && label(hmpTense(verb)) == "perfect"
            hophal_perfect(root, verb)

    elseif label(hmpPattern(verb)) == "hophal" && label(hmpTense(verb)) == "imperfect"
            hophal_imperfect(root, verb)     

    elseif label(hmpPattern(verb)) == "hithpael" && label(hmpTense(verb)) == "perfect"
            hithpael_perfect(root, verb)

    elseif label(hmpPattern(verb)) == "hithpael" && label(hmpTense(verb)) == "imperfect"
            hithpael_imperfect(root, verb)     

# add imperatives for qal, niphal, piel, hiphil, hithpael
    else
        @warn("")
        #@warn("$(verbhead) + $(tense) not recognized or not yet implemented")
        ""
    end
end


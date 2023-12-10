
"""Generate the correct string for a given stem and finite verb form.
$(SIGNATURES)
"""
function generate(stem::VerbStem, verb::HebrewFiniteVerb)::String
    triliteral = root(stem)
    if label(hmpPattern(verb)) == "qal" && label(hmpTense(verb)) == "perfect"
        qal_perfect(triliteral, verb)

    elseif label(hmpPattern(verb)) == "qal" && label(hmpTense(verb)) == "imperfect"
        qal_imperfect(triliteral, verb)


    else
        @warn("")
        #@warn("$(verbhead) + $(tense) not recognized or not yet implemented")
        ""
    end
end


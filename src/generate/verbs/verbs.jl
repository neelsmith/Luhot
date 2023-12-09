
"""Generate the correct string for a given stem and finite verb form.
$(SIGNATURES)
"""
function generate(stem::VerbStem, verb::HebrewFiniteVerb)::String
    triliteral = root(stem)
    if label(hmpPattern(verb)) == "qal" && label(hmpTense(verb)) == "perfect"
        qal_perfect(triliteral, verb)
    else
        @warn("$(verbhead) + $(tense) not recognized or not yet implemented")
        ""
    end
end


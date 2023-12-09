
"""Generate the correct string for a given stem and finite verb form.
$(SIGNATURES)
"""
function generate(stem::VerbStem, finiteverb::HebrewFiniteVerb)
    triliteral = root(stem)
    if verbhead == :qal && tense == :perfect
        qal_perfect(triliteral, form)
    else
        @warn("$(verbhead) + $(tense) not recognized or not yet implemented")
        nothing
    end
end

#=
function verb(triliteral, verbhead, tense, form)
    if verbhead == :qal && tense == :perfect
        qal_perfect(triliteral, form)
    else
        @warn("$(verbhead) + $(tense) not recognized or not yet implemented")
        nothing
    end
end
=#
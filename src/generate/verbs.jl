
function verb(triliteral, verbhead, tense, form)
    if verbhead == :qal && tense == :perfect
        qal_perfect(triliteral, form)
    else
        @warn("$(verbhead) + $(tense) not recognized or not yet implemented")
        nothing
    end
end
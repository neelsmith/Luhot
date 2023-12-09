#=
"""Generate a form for a given lexeme and form within a given dataset.
$(SIGNATURES)
"""
function generate(
    lex::LexemeUrn, 
    form::FormUrn, 
    kds::Luhot.FilesDataset) 
    @debug("generate(lex,form,kds): generating $(form) for $(lex)...")
    generate(lex, form, rulesarray(kds), stemsarray(kds))
end
=#

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
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

function qal_perfect(root::String,form::HebrewFiniteVerb)
    verbclass = rootclass(root)    

    #if verbclass == :strong
        qal_perfect_strong(root, form)
    #else
    #    @warn("Verb class $(verbclass) not yet implemented")
    #    nothing
    #end

end

# Woo hoo, singular complete!

"""Generate requested person+number+gender of the perfect for the given strong verb."""
function qal_perfect_strong(root::String,verb::HebrewFiniteVerb)
    consonants = collect(BiblicalHebrew.unpointed(root))
    form = pngSummary(verb)
    
    if form == "3sm"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.patah(consonants[2]), consonants[3])

    elseif form == "3sf"
        string(BiblicalHebrew.qamats(consonants[1]) |> BiblicalHebrew.metheg, BiblicalHebrew.sheva(consonants[2]), BiblicalHebrew.qamats(consonants[3]), he_ch)

    elseif form == "2sm"
        string(qamats(consonants[1]), BiblicalHebrew.patah(BiblicalHebrew.ole(consonants[2])), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.dagesh("ת") |> BiblicalHebrew.qamats)

    elseif form == "2sf"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.patah(consonants[2]), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.dagesh("ת") |> BiblicalHebrew.sheva)


    elseif form == "1sc"
        string(BiblicalHebrew.qamats(consonants[1]), BiblicalHebrew.patah(BiblicalHebrew.ole(consonants[2])), BiblicalHebrew.sheva(consonants[3]), BiblicalHebrew.mappiq("נו"))
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
    
end
function rootclass(verb)
    consonants = collect(unpointed(verb))
    if length(consonants) != 3
        @warn("Analysis only available for roots with 3 consonants")
        nothing
    elseif isguttural(consonants[1])
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

function qal_perfect(root,form)
    verbclass = rootclass(root)    

    if verbclass == :strong
        qal_perfect_strong(root, form)
    else
        @warn("Verb class $(verbclass) not yet implemented")
        nothing
    end

end

# Woo hoo, singular complete!

"""Generate requested person+number+gender of the perfect for the given strong verb."""
function qal_perfect_strong(root, form)
    consonants = collect(unpointed(root))

    if form == "3sm"
        string(qamats(consonants[1]), patah(consonants[2]), consonants[3])

    elseif form == "3sf"
        string(qamats(consonants[1]) |> metheg, sheva(consonants[2]), qamats(consonants[3]), he_ch)

    elseif form == "2sm"
        string(qamats(consonants[1]), patah(ole(consonants[2])), sheva(consonants[3]), dagesh("ת") |> qamats)

    elseif form == "2sf"
        string(qamats(consonants[1]), patah(consonants[2]), sheva(consonants[3]), dagesh("ת") |> sheva)


    elseif form == "1sc"
        string(qamats(consonants[1]), patah(ole(consonants[2])), sheva(consonants[3]), mappiq("נו"))
    else
        @warn("Form $(form) not recognized or not yet implemented.")
    end
end
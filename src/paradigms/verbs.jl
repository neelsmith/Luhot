"""Sequence of person, number, gender combinations to use in
paradigms of perfect tense."""
const PERFECT_PNG_SEQUENCE = [
    (person = "third", number = "singular", gender = "masculine"),
    (person = "third", number = "singular", gender = "feminine"),
    (person = "second", number = "singular", gender = "masculine"),
    (person = "second", number = "singular", gender = "feminine"),
    (person = "first", number = "singular", gender = "common"),

    (person = "third", number = "plural", gender = "common"),
    (person = "second", number = "plural", gender = "masculine"),
    (person = "second", number = "plural", gender = "feminine"),
    (person = "first", number = "plural", gender = "common")
]

"""Compose named triples of person, number, gender in
sequence used for paradigms of perfect tense.
$(SIGNATURES)
"""
function perfect_png()
    map(PERFECT_PNG_SEQUENCE) do triple
        (person = hmpPerson(triple.person),
        number = hmpNumber(triple.number),
        gender = hmpGender(triple.gender)
        )
    end
end

"""Sequence of person, number, gender combinations to use in
paradigms of imperfect tense."""
const IMPERFECT_PNG_SEQUENCE = [
    (person = "third", number = "singular", gender = "masculine"),
    (person = "third", number = "singular", gender = "feminine"),
    (person = "second", number = "singular", gender = "masculine"),
    (person = "second", number = "singular", gender = "feminine"),
    (person = "first", number = "singular", gender = "common"),

    (person = "third", number = "plural", gender = "masculine"),
    (person = "third", number = "plural", gender = "feminine"),
    (person = "second", number = "plural", gender = "masculine"),
    (person = "second", number = "plural", gender = "feminine"),
    (person = "first", number = "plural", gender = "common")
]

"""Compose named triples of person, number, gender in
sequence used for paradigms of imperfect tense.
$(SIGNATURES)    
"""
function imperfect_png()
    map(IMPERFECT_PNG_SEQUENCE) do triple
        (person = hmpPerson(triple.person),
        number = hmpNumber(triple.number),
        gender = hmpGender(triple.gender)
        )
    end
end


"""Sequence of person, number, gender combinations to use in
paradigms of perfect tense."""
const IMPERATIVE_PNG_SEQUENCE = [
    (person = "second", number = "singular", gender = "masculine"),
    (person = "second", number = "singular", gender = "feminine"),
  
    (person = "second", number = "plural", gender = "masculine"),
    (person = "second", number = "plural", gender = "feminine")
]

"""Compose named triples of person, number, gender in
sequence used for paradigms of imperative tense.
$(SIGNATURES)    
"""
function imperative_png()
    map(IMPERATIVE_PNG_SEQUENCE) do triple
        (person = hmpPerson(triple.person),
        number = hmpNumber(triple.number),
        gender = hmpGender(triple.gender)
        )
    end
end

"""Compose named triples of person, number, gender in
sequence used for paradigms of a given tense.
$(SIGNATURES)
"""
function paradigm_png(tns::HMPTense)
    if label(tns) == "perfect"
        perfect_png()
    elseif label(tns) == "imperfect"
        imperfect_png()
    elseif label(tns) == "imperative"
        imperative_png()
    else
        @warn("Unrecognized or unimplemented tense $(tns)")
        []
    end
end

"""Compose string for triple values.
$(SIGNATURES)
"""
function triplelabel(triple)
    string(triple.person, " ", triple.number, " ", triple.gender)
end

"""Compose a list of person, number, gender labels for paradigms of perfect tense.
$(SIGNATURES)
"""
function perfect_png_labels()
    PERFECT_PNG_SEQUENCE .|> triplelabel
end


"""Compose a list of person, number, gender labels for paradigms of imperfect tense.
$(SIGNATURES)
"""
function imperfect_png_labels()
    IMPERFECT_PNG_SEQUENCE .|> triplelabel
end

"""Compose a list of person, number, gender labels for paradigms of the imperative tense.
$(SIGNATURES)
"""
function impererative_png_labels()
    IMPERATIVE_PNG_SEQUENCE .|> triplelabel
end

"""Compose a list of person, number, gender labels for paradigms of a given tense.
$(SIGNATURES)
"""
function png_labels(tns::HMPTense)
    if label(tns) == "perfect"
        perfect_png_labels()
    elseif label(tns) == "imperfect"
        imperfect_png_labels()
    elseif label(tns) == "imperative"
        impererative_png_labels()
    else
        @warn("Unrecognized or unimplemented tense $(tns)")
    end
end

"""Sequence of labels for verb patterns to use in verb paradigms."""
const PATTERN_SEQUENCE = [
    "qal", "niphal", "piel", "pual", "hiphil", "hophal", "hithpael"
]

"""Sequence of `HMPVerbPattern`s to use in verb paradigms.
$(SIGNATURES)
"""
function paradigm_patterns()
    map(ptrn -> hmpPattern(ptrn),PATTERN_SEQUENCE) 
end

"""Sequence of labels for tenses to use in verb paradigms."""
const TENSE_SEQUENCE = ["perfect", "imperfect", "imperative"]

"""Sequence of `HMPTense`s to use in verb paradigms.
$(SIGNATURES)
"""
function paradigm_tenses()
    map(t -> hmpTense(t), TENSE_SEQUENCE)
end

"""Conjugate a verb in a given pattern and tense. Returns
a list of strings.
$(SIGNATURES)
"""
function conjugate(s::T, ptrn::HMPVerbPattern, tns::HMPTense) where T <: AbstractString
    root = BiblicalHebrew.unpointed(s)
    forms = String[]
    @info("Looking at $(length(paradigm_png(tns))) triples")
    for triple in paradigm_png(tns)
        form = HebrewFiniteVerb(ptrn, tns, 
        triple.person, triple.number, triple.gender)
        generated = generate(root, form)
        isnothing(generated) ?  push!(forms, "-") : push!(forms, generated) 
    end
    map(f -> isnothing(f) ? "-" : f, forms)
end

"""Conjugate a verb in all finite forms.
Returns a dictionary keyed by verb pattern.
$(SIGNATURES)
"""
function conjugate(s::T) where T <: AbstractString
    conjugation = Dict()
    for ptrn in paradigm_patterns()
        for tns in paradigm_tenses()
            conjugation[label(ptrn)] = conjugate(s, ptrn, tns)
        end
    end
    conjugation
end


"""Compose a markdown table for conjugation of a verb in all
patterns for a given tense.
$(SIGNATURES)
"""
#function conjugation_md(s::T, tns::HMPTense)#::String where T <: AbstractString
function conjugation_md(s::T, tns::HMPTense) where T <: AbstractString
    hdr = "| | " *  join(PATTERN_SEQUENCE, " | ")
    formatter = repeat("| --- ", length(PATTERN_SEQUENCE) + 1) * " |"
    tabletop = join([hdr, formatter], "\n")


    # get data by columns, and use `hcat` to paste together
    col1 = map(lbl -> "| " * lbl,  png_labels(tns))
    cols = map(p -> conjugate(s, p, tns), paradigm_patterns()) #|> hcat
    # cols is a 2d matrix
    # 1st dim is pattern, second is png
    # create a row for eah png

    @info("Conjugating $(label(tns)) tense")
    rowlabels = png_labels(tns)
    @info("There are $(length(rowlabels)) labels for rows")
    mdrows = String[]
    for pngindex in 1:length(rowlabels)
        rowcells = String[]
        # get ith element of all tense
        for patindex in 1:length(cols)
            push!(rowcells, cols[patindex][pngindex])
        end
        push!(mdrows, "| " * rowlabels[pngindex] * " | " * join(rowcells, " | ") * " |")
    end
    
    mdtable = string(tabletop, "\n", join(mdrows, "\n"))
    
    #for i, row in enumeratemdtable

    #join(mdlines, "\n")
    #hdr
    mdtable
end
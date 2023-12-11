"""Sequence of person, number, gender combinations to use in
verb paradigms"""
const PNG_SEQUENCE = [
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
sequence used for verb paradigms."""
function paradigm_png()
    map(PNG_SEQUENCE) do triple
        (person = hmpPerson(triple.person),
        number = hmpNumber(triple.number),
        gender = hmpGender(triple.gender)
        )
    end
end

"""Compose string for triple values.
$(SIGNATURES)
"""
function triplelabel(triple)
    string(triple.person, " ", triple.number, " ", triple.gender)
end

"""Compose a list of person, number, gender labels for paradigms.
$(SIGNATURES)
"""
function png_labels()
    PNG_SEQUENCE .|> triplelabel
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
const TENSE_SEQUENCE = ["perfect", "imperfect"]

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
    for triple in paradigm_png()
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
    col1 = map(lbl -> "| " * lbl,  png_labels())
    cols = map(p -> conjugate(s, p, tns), paradigm_patterns()) #|> hcat
    # cols is a 2d matrix
    # 1st dim is pattern, second is png
    # create a row for eah png

    rowlabels = png_labels()
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
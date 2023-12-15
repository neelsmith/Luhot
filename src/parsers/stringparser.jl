"""A parser parsing tokens by looking them up in a precomputed dictionary of all recognized forms."""
struct StringParser <: LuhotParser
    entries
end

"""Write entries to file.
$(SIGNATURES)
"""
function tofile(p::StringParser, f; delimiter = nothing )
    src = "Token,Lexeme,Form,Stem,Rule\n" * join(p.entries,"\n") * "\n"
    txt = isnothing(delimiter) ? src : replace(src, "|" => delimiter)
    open(f, "w") do io
        write(f, txt)
    end
end

"""Parse a single token using `parser`.
$(SIGNATURES)
"""
function parsetoken(s::AbstractString, parser::StringParser; data = nothing)
    #strlist = resolvestring(s)
    ptrn = s * "|"
    @debug("Match pattern", ptrn)
    matches = filter(ln -> startswith(ln, ptrn), parser.entries)
    map(ln -> fromline(ln), matches)
end

"""Instantiate a `StringParser` for a dataset.
$(SIGNATURES)
"""
function stringParser(kd::Luhot.FilesDataset; delimiter = "|", interval = 50)
    analyses = []
    stems = stemsarray(kd) 
    for (i, stem) in enumerate(stems)
        if i % interval == 0
            @info("stem $(i)… $(stem)")
        end
        append!(analyses, buildparseable(stem; delimiter = delimiter))
    end
    analyses |> StringParser
end


"""Serialize a single analysis to delimited text.
$(SIGNATURES)
"""
function analysis_line(a::Analysis; delimiter = "|")
    pieces = [
        a.token,
        string(a.lexeme),
        string(a.form),
        string(a.stem),
        string(a.rule)
    ]
    join(pieces, delimiter)
end

"""Map `Analysis` objects to string values.
$(SIGNATURES)
"""
function analysis_lines(v::Vector{Analysis})
    map(a -> analysis_line(a), v)
end

"""Map all analyses in `td` to string values.
$(SIGNATURES)
"""
function analysis_lines(ds::Luhot.FilesDataset)
    analyses(ds) |> analysis_lines
end


"""Create an `Analysis` from line of delimited text.
$(SIGNATURES)
"""
function fromline(s::AbstractString; delimiter = "|")::Analysis
    pieces = split(s,delimiter)
    Analysis(
        pieces[1], 
        LexemeUrn(pieces[2]),
        FormUrn(pieces[3]),
        StemUrn(pieces[4]),
        RuleUrn(pieces[5])
    )
end


"""Generate all forms possible for `stem`.
$(SIGNATURES)
"""
function buildparseable(stem::T; delimiter = "|") where {T <: LuhotStem }
    @debug("BUILD PARSES FOR STEM", stem)
    
    generated = []  
    verbforms = finiteverbforms()
    if stem isa VerbStem
        @debug("Verb stem, so use ", verbforms)
        for morphform in verbforms
            @debug("Look at types $(typeof(stem)) and $(typeof(morphform))")
            token = generate(stem, morphform)
            if isnothing(token) || isempty(token)
                @warn("For form $(label(morphform)), got nothing")
            else
                delimited = join([token, lexeme(stem), formurn(morphform), urn(stem), RULE_URN], delimiter)
                push!(generated, delimited)
            end
        end

        
    else
        @warn("$(typeof(stem)) not supported")
    end

    generated
end






"""Find unique lexemes recognized by a `StringParser`.
$(SIGNATURES)
"""
function lexemes(sp::StringParser)
    map(sp.entries) do ln
        split(ln, "|")[2]
    end |> unique
end


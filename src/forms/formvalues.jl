# Model for Form URN values:
# PosPatTPNG...

"""Constants for analytical types ("parts of speech")"""
const UNANALYZED = 0
const UNINFLECTED = 1
const FINITEVERB = 3
const INFINITIVE = 4
const PARTICIPLE = 5
const NOUN = 6
const PRONOUN = 7
const ADJECTIVE = 6


"""Dictionary of labels for analytical types ("parts of speech").

$(SIGNATURES)
"""
const poslabels = Dict(
    UNANALYZED => "unanalyzed",
    UNINFLECTED => "uninflected",

    FINITEVERB => "verb-finite",
    INFINITIVE => "infinitive",
    PARTICIPLE => "participle",
    
    NOUN => "noun",
    PRONOUN => "pronoun",
    ADJECTIVE => "adjective"

)

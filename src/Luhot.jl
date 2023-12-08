module Luhot

using BiblicalHebrew
using Orthography



import CitableBase: CitableTrait
import CitableBase: urn
import CitableBase: label
import CitableBase: cex

using CitableBase
using CitableObject

using CitableParserBuilder
import CitableParserBuilder: formurn
import CitableParserBuilder: parsetoken
import CitableParserBuilder: parselist
import CitableParserBuilder: parsecorpus
#import CitableParserBuilder: parsedocument
import CitableParserBuilder: CanParseCitable
import CitableParserBuilder: lexeme
import CitableParserBuilder: lexemes

using Documenter, DocStringExtensions

export label

export HebrewMorphologicalProperty
export HMPVerbPattern, hmpVerbPattern
export HMPTense, hmpTense
export HMPPerson, hmpPerson
export HMPNumber, hmpNumber

export code

include("morphologicalproperties/properties.jl")
include("morphologicalproperties/verbpattern.jl")
include("morphologicalproperties/tense.jl")
include("morphologicalproperties/person.jl")

include("forms/forms.jl")
include("forms/finiteverbs.jl")


end # module Luhot

module Luhot

using BiblicalHebrew
using Orthography

using CitableBase, CitableObject

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


export HebrewMorphologicalProperty
export HMPVerbPattern, hmpVerbPattern


include("morphologicalproperties/properties.jl")
include("morphologicalproperties/verbpattern.jl")

include("forms/forms.jl")
include("forms/finiteverbs.jl")


end # module Luhot

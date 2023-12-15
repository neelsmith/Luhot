module Luhot

using Pkg

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
# Verbs:
export HMPVerbPattern, hmpPattern
export HMPTense, hmpTense
export HMPPerson, hmpPerson
export HMPNumber, hmpNumber
export HMPGender, hmpGender
# Nouns:
export HMPSubstantiveState, hmpSubstantiveState

export code

export HebrewForm
export HebrewFiniteVerb, hmfFiniteVerb

export filesDataset

export generate
export conjugate, conjugation_md

include("io.jl")

include("morphologicalproperties/properties.jl")
include("morphologicalproperties/verbpattern.jl")
include("morphologicalproperties/tense.jl")
include("morphologicalproperties/person.jl")
include("morphologicalproperties/number.jl")
include("morphologicalproperties/gender.jl")
include("morphologicalproperties/state.jl")

include("forms/formvalues.jl")
include("forms/forms.jl")
include("forms/finiteverbs.jl")

include("stems/stems.jl")
include("stems/verbstems.jl")

include("dataset/dataset.jl")
include("dataset/fileslayout.jl")
include("dataset/filesdataset.jl")

include("generate/generate.jl")
include("generate/verbs/qal.jl")
include("generate/verbs/piel.jl")
include("generate/verbs/pual.jl")
include("generate/verbs/niphal.jl")
include("generate/verbs/hiphil.jl")
include("generate/verbs/hophal.jl")
include("generate/verbs/hithpael.jl")
include("generate/verbs/verbs.jl")

include("paradigms/verbs.jl")

include("parsers/parser.jl")
include("parsers/stringparser.jl")

end # module Luhot

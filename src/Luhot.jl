module Luhot

using Pkg # ?


import Base: show
import Base: ==

using BiblicalHebrew
using Orthography


using CitableParserBuilder

import CitableParserBuilder: parsetoken #, parsewordlist,  parselistfromfile, parselistfromurl
import CitableParserBuilder: tofile
import CitableParserBuilder: datasource
import CitableParserBuilder: orthography
import CitableParserBuilder: delimiter
import CitableParserBuilder: generate
import CitableParserBuilder: lexemeurn, lexeme
import CitableParserBuilder: stringParser
import CitableParserBuilder: analyses


using CitableBase
import CitableBase: citabletrait
import CitableBase: urn
import CitableBase: label

import CitableBase: cextrait
import CitableBase: cex
import CitableBase: fromcex

using CitableObject


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
export HebrewNoun
export HebrewObjectPronoun

export LuhotVerbStem

export filesDataset

export generate
export conjugate, conjugation_md


export luhotStringParser
export hebrewForm

export conjugate_tense_md, parallel_conjugations_md

include("tokensplitter.jl")

include("morphologicalproperties/properties.jl")
include("morphologicalproperties/verbpattern.jl")
include("morphologicalproperties/tense.jl")
include("morphologicalproperties/person.jl")
include("morphologicalproperties/number.jl")
include("morphologicalproperties/gender.jl")
include("morphologicalproperties/state.jl")

include("forms/formvalues.jl")
include("forms/forms.jl")
include("forms/objectpronouns.jl")
include("forms/finiteverbs.jl")
include("forms/nouns.jl")

include("stems/stems.jl")
include("stems/verbstems.jl")

include("dataset/dataset.jl")
include("dataset/fileslayout.jl")
include("dataset/filesdataset.jl")

include("generate/generate.jl")
include("generate/verbs/sound/hiphil_sound.jl")
include("generate/verbs/sound/hithpael_sound.jl")
include("generate/verbs/sound/hophal_sound.jl")
include("generate/verbs/sound/niphal_sound.jl")
include("generate/verbs/sound/piel_sound.jl")
include("generate/verbs/sound/pual_sound.jl")
include("generate/verbs/sound/qal_sound.jl")
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


include("forapps/md_verbs.jl")

end # module Luhot

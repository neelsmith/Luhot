
#=
vpattern::HMPVerbPattern
    vtense::HMPTense
    vperson::HMPPerson
    vnumber::HMPNumber
    vgender
=#
"""Compose a table in markdown format with the conjugation of a a verb in a given pattern and tense.
$(SIGNATURES)
"""
function conjugate_tense_md(root::AbstractString, pttrn::HMPVerbPattern, tns::HMPTense, )
   formsv = tenseforms(pttrn, tns)
    mdlines = ["| Person/gender | Singular | Plural |",   
    "| --- | --- | --- |",
    "| Third masculine | $(generate(root, formsv[1])) |   $(generate(root, formsv[6])) |",
    "| Third feminine | $(generate(root, formsv[2])) |  $(generate(root, formsv[7])) |",
    "| Second masculine | $(generate(root, formsv[3])) |  $(generate(root, formsv[8])) |",
    "| Second feminine | $(generate(root, formsv[4])) |  $(generate(root, formsv[9])) |",
    "| First common | $(generate(root, formsv[5])) |  $(generate(root, formsv[10])) |",

    ]

    join(mdlines, "\n")
end


function tenseforms(pttrn::HMPVerbPattern, tns::HMPTense)
    [
        HebrewFiniteVerb(pttrn, tns, hmpPerson(3), hmpNumber("singular"), hmpGender("masculine")),
        HebrewFiniteVerb(pttrn, tns, hmpPerson(3), hmpNumber(1),  hmpGender("feminine")),

        HebrewFiniteVerb(pttrn, tns, hmpPerson(2), hmpNumber(1),  hmpGender("masculine")),
        HebrewFiniteVerb(pttrn, tns, hmpPerson(2), hmpNumber(1), hmpGender("feminine")),

        HebrewFiniteVerb(pttrn, tns, hmpPerson(1), hmpNumber(1),  hmpGender("common")),
        
        HebrewFiniteVerb(pttrn, tns, hmpPerson(3), hmpNumber("plural"),  hmpGender("masculine")),
        HebrewFiniteVerb(pttrn, tns, hmpPerson(3),hmpNumber("plural"),  hmpGender("feminine")),

        HebrewFiniteVerb(pttrn, tns, hmpPerson(2),hmpNumber("plural"),  hmpGender("masculine")),
        HebrewFiniteVerb(pttrn, tns, hmpPerson(2),hmpNumber("plural"), hmpGender("feminine")),

       HebrewFiniteVerb(pttrn, tns, hmpPerson(1),hmpNumber("plural"),  hmpGender("common"))
    ]
   
end

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


function parallel_conjugations_md(root::AbstractString, tns::HMPTense)
    
    qalforms = tenseforms(hmpPattern("qal"), tns)
    niphalforms  = tenseforms(hmpPattern("niphal"), tns)

    pielforms = tenseforms(hmpPattern("piel"),tns)
    pualforms = tenseforms(hmpPattern("pual"), tns)

    hiphilforms = tenseforms(hmpPattern("hiphil"),tns)
    hophalforms = tenseforms(hmpPattern("hophal"), tns)

    hithpaelforms = tenseforms(hmpPattern("hithpael"), tns)


    mdlines = [
        "| p/n/g | qal | niphal | piel | pual | hiphil | hophal | hithpael | ",
        "| --- | --- | --- | --- | --- | --- | --- | --- |",
        "| 3.s.m. | $(generate(root, qalforms[1])) | $(generate(root, niphalforms[1])) | $(generate(root,pielforms[1])) | $(generate(root, pualforms[1])) | $(generate(root, hiphilforms[1])) | $(generate(root, hophalforms[1])) | $(generate(root, hithpaelforms[1])) | ",

         "| 3.s.f. | $(generate(root, qalforms[2])) | $(generate(root, niphalforms[2])) | $(generate(root,pielforms[2])) | $(generate(root, pualforms[2])) | $(generate(root, hiphilforms[2])) | $(generate(root, hophalforms[2])) | $(generate(root, hithpaelforms[2])) | ",

         "| 2.s.m. | $(generate(root, qalforms[3])) | $(generate(root, niphalforms[3])) | $(generate(root,pielforms[3])) | $(generate(root, pualforms[3])) | $(generate(root, hiphilforms[3])) | $(generate(root, hophalforms[3])) | $(generate(root, hithpaelforms[3])) | ",


         "| 2.s.f. | $(generate(root, qalforms[4])) | $(generate(root, niphalforms[4])) | $(generate(root,pielforms[4])) | $(generate(root, pualforms[4])) | $(generate(root, hiphilforms[4])) | $(generate(root, hophalforms[4])) | $(generate(root, hithpaelforms[4])) | ",


         "| 1.s.c. | $(generate(root, qalforms[5])) | $(generate(root, niphalforms[5])) | $(generate(root,pielforms[5])) | $(generate(root, pualforms[5])) | $(generate(root, hiphilforms[5])) | $(generate(root, hophalforms[5])) | $(generate(root, hithpaelforms[5])) | ",


         "| 3.p.m. | $(generate(root, qalforms[6])) | $(generate(root, niphalforms[6])) | $(generate(root,pielforms[6])) | $(generate(root, pualforms[6])) | $(generate(root, hiphilforms[6])) | $(generate(root, hophalforms[6])) | $(generate(root, hithpaelforms[6])) | ",

         "| 3.p.f. | $(generate(root, qalforms[7])) | $(generate(root, niphalforms[7])) | $(generate(root,pielforms[7])) | $(generate(root, pualforms[7])) | $(generate(root, hiphilforms[7])) | $(generate(root, hophalforms[7])) | $(generate(root, hithpaelforms[7])) | ",

         "| 2.p.m. | $(generate(root, qalforms[8])) | $(generate(root, niphalforms[8])) | $(generate(root,pielforms[8])) | $(generate(root, pualforms[8])) | $(generate(root, hiphilforms[8])) | $(generate(root, hophalforms[8])) | $(generate(root, hithpaelforms[8])) | ",


         "| 2.p.f. | $(generate(root, qalforms[9])) | $(generate(root, niphalforms[9])) | $(generate(root,pielforms[9])) | $(generate(root, pualforms[9])) | $(generate(root, hiphilforms[9])) | $(generate(root, hophalforms[9])) | $(generate(root, hithpaelforms[9])) | ",


         "| 1.p.c. | $(generate(root, qalforms[10])) | $(generate(root, niphalforms[10])) | $(generate(root,pielforms[10])) | $(generate(root, pualforms[10])) | $(generate(root, hiphilforms[10])) | $(generate(root, hophalforms[10])) | $(generate(root, hithpaelforms[10])) | ",
    ]

    join(mdlines, "\n")
end

function parallel_conjugations_md(root::AbstractString)
     
    pft = """**Perfect tense**:\n\n""" *     parallel_conjugations_md(root, hmpTense("perfect"))
    impft = """**Imperfect tense**:\n\n""" *     parallel_conjugations_md(root, hmpTense("imperfect"))


    join([pft, impft], "\n\n")
    # * imperfect...
#=
     mdlines = ["| Person/gender | Singular | Plural |",   
     "| --- | --- | --- |",
     "| Third masculine | $(generate(root, formsv[1])) |   $(generate(root, formsv[6])) |",
     "| Third feminine | $(generate(root, formsv[2])) |  $(generate(root, formsv[7])) |",
     "| Second masculine | $(generate(root, formsv[3])) |  $(generate(root, formsv[8])) |",
     "| Second feminine | $(generate(root, formsv[4])) |  $(generate(root, formsv[9])) |",
     "| First common | $(generate(root, formsv[5])) |  $(generate(root, formsv[10])) |",
 
     ]

     join(mdlines, "\n")
     =#
 end

"""Generate forms for a give combination of pattern and tense.
$(SIGNATURES)
"""
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
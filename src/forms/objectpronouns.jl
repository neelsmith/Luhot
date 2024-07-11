
"""Structure for finite verb form in Biblical Hebrew."""
struct HebrewObjectPronoun <: HebrewForm
    operson::HMPPerson
    onumber::HMPNumber
    ogender::HMPGender
end




"""Override Base.show for a finite verb form.
$(SIGNATURES)
"""
function show(io::IO, obj::HebrewObjectPronoun)
    print(io, label(obj))
end

"""Override Base.== for a finite verb form.
$(SIGNATURES)
"""
function ==(obj1::HebrewObjectPronoun, obj2::HebrewObjectPronoun)
    hmpPerson(vb1)  == hmpPerson(vb2) &&
    hmpNumber(vb1)  == hmNumber(vb2) &&
    hmpGender(vb1)  == hmpGender(vb2) 
end

CitableTrait(::Type{HebrewObjectPronoun}) = CitableByCite2Urn()
"""Finite verb forms are citable by Cite2Urn
$(SIGNATURES)
"""
function citabletrait(::Type{HebrewObjectPronoun})
    CitableByCite2Urn()
end

"""Compose a Cite2Urn for a `HebrewFiniteVerb`.

$(SIGNATURES)
"""
function urn(obj::HebrewObjectPronoun)
    Cite2Urn(BASE_MORPHOLOGY_URN * code(obj) )
end


"""Compose a readable label for the form of a `HebrewFiniteVerb`.
$(SIGNATURES)
"""
function label(obj::HebrewObjectPronoun)
    pieces = ["pronoun:",
    label(obj.operson), 
    label(obj.onumber), 
    label(obj.ogender)]
    join(pieces, " ")
end




function code(obj::HebrewObjectPronoun)
    string(PRONOUN, "00",code(obj.operson), code(obj.onumber), code(obj.ogender),"00")
end



"""Find person for a `HebrewObjectPronoun`.

**Example**

```julia
julia> pron = HebrewObjectPronoun(hmpPerson("second"), hmpNumber("singular"), hmpGender("feminine"))
pronoun: second singular feminine

julia> hmpPerson(pron)
second
```

$(SIGNATURES)
"""
function hmpPerson(obj::HebrewObjectPronoun)
    obj.operson
end

"""Find person for a `HebrewObjectPronoun`.

**Example**

```julia
julia> pron = HebrewObjectPronoun(hmpPerson("second"), hmpNumber("singular"), hmpGender("feminine"))
pronoun: second singular feminine

julia> hmpNumber(pron)
singular
```

$(SIGNATURES)
"""
function hmpNumber(obj::HebrewObjectPronoun)
    obj.onumber
end


"""Find gender for a `HebrewObjectPronoun`.

**Example**
```julia
julia> pron = HebrewObjectPronoun(hmpPerson("second"), hmpNumber("singular"), hmpGender("feminine"))
pronoun: second singular feminine

julia> hmpGender(pron)
feminine
```

$(SIGNATURES)
"""
function hmpGender(obj::HebrewObjectPronoun)
    obj.ogender
end
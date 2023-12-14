# Luhot.jl

- build a corpus-specific parser from delimited-text source: a Luhot *dataset*
- generate complete set of possible forms for a dataset
- "parse" isthen reduced to look up in database of generated forms



See the awesome Pluto notebook(s) in the `pluto` directory.


## Quick demo: generating forms

Use Luhot functions to create a finite verb form:

```@example tldr
using Luhot
pattern = hmpPattern("qal")
tense = hmpTense("perfect")
pers = hmpPerson("third")
num = hmpNumber("singular")
gender = hmpGender("masculine")
verbform = HebrewFiniteVerb(
    pattern, tense,
    pers, num, gender
)
```

Create a stem record from a delimited string:
```@example tldr
verbdata = "verbs.BDB4250|bdb.BDB4250|כתב|sound"
verbstem = Luhot.readstemrow(verbdata, Luhot.VerbIO())
```

```@example tldr
using Markdown
verbstring = generate(verbstem, verbform)
Markdown.parse(verbstring)
```


Note on labelling of tenses:

- perfect, imperfect, imperative follow traditional usages.
- 1st person cohortative, second person emhatic imperative, third person jussive are treated together and labelled "cohortative-jussive"


Note on URNs for forms:

PosPatTPNGStateUninfcat

Code digits are:

1. part of speech
2. verb pattern (benyamin)
3. tense
4. person
5. number
6. gender
7. substantive state
8. uninflected category
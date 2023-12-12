# Paradigms



The package includes convenience functions for generating lists of forms in paradigm order, and for formatting markdown tables for paradigms of a given verb pattern.

## Conjugate a verb in a given pattern and tense

The `conjugate` function composes a list of strings with all forms of a 
specified pattern and tense.  For example, for the perfect tense, the result is nine strings in the traditional sequence third and second singular masculine and feminine, first singular and third plural common, second and third plural masculine and feminine, and first plural common.

```@example paradigms
using Luhot
vrb = "קטל"
qalpft = conjugate(vrb, hmpPattern("qal"), hmpTense("perfect"))
length(qalpft)
```


## Format conjugation tables in markdown

The `conjugation_md` function composes a markdown string that combines conjugations for all patterns of a specified tense in a table.  The following examples illustrate markdown paradigms for the perfect and imperfect.


### Example: the perfect tense

```@example paradigms
using Markdown
perfecttable = conjugation_md(vrb, hmpTense("perfect"))
perfecttable |> Markdown.parse
```

### Example: the imperfect tense

```@example paradigms
imperfecttable = conjugation_md(vrb, hmpTense("imperfect"))
imperfecttable |> Markdown.parse
```
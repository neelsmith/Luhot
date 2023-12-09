# Internals: the Luhot IO system

- abstract type `LuhotIO`
- implemented by specific types for each analytical type
- `readstem` implemented for each type


- `readstem` uses `CitableParserBuilder`'s URN types

Note how these work:

- `AbbreviatedUrn`
- `StemUrn`

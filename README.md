# Luhot.jl

> *Build morphological parsers for Biblical Hebrew from tabular data sources*.

**Current status**:  work for an initial release is in progress.  Release 0.1.0 will focus on parsing the complete system of finite forms for sound verbs.  [This milestone](https://github.com/neelsmith/Luhot.jl/milestone/1) in the project issue tracker defines outstanding tasks to reach 0.1.0.


## Grid of implementation

Key:

- ✅ fully implemented
- 🥇 target for 0.1 release
- 🥈 target for 0.2 release
- 🥉 target for 0.3 release: TBD


**Finite verb forms**:

| Verb type | Example | Perfect | Imperfect | Imperative | Jussive | Corhortative|
| --- | --- | --- | --- | --- | --- |  --- | 
| sound | קָטַל | ✅  | ✅  | 🥇 | 🥇 | 🥇 |
| sound - begadkefat | כָּתַב |  🥇 | 🥇 | 🥇  | 🥇 | 🥇 |
| pe-guttural | עָבַד |  |  |  |  |   |
| pe-aleph | אָחַר |  |  |  |  |   |
| pe-waw/yod | יָלַד |  |  |  |  |   |
| pe-nun | נָפַל |  |  |  |  |   |
| ayin-guttural | בָּחַר |  |  |  |  |   |
| ayin-waw/yod  ("hollow root")| קָם| |  |  |  |  |  
| lamed-guttural | שָׁמַע |  |  |  |  |   |
| lamed-aleph | בָּרָא |  |  |  |  |   |
| lamed-he | בָּנָה |  🥈 | 🥈 | 🥈  |  🥈 | 🥈  |
| double-ayin ("geminates") | סָבַב |  |  |  |  |   |


**Other verb forms**:

| Verb type | Example |Infinitives | Participles | waw-consecutive  |
| --- | --- | --- | --- | --- |
| sound | קָטַל | 🥈 | 🥈 | 🥈|
| sound - begadkefat | כָּתַב | 🥈 | 🥈 | 🥈 | 
| pe-guttural | עָבַד |  |  |  | 
| pe-aleph | אָחַר |  |  |  |  
| pe-waw/yod | יָלַד |  |  |  | 
| pe-nun | נָפַל |  |  |  | 
| ayin-guttural | בָּחַר |  |  |  |  
| ayin-waw/yod ("hollow root") |   קָם||  |  |   
| lamed-guttural | שָׁמַע |  |  |  |  
| lamed-aleph | בָּרָא  |  |  |  |  
| lamed-he | בָּנָה |  🥈 |  🥈 |  🥈 | 
| double-ayin ("geminates") | סָבַב |  |  |  | 

**Nouns**: TBA


# CRL Framework — Computational Readiness Level

## Overview

The Computational Readiness Level (CRL) is a 1–5 ordinal scale that measures how amenable a language's transliteration guideline is to automatic computer implementation.

It was developed as part of the TransOnto project to provide a structured way to communicate the gap between a human-readable guideline document and a deployable rule-based system.

---

## Scale Definition

| Score | Label | Description |
|---|---|---|
| 1 | Convention only | No formal rules; transliteration is based on established usage without documented principles |
| 2 | Partial rules | Some rules documented; significant dependency on G2P (grapheme-to-phoneme) conversion; many exception cases |
| 3 | Mostly formalizable | Most rules can be formalized; G2P pre-processing required before rule application |
| 4 | Largely automatable | Rules mostly automatable; minor exception handling required |
| 5 | Fully rule-based | All cases covered by formal rules; no human intervention needed |

---

## Assessment for RoyalSocietyTransKG Languages

### German — CRL-3

**Evidence:**
- 31 rules fully documented with IPA examples (Duden Band 6 reference)
- Rules are mostly phoneme-based and formalizable
- G2P pre-processing required for umlauts (ä, ö, ü) and r-vocalization
- French loanwords in German require language identification before rule selection
- r-coloring ambiguity (Rule 7, 17, 21) remains unresolved in 3 cases

**System accuracy:** 92.68% word-level, 97.35% syllable-level

### French — CRL-3

**Evidence:**
- 14 rule additions documented from Le Petit Robert (2006)
- Nasal vowels ([ɑ̃], [ɔ̃], [ɛ̃]) require G2P
- Liaison rules require syntactic context (word boundary detection)
- h aspiré vs h muet distinction requires lexical lookup
- 2 additions (03, 04) marked UNRESOLVED by committee

**System accuracy:** Not yet benchmarked (benchmark available, system result pending)

### English — CRL-2

**Evidence:**
- English orthography is highly irregular; same grapheme maps to multiple phonemes
- Strong G2P dependency — Cambridge Dictionary IPA used as reference
- Conventional forms (นิยม) diverge from rule-derived forms for established loanwords
- Short vowel glyph (ไม้ไต่คู้) requires context not available from IPA alone
- Silent consonant retention is convention-based, not derivable from IPA

**System accuracy:** 67.48% word-level (220/326)

---

## Relationship to Ontology

CRL is modelled as `to:ComputationalReadinessLevel`, linked from `to:Language` via `to:hasReadinessLevel`.

```turtle
to:CRL_DE
    a to:ComputationalReadinessLevel ;
    to:crlScore 3 ;
    to:crlEvidence "German requires G2P pre-processing..."@en .

to:German
    to:hasReadinessLevel to:CRL_DE .
```

Query all CRL scores: `sparql/UC3_crl.rq`

---

## Future Work

- Refine CRL to sub-dimensions: (a) rule completeness, (b) G2P dependency, (c) exception density
- Extend to remaining Royal Society languages: Indonesian, Malay, Japanese, Chinese
- Cross-validate CRL scores against system accuracy empirically

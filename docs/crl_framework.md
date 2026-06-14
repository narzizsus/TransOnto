# CRL Framework  Computational Readiness Level

## Overview

The Computational Readiness Level (CRL) is a 1-5 ordinal scale that measures how amenable a language's transliteration guideline is to automatic computer implementation.

It was developed as part of the TransOnto project to provide a structured way to communicate the gap between a human-readable guideline document and a deployable rule-based system.

---

## Scale Definition

| Score | Label | Interpretation |
|---|---|---|
| 1 (CRL-1) | Directly executable | No additions or ambiguities required; all cases covered by formal rules with no expert intervention |
| 2 (CRL-2) | Minor supplementation | Edge cases only; 1-15 readiness score; localized decisions |
| 3 (CRL-3) | Moderate intervention | Systematic but manageable gaps; 16-40 readiness score |
| 4 (CRL-4) | Substantial intervention | Multiple ambiguous rules with broad cross-item impact; 41-70 readiness score |
| 5 (CRL-5) | Extensive intervention | Pervasive underspecification; readiness score >70; most expert work needed |

**Scoring formula:** `ReadinessScore = |Additions| + 2×|Ambiguities| + |Decisions|`

Higher CRL score = less computationally ready = more expert intervention required.

---

## Assessment for RoyalSocietyTransKG Languages

### English  CRL-3

**ReadinessScore:** 35 (0 additions + 2×12 ambiguities/decisions = 35)

**Evidence:**
- English orthography is highly irregular; same grapheme maps to multiple phonemes
- Strong G2P dependency  Cambridge Dictionary IPA used as reference
- Conventional forms diverge from rule-derived forms for established loanwords
- Short vowel glyph requires context not available from IPA alone
- Silent consonant retention is convention-based, not derivable from IPA

**System accuracy:** 67.48% word-level (220/326)

### German  CRL-4

**ReadinessScore:** 35 (0 additions + 2×7 ambiguities + 11 decisions = 35)

Expert upward adjustment from CRL-3 to CRL-4 because two of the ambiguities (r-coloring and final devoicing) each affect broad vocabulary categories, generating systematic cross-item failures beyond what the score alone suggests.

**Evidence:**
- 31 rules fully documented with IPA examples (Duden Band 6 reference)
- Rules are mostly phoneme-based and formalizable
- G2P pre-processing required for umlauts and r-vocalization
- French loanwords in German require language identification before rule selection
- r-coloring ambiguity (Rule 7, 17, 21) remains challenging across many items

**System accuracy:** 92.68% word-level, 97.35% syllable-level

### French  CRL-5

**ReadinessScore:** 104 (14 additions + 2×7 ambiguities shared context + 11 decisions = 104)

ReadinessScore of 104 exceeds the CRL-5 threshold (>70).

**Evidence:**
- 14 rule additions documented from Le Petit Robert (2006)
- Nasal vowels require G2P
- Liaison rules require syntactic context (word boundary detection)
- h aspiré vs h muet distinction requires lexical lookup
- 2 additions (03, 04) marked UNRESOLVED by committee

**System accuracy:** Not yet benchmarked (benchmark available, system result pending)

---

## Relationship to Ontology

CRL is modelled as `to:ComputationalReadinessLevel`, linked from `to:Language` via `to:hasReadinessLevel`.

```turtle
to:CRL_DE
    a to:ComputationalReadinessLevel ;
    to:crlScore 4 ;
    to:readinessScore 35 ;
    to:crlEvidence "German requires G2P pre-processing..."@en .

to:German
    to:hasReadinessLevel to:CRL_DE .
```

The `to:crlScore` property uses the paper-standard scale: **1=CRL-1 (directly executable), 5=CRL-5 (requires most expert intervention)**. This is the inverse of the old scale.

The `to:readinessScore` property stores the formula-derived value. Final CRL assignments incorporate expert judgment and may differ from the raw score.

Query all CRL scores and readiness scores: `sparql/UC3_crl.rq`

---

## Future Work

- Refine CRL to sub-dimensions: (a) rule completeness, (b) G2P dependency, (c) exception density
- Extend to remaining Royal Society languages: Indonesian, Malay, Japanese, Chinese
- Cross-validate CRL scores against system accuracy empirically

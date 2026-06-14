# TransOnto v1.0.0 + RoyalSocietyTransKG v1.0.0

**First public release** — 2026-06-13

---

## TransOnto v1.0

An OWL 2 ontology for representing prescriptive transliteration standards and their computational formalization.

* **IRI:** `https://w3id.org/transonto`
* **15 classes** · **18 object properties** · **19 data properties** · **59 named individuals**
* Four-layer architecture:

  * Language Standards
  * Formalization
  * Lexicon
  * Evaluation
* Computational Readiness Level (CRL) framework

  * CRL-1 = directly executable
  * CRL-5 = requires the greatest expert intervention
* Alignment with OntoLex-Lemon and PROV-O

---

## RoyalSocietyTransKG v1.0

| Component                      |    Triples |
| ------------------------------ | ---------: |
| Ontology (`transonto.ttl`)     |        697 |
| Knowledge Graph (`kg_all.ttl`) |     12,899 |
| **Combined**                   | **13,591** |

| Item               |                         Count |
| ------------------ | ----------------------------: |
| Lexical Entries    | 569 (DE 180 · FR 92 · EN 297) |
| Benchmark Items    |                           564 |
| Rules + Additions  |    57 (DE 31 · EN 12 · FR 14) |
| Rule Ambiguities   |                7 (ABox count) |
| Expert Decisions   |               11 (ABox count) |
| Evaluation Results |   1 (EN 67.48% word accuracy) |

> German evaluation results are documented in ontology individual `EvalResult_DE_2025` with **92.68% word-level accuracy** and **97.35% syllable-level accuracy**. These results are represented in the ontology and are not instantiated as ABox `EvaluationResult` instances.

> Statistics reported above use the authoritative ABox counts from `kg_all.ttl`. Combined ontology + KG counts differ because `transonto.ttl` contributes additional schema-level reference individuals.

---

## Language Coverage

| Language | Lexical Entries | Benchmark Items | Rules / Additions | Accuracy                                 |
| -------- | --------------: | --------------: | ----------------- | ---------------------------------------- |
| German   |             180 |             175 | Rule_DE_01–31     | 92.68% word-level; 97.35% syllable-level |
| French   |              92 |              92 | Add_FR_01–14      | Not yet benchmarked                      |
| English  |             297 |             297 | Rule_EN_01–12     | 67.48% word-level                        |

---

## Computational Readiness Levels (CRL)

| Language | ReadinessScore | Final CRL |
| -------- | -------------: | --------- |
| English  |             35 | CRL-3     |
| German   |             35 | CRL-4     |
| French   |            104 | CRL-5     |

**Formula**

```text
ReadinessScore = |Additions| + 2×|Ambiguities| + |Decisions|
```

German and English share the same numerical readiness score, but German is assigned CRL-4 because its documented ambiguities affect broader vocabulary categories and create systematic cross-item implementation challenges.

---

## Files

```text
ontology/
├── transonto.ttl
└── transonto.owl

kg/
├── kg_de.ttl
├── kg_fr.ttl
├── kg_en.ttl
└── kg_all.ttl

sparql/
├── UC1_ambiguity.rq
├── UC3_crl.rq
├── UC4_explainability.rq
├── UC5_coverage.rq
├── UC6_errors.rq
├── UC7_en_coverage.rq
└── UC8_fr_additions.rq

docs/
├── competency_questions.md
├── crl_framework.md
└── kg_statistics.md
```

---

## Quick Load

```python
from rdflib import Graph

g = Graph()
g.parse("ontology/transonto.ttl", format="turtle")
g.parse("kg/kg_all.ttl", format="turtle")

print(len(g))
# 13591
```

---

## Highlights

* First ontology dedicated to computational formalization of Royal Society transliteration standards.
* Introduces the Formalization Layer for modelling ambiguities, expert additions, and expert decisions.
* Provides benchmark-aligned multilingual transliteration knowledge graphs for German, French, and English.
* Implements the Computational Readiness Level (CRL) framework for assessing deployability of language standards.
* Includes validated SPARQL competency-question queries and explainability paths.

---

**License:** CC BY 4.0

**Zenodo DOI:** To be assigned

# TransOnto v1.0.0 + RoyalSocietyTransKG v1.0.0

**First public release** — 2026-06-13

---

## TransOnto v1.0

An OWL 2 ontology for representing prescriptive transliteration standards and their computational formalization.

* **IRI:** `https://w3id.org/transonto`
* **15 classes** · **18 object properties** · **20 data properties** · **98 named individuals**
* **887 ontology triples**
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

### Triple Counts

| Component                      |    Triples |
| ------------------------------ | ---------: |
| Ontology (`transonto.ttl`)     |        887 |
| Knowledge Graph (`kg_all.ttl`) |     12,899 |
| **Combined Graph**             | **13,677** |

> Combined graph size is computed after RDF graph merging and duplicate triple elimination.

### ABox Statistics (Authoritative Counts)

| Item                |                         Count |
| ------------------- | ----------------------------: |
| Languages           |                             3 |
| Lexical Entries     | 569 (DE 180 · FR 92 · EN 297) |
| Benchmark Items     |                           564 |
| Gold Labels         |                           564 |
| Rules (DE + EN)     |                            43 |
| Rule Additions (FR) |                            14 |
| Rule Ambiguities    |                             7 |
| Expert Decisions    |                            11 |
| Evaluation Results  |                             1 |

> Statistics above use the authoritative ABox counts derived from `kg_all.ttl`.

---

## Language Coverage

| Language | Lexical Entries | Benchmark Items | Rules / Additions | Accuracy                                 |
| -------- | --------------: | --------------: | ----------------- | ---------------------------------------- |
| German   |             180 |             175 | Rule_DE_01–31     | 92.68% word-level; 97.35% syllable-level |
| French   |              92 |              92 | Add_FR_01–14      | Not yet benchmarked                      |
| English  |             297 |             297 | Rule_EN_01–12     | 67.48% word-level                        |

### Evaluation Results

**ABox EvaluationResult instances**

* English: 67.48% word-level accuracy

**Ontology-documented evaluation results**

* German: 92.68% word-level accuracy
* German: 97.35% syllable-level accuracy

German evaluation is represented by ontology individual `EvalResult_DE_2025` and is not instantiated as an ABox `EvaluationResult`.

---

## Computational Readiness Levels (CRL)

| Language | ReadinessScore | Final CRL |
| -------- | -------------: | --------- |
| English  |             35 | CRL-3     |
| German   |             35 | CRL-4     |
| French   |            104 | CRL-5     |

Formula:

```text
ReadinessScore = |Additions| + 2×|Ambiguities| + |Decisions|
```

German and English share the same readiness score, but German is assigned CRL-4 because its ambiguities affect broader vocabulary categories and require greater expert intervention.

---

## Repository Contents

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
# 13677
```

---

## Highlights

* First ontology dedicated to computational formalization of Royal Society transliteration standards.
* Explicit modelling of ambiguities, additions, and expert decisions.
* Multilingual transliteration knowledge graph covering German, French, and English.
* Computational Readiness Level (CRL) framework for measuring implementation readiness.
* Benchmark-aligned evaluation resources.
* Validated competency-question SPARQL query suite.
* RDF, OWL, and SPARQL resources released under CC BY 4.0.

---

**License:** CC BY 4.0

**Zenodo DOI:** To be assigned

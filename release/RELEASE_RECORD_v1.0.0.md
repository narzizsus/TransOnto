# RELEASE_RECORD_v1.0.0.md

**Immutable release record — do not edit after Zenodo DOI is assigned.**

---

## Release Identity

| Item         | Value                                         |
| ------------ | --------------------------------------------- |
| Release name | TransOnto v1.0.0 + RoyalSocietyTransKG v1.0.0 |
| Version      | 1.0.0                                         |
| Release date | 2026-06-13                                    |
| Git tag      | v1.0.0                                        |
| Zenodo DOI   | *[fill via POST_DOI_UPDATE.sh]*               |
| Ontology IRI | `https://w3id.org/transonto`                  |
| Version IRI  | `https://w3id.org/transonto/1.0`              |
| License      | CC BY 4.0                                     |

---

## Canonical Metrics

Authoritative reference for all downstream citations, including:

* Paper
* README
* GitHub Release
* Zenodo metadata
* Future ontology documentation

Derived from:

```text
ontology/transonto.ttl
kg/kg_all.ttl
```

Validated using rdflib on 2026-06-13.

### Ontology Metrics

| Metric                             | Value |
| ---------------------------------- | ----: |
| Ontology triples (`transonto.ttl`) |   887 |
| Classes                            |    15 |
| Object properties                  |    18 |
| Data properties                    |    20 |
| Named individuals                  |    98 |

### Knowledge Graph Metrics (ABox Authoritative Counts)

| Metric                    |  Value |
| ------------------------- | -----: |
| KG triples (`kg_all.ttl`) | 12,899 |
| Languages                 |      3 |
| Lexical Entries           |    569 |
| Benchmark Items           |    564 |
| Gold Labels               |    564 |
| Rules (DE + EN)           |     43 |
| Rule Additions (FR)       |     14 |
| Rule Ambiguities          |      7 |
| Expert Decisions          |     11 |
| Evaluation Results        |      1 |

### Combined Graph Metrics

| Metric                    |      Value |
| ------------------------- | ---------: |
| Ontology triples          |        887 |
| KG triples                |     12,899 |
| Raw sum                   |     13,786 |
| Duplicate triples removed |        109 |
| **Merged graph triples**  | **13,677** |

The merged graph count is computed after RDF graph union and duplicate-triple elimination.

---

## Per-Language Breakdown

| Language | Lexical Entries | Benchmark Items | Rules/Additions    | System Accuracy                          |
| -------- | --------------: | --------------: | ------------------ | ---------------------------------------- |
| German   |             180 |             175 | Rule_DE_01–31 (31) | 92.68% word-level; 97.35% syllable-level |
| French   |              92 |              92 | Add_FR_01–14 (14)  | Not yet benchmarked                      |
| English  |             297 |             297 | Rule_EN_01–12 (12) | 67.48% word-level                        |

---

## Evaluation Results

### ABox EvaluationResult Instances

| Language | Accuracy          |
| -------- | ----------------- |
| English  | 67.48% word-level |

Total ABox EvaluationResult instances: **1**

### Ontology-Documented Evaluation Results

| Language | Accuracy                                 |
| -------- | ---------------------------------------- |
| German   | 92.68% word-level; 97.35% syllable-level |

German evaluation is represented by ontology individual `EvalResult_DE_2025` and is not instantiated as an ABox `EvaluationResult`.

---

## CRL Final Assignments

| Language | ReadinessScore | crlScore (ontology) | Final CRL |
| -------- | -------------: | ------------------: | --------- |
| English  |             35 |                   3 | CRL-3     |
| German   |             35 |                   4 | CRL-4     |
| French   |            104 |                   5 | CRL-5     |

Formula:

```text
ReadinessScore = |Additions| + 2×|Ambiguities| + |Decisions|
```

CRL scale:

| Score | Interpretation           |
| ----- | ------------------------ |
| CRL-1 | Directly executable      |
| CRL-2 | Minor supplementation    |
| CRL-3 | Moderate intervention    |
| CRL-4 | Substantial intervention |
| CRL-5 | Extensive intervention   |

---

## Repository Components (Frozen at v1.0.0)

### Ontology

```text
ontology/transonto.ttl
ontology/transonto.owl
```

### Knowledge Graph

```text
kg/kg_de.ttl
kg/kg_fr.ttl
kg/kg_en.ttl
kg/kg_all.ttl
```

### SPARQL

```text
sparql/UC1_ambiguity.rq
sparql/UC3_crl.rq
sparql/UC4_explainability.rq
sparql/UC5_coverage.rq
sparql/UC6_errors.rq
sparql/UC7_en_coverage.rq
sparql/UC8_fr_additions.rq
```

### Documentation

```text
README.md
CHANGELOG.md
docs/competency_questions.md
docs/crl_framework.md
docs/kg_statistics.md
CITATION.cff
LICENSE
VERSION
```

---

## SPARQL Validation (Phase 3)

Validation date: 2026-06-13

| Query                 | Status | Rows |
| --------------------- | ------ | ---: |
| UC4_explainability.rq | PASS   |    2 |
| UC3_crl.rq            | PASS   |    3 |
| UC5_coverage.rq       | PASS   |   31 |
| UC6_errors.rq         | PASS   |   30 |

All demonstration competency-question queries successfully executed against the merged graph.

---

## Provenance

Statistics generated using rdflib over:

```text
ontology/transonto.ttl
kg/kg_all.ttl
```

Validation summary:

* Phase 3 SPARQL validation completed
* All demonstration queries passed
* Metrics synchronized with README
* Metrics synchronized with CHANGELOG
* Metrics synchronized with GitHub Release Notes
* Metrics synchronized with project paper submission package

---

## Post-Release Checklist

* [ ] Run `bash POST_DOI_UPDATE.sh 10.5281/zenodo.XXXXXXX`
* [ ] Register W3ID redirect at `https://w3id.org/transonto`
* [ ] Update camera-ready paper with DOI
* [ ] Confirm CC BY 4.0 compatibility for benchmark data

---

*This file must not be modified after the Zenodo DOI is assigned and release metadata are finalized.*

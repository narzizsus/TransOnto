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

## Canonical Metrics (ABox Authoritative Counts)

Authoritative reference for all downstream citations, including the paper, README, GitHub Release, and Zenodo metadata.

Derived from `kg_all.ttl` and validated against `transonto.ttl` using rdflib (2026-06-13).

> All benchmark statistics below use the authoritative ABox counts derived from `kg_all.ttl`.
>
> Combined graph counts (ontology + KG) are documented separately in `docs/kg_statistics.md` and are not used for paper reporting.

| Metric                             | Value      |
| ---------------------------------- | ---------- |
| Ontology triples (`transonto.ttl`) | 697        |
| KG triples (`kg_all.ttl`)          | 12,899     |
| **Combined triples**               | **13,591** |
| Classes                            | 15         |
| Object properties                  | 18         |
| Data properties                    | 19         |
| Named individuals (ontology)       | 59         |
| Languages                          | 3          |
| Lexical Entries                    | 569        |
| Benchmark Items                    | 564        |
| Gold Labels                        | 564        |
| Rules (DE + EN)                    | 43         |
| Rule Additions (FR)                | 14         |
| Rule Ambiguities                   | 7          |
| Expert Decisions                   | 11         |
| Evaluation Results                 | 1          |

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

German evaluation is represented in ontology individual `EvalResult_DE_2025` and is not instantiated as an ABox `EvaluationResult`.

---

## CRL Final Assignments

| Language | ReadinessScore | crlScore (ontology) | Final CRL (paper) |
| -------- | -------------: | ------------------: | ----------------- |
| English  |             35 |                   3 | CRL-3             |
| German   |             35 |                   4 | CRL-4             |
| French   |            104 |                   5 | CRL-5             |

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

German and English share the same readiness score but differ in final CRL assignment because German ambiguities have broader cross-item impact and require greater expert intervention.

---

## File Manifest (Frozen at v1.0.0)

| File                         |  Lines | Notes                    |
| ---------------------------- | -----: | ------------------------ |
| ontology/transonto.ttl       |    828 | 697 triples              |
| ontology/transonto.owl       |    968 | RDF/XML                  |
| kg/kg_de.ttl                 |  4,869 | 4,109 triples            |
| kg/kg_fr.ttl                 |  2,505 | 2,073 triples            |
| kg/kg_en.ttl                 |  7,963 | 6,709 triples            |
| kg/kg_all.ttl                | 15,228 | 12,899 triples           |
| sparql/UC1_ambiguity.rq      |     25 | CQ4                      |
| sparql/UC3_crl.rq            |     53 | CQ8                      |
| sparql/UC4_explainability.rq |     65 | CQ9                      |
| sparql/UC5_coverage.rq       |     79 | CQ10                     |
| sparql/UC6_errors.rq         |     80 | CQ7                      |
| sparql/UC7_en_coverage.rq    |     21 | EN rule distribution     |
| sparql/UC8_fr_additions.rq   |     21 | CQ5                      |
| docs/competency_questions.md |     71 | CQ1–CQ10                 |
| docs/crl_framework.md        |     62 | CRL scoring              |
| docs/kg_statistics.md        |    100 | Graph-derived statistics |
| README.md                    |    280 | Repository documentation |
| CHANGELOG.md                 |     57 | Release history          |
| CITATION.cff                 |     50 | Citation metadata        |
| LICENSE                      |     13 | CC BY 4.0                |
| VERSION                      |      1 | 1.0.0                    |

---

## SPARQL Validation (Phase 3 — 2026-06-13)

| Query                 | Status | Rows |
| --------------------- | ------ | ---: |
| UC4_explainability.rq | PASS   |    2 |
| UC3_crl.rq            | PASS   |    3 |
| UC5_coverage.rq       | PASS   |   31 |
| UC6_errors.rq         | PASS   |   30 |

---

## Provenance

Statistics derived using rdflib over:

```text
ontology/transonto.ttl
kg/kg_all.ttl
```

Validation status:

* Phase 3 SPARQL validation completed
* All demonstration competency-question queries passed
* Counts verified against `docs/kg_statistics.md`
* Release metrics synchronized with README, CHANGELOG, GitHub Release Notes, and paper submission package

---

## Post-Release Checklist

* [ ] Run `bash POST_DOI_UPDATE.sh 10.5281/zenodo.XXXXXXX`
* [ ] Register W3ID redirect at https://w3id.org/transonto
* [ ] Update paper camera-ready version with DOI
* [ ] Confirm CC BY 4.0 compatibility for benchmark data with NECTEC legal review

---

*This file must not be modified after the Zenodo DOI is assigned and the release metadata are finalized.*

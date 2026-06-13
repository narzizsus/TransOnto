# RELEASE_RECORD_v1.0.0.md

**Immutable release record — do not edit after Zenodo DOI is assigned.**

---

## Release Identity

| Item | Value |
|---|---|
| Release name | TransOnto v1.0.0 + RoyalSocietyTransKG v1.0.0 |
| Version | 1.0.0 |
| Release date | 2026-06-13 |
| Git tag | v1.0.0 |
| Zenodo DOI | *[fill via POST_DOI_UPDATE.sh]* |
| Ontology IRI | `https://w3id.org/transonto` |
| Version IRI | `https://w3id.org/transonto/1.0` |
| License | CC BY 4.0 |

---

## Canonical Metrics

Authoritative reference for all downstream citations — paper, README, GitHub Release, Zenodo metadata.
Derived from `transonto.ttl` + `kg_all.ttl` via rdflib (2026-06-13). See `docs/kg_statistics.md`.

| Metric | Value |
|---|---|
| Ontology triples (transonto.ttl) | 697 |
| KG triples (kg_all.ttl) | 12,899 |
| **Combined triples** | **13,591** |
| Classes | 15 |
| Object properties | 18 |
| Data properties | 19 |
| Named individuals (ontology) | 59 |
| Lexical Entries | 572 |
| Benchmark Items | 564 |
| Gold Labels | 564 |
| Thai Forms | 574 |
| Rules (DE + EN) | 43 |
| Rule Additions (FR) | 14 |
| Rule Ambiguities | 12 |
| Expert Decisions | 12 |
| Experts | 3 |
| Evaluation Results | 2 |
| Languages | 3 |

---

## Per-Language Breakdown

| Language | Lexical Entries | Benchmark Items | Rules/Additions | System Accuracy |
|---|---|---|---|---|
| German | 183 | 175 | Rule_DE_01–31 (31) | 92.68% word |
| French | 92 | 92 | Add_FR_01–14 (14) | — |
| English | 297 | 297 | Rule_EN_01–12 (12) | 67.48% word |

---

## CRL Final Assignments

| Language | ReadinessScore | crlScore (ontology) | Final CRL (paper) |
|---|---|---|---|
| English | 35 | 2 | CRL-3 |
| German | 35 | 3 | CRL-4 |
| French | 104 | 3 | CRL-5 |

Formula: ReadinessScore = |Additions| + 2 x |Ambiguities| + |Decisions|

---

## File Manifest (frozen at v1.0.0)

| File | Lines | Notes |
|---|---|---|
| ontology/transonto.ttl | 828 | 697 triples |
| ontology/transonto.owl | 968 | RDF/XML |
| kg/kg_de.ttl | 4,869 | 4,109 triples |
| kg/kg_fr.ttl | 2,505 | 2,073 triples |
| kg/kg_en.ttl | 7,963 | 6,709 triples |
| kg/kg_all.ttl | 15,228 | 12,899 triples |
| sparql/UC1_ambiguity.rq | 25 | CQ4 |
| sparql/UC3_crl.rq | 53 | CQ8 |
| sparql/UC4_explainability.rq | 65 | CQ9 |
| sparql/UC5_coverage.rq | 79 | CQ10 |
| sparql/UC6_errors.rq | 80 | CQ7 |
| sparql/UC7_en_coverage.rq | 21 | EN rule distribution |
| sparql/UC8_fr_additions.rq | 21 | CQ5 |
| docs/competency_questions.md | 71 | CQ1–CQ10 |
| docs/crl_framework.md | 62 | CRL scoring |
| docs/kg_statistics.md | 100 | Graph-derived stats |
| README.md | 280 | |
| CHANGELOG.md | 57 | |
| CITATION.cff | 50 | |
| LICENSE | 13 | CC BY 4.0 |
| VERSION | 1 | 1.0.0 |

---

## SPARQL Validation (Phase 3 — 2026-06-13)

| Query | Status | Rows |
|---|---|---|
| UC4_explainability.rq | PASS | 2 |
| UC3_crl.rq | PASS | 3 |
| UC5_coverage.rq | PASS | 31 |
| UC6_errors.rq | PASS | 30 |

---

## Post-Release Checklist

- [ ] Run `bash POST_DOI_UPDATE.sh 10.5281/zenodo.XXXXXXX` -> creates tag v1.0.1
- [ ] Register W3ID redirect at https://w3id.org/transonto
- [ ] Update paper camera-ready with DOI footnote
- [ ] Confirm CC BY 4.0 compatibility for benchmark data with NECTEC legal team

---

*This file must not be modified after the Zenodo DOI is assigned and v1.0.1 is tagged.*

# kg_statistics.md  RoyalSocietyTransKG v1.0 Statistics

Generated: 2026-06-13
Source: derived from `transonto.ttl` + `kg_all.ttl` using rdflib

---

## Ontology File (transonto.ttl)

| Item | Count |
|---|---|
| Schema axioms (TBox, schema-only) | 285 |
| Reference individuals (ABox) | ~412 |
| Total triples | 697 |
| Classes | 15 |
| Object properties | 18 |
| Data properties | 19 |

> **TBox note:** The paper reports 285 schema-only TBox triples (class definitions, property declarations, domain/range axioms, excluding named individuals). The complete `transonto.ttl` contains 697 triples including all named individuals (languages, guidelines, rules, CRL levels, error types, evaluation results). These are schema-plus-reference-individuals counts, not ABox benchmark data.

---

## Knowledge Graph File (kg_all.ttl)  ABox Authoritative Counts

The following counts use `kg_all.ttl` as the sole source (ABox only). These are the numbers reported in the paper.

| Item | ABox Count (kg_all.ttl) |
|---|---|
| Standalone triples | 12,899 |
| Combined with transonto.ttl | 13,591 |

| Class | Count |
|---|---|
| Language | 3 |
| Lexical Entries | 569 |
| Benchmark Items | 564 |
| Rule Ambiguities | 7 |
| Expert Decisions | 11 |
| Evaluation Results | 1 (EN only) |

> **Note on Evaluation Results:** German system accuracy (92.68%) is documented in the ontology named individual `EvalResult_DE_2025` (in `transonto.ttl`). It is not instantiated as an ABox `EvaluationResult` in `kg_all.ttl`. Only the English result (67.48%) is an ABox instance.

---

## Combined Graph Summary

| Item | Count |
|---|---|
| Total triples (combined) | 13,591 |
| Languages | 3 |
| Lexical Entries | 572 (569 ABox + 3 in ontology) |
| Thai Forms | 574 |
| Benchmark Items | 564 |
| Gold Labels | 564 |
| Rules (DE + EN) | 43 |
| Rule Additions (FR) | 14 |
| Rule Ambiguities | 12 (combined graph) |
| Expert Decisions | 12 (combined graph) |
| Experts | 3 |
| Evaluation Results | 2 (combined graph) |

> **Combined vs ABox distinction:** The combined graph (ontology + kg_all) shows 12 ambiguities and 12 decisions because the ontology contributes additional schema-level individuals beyond the ABox benchmark data. For paper reporting, use the ABox-only figures: 7 ambiguities, 11 decisions, 1 evaluation result.

---

## Per-Language Breakdown (ABox, kg_all.ttl)

| Language | Lexical Entries | Benchmark Items | Rules/Additions |
|---|---|---|---|
| German | 180 | 175 | Rule_DE_01-31 (31 rules) |
| French | 92 | 92 | Add_FR_01-14 (14 additions) |
| English | 297 | 297 | Rule_EN_01-12 (12 rules) |
| **Total** | **569** | **564** | **57 rules/additions** |

> **Per-language triple note:** Individual files kg_de.ttl (4,109), kg_fr.ttl (2,073), kg_en.ttl (6,709) sum to 12,891, which is 8 fewer than kg_all.ttl (12,899). The 8-triple difference arises from cross-language triple deduplication and 8 shared reference triples (language node cross-links) that appear in kg_all.ttl but are not counted in any single per-language file.

---

## CRL Scores vs Final Assignments

| Language | ReadinessScore | crlScore (ontology) | Final CRL (paper) |
|---|---|---|---|
| English | 35 | 3 | CRL-3 |
| German | 35 | 4 | CRL-4 |
| French | 104 | 5 | CRL-5 |

> **Formula:** `ReadinessScore = |Additions| + 2×|Ambiguities| + |Decisions|`
>
> `to:crlScore` in the ontology uses the paper-standard scale: **1=CRL-1 (directly executable), 5=CRL-5 (requires most expert intervention)**. German crlScore=4 maps to paper CRL-4 because its two ambiguities affect broad vocabulary categories. French ReadinessScore=104 exceeds the CRL-5 threshold (>70). See `docs/crl_framework.md`.

---

## Individual Language KG Files

| File | Standalone Triples |
|---|---|
| kg_de.ttl | 4,109 |
| kg_fr.ttl | 2,073 |
| kg_en.ttl | 6,709 |
| kg_all.ttl | 12,899 |

---

## Validation

All ABox statistics derived by running:

```python
from rdflib import Graph, Namespace, RDF
g = Graph()
g.parse("ontology/transonto.ttl", format="turtle")
g.parse("kg/kg_all.ttl", format="turtle")
TO = Namespace("https://w3id.org/transonto#")
count = lambda cls: sum(1 for _ in g.subjects(RDF.type, TO[cls]))
```

SPARQL validation: all four demo queries pass against merged graph (Phase 3 validation report, 2026-06-13).

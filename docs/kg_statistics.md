# kg_statistics.md — RoyalSocietyTransKG v1.0 Statistics

Generated: 2026-06-13
Source: derived from `transonto.ttl` + `kg_all.ttl` using rdflib

---

## Ontology File (transonto.ttl)

| Item | Count |
|---|---|
| Schema axioms (TBox) | 297 |
| Reference individuals (ABox) | 59 |
| Total triples | 697 |
| Classes | 15 |
| Object properties | 18 |
| Data properties | 19 |

> **TBox/ABox note:** `transonto.ttl` bundles schema axioms (~297 TBox triples) and reference individuals (~400 ABox triples: languages, guidelines, rules, CRL levels, error types). The paper reports 285 schema-only triples. The complete file is 697 triples.

---

## Knowledge Graph File (kg_all.ttl)

| Item | Count |
|---|---|
| Standalone triples | 12,899 |
| Combined with transonto.ttl | 13,591 |

---

## Combined Graph Summary

| Item | Count |
|---|---|
| Total triples (combined) | 13,591 |
| Languages | 3 |
| Lexical Entries | 572 |
| Thai Forms | 574 |
| Benchmark Items | 564 |
| Gold Labels | 564 |
| Rules (DE + EN) | 43 |
| Rule Additions (FR) | 14 |
| Rule Ambiguities | 12 |
| Expert Decisions | 12 |
| Experts | 3 |
| Evaluation Results | 2 |

---

## Per-Language Breakdown

| Language | Lexical Entries | Benchmark Items | Rules/Additions |
|---|---|---|---|
| German | 183 | 175 | Rule_DE_01–31 (31 rules) |
| French | 92 | 92 | Add_FR_01–14 (14 additions) |
| English | 297 | 297 | Rule_EN_01–12 (12 rules) |
| **Total** | **572** | **564** | **57 rules/additions** |

---

## CRL Scores vs Final Assignments

| Language | ReadinessScore | crlScore (ontology) | Final CRL (paper) |
|---|---|---|---|
| English | 35 | 2 | CRL-3 |
| German | 35 | 3 | CRL-4 |
| French | 104 | 3 | CRL-5 |

> **Formula:** `ReadinessScore = |Additions| + 2×|Ambiguities| + |Decisions|`
>
> `to:crlScore` in the ontology stores the formula-based recommendation. Final CRL assignments incorporate expert judgment. German crlScore=3 maps to paper CRL-4 because its two ambiguities affect broad vocabulary categories. French ReadinessScore=104 exceeds the CRL-5 threshold (>70). See `docs/crl_framework.md`.

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

All statistics derived by running:

```python
from rdflib import Graph, Namespace, RDF
g = Graph()
g.parse("ontology/transonto.ttl", format="turtle")
g.parse("kg/kg_all.ttl", format="turtle")
TO = Namespace("https://w3id.org/transonto#")
count = lambda cls: sum(1 for _ in g.subjects(RDF.type, TO[cls]))
```

SPARQL validation: all four demo queries pass against merged graph (Phase 3 validation report, 2026-06-13).

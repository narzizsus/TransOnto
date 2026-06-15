# RELEASE_RECORD.md

**Immutable release record — do not edit after Zenodo DOI is assigned.**

---

## Release Identity

| Item          | Value                                            |
| ------------- | ------------------------------------------------ |
| Release name  | TransOnto v1.0.0 and RoyalSocietyTransKG v1.0.0   |
| Version       | 1.0.0                                            |
| Release date  | 2026-06-15                                       |
| Ontology IRI  | `https://w3id.org/transonto`                     |
| Version IRI   | `https://w3id.org/transonto/1.0`                 |
| License       | CC BY 4.0                                        |
| Zenodo DOI    | *[fill via POST_DOI_UPDATE.sh]*                  |
| Git tag       | v1.0.0                                           |

---

## Included Artifacts

| Artifact                     | Role                              | Triples |
| ---------------------------- | --------------------------------- | ------: |
| `ontology/transonto.ttl` | Ontology — Turtle serialization |     887 |
| `ontology/transonto.owl` | Ontology — RDF/XML serialization|     887 |
| `kg/kg_all.ttl`        | Knowledge graph — ABox            |  12,899 |

All statistics in this record are derived directly from these three files using rdflib. No values are carried forward from prior documentation.

---

## Canonical Metrics

Authoritative reference for all downstream citations, including the project paper, README, GitHub Release Notes, and Zenodo metadata.

### Ontology Metrics (`transonto.ttl`)

| Metric                 | Value |
| ---------------------- | ----: |
| Total triples          |   887 |
| Classes                |    15 |
| Object Properties      |    18 |
| Datatype Properties    |    20 |
| Annotation Properties  |     0 |
| Named Individuals      |    98 |
| OWL Restrictions       |     0 |
| Namespace bindings     |    30 |

### Knowledge Graph Metrics — ABox Authoritative Counts (`kg_all.ttl`)

| Metric              |  Value |
| ------------------- | -----: |
| Total triples       | 12,899 |
| Lexical Entries     |    569 |
| Thai Form instances |    569 |
| Benchmark Items     |    564 |
| Gold Labels         |    564 |
| Rules (EN, ABox)    |     12 |
| Rule Additions (FR) |     14 |
| Rule Ambiguities    |      7 |
| Expert Decisions    |     11 |
| Experts             |      3 |
| Evaluation Results  |      1 |

### Combined Graph Metrics

| Metric                    |      Value |
| ------------------------- | ---------: |
| Ontology triples          |        887 |
| KG triples                |     12,899 |
| Raw sum                   |     13,786 |
| Duplicate triples removed |        135 |
| **Merged graph triples**  | **13,651** |

---

## Per-Language Breakdown

| Language | Lexical Entries | Thai Forms | Benchmark Items | Rules / Additions                            |
| -------- | --------------: | ---------: | --------------: | -------------------------------------------- |
| German   |             180 |        180 |             175 | Rule_DE_01–31 (31 rules; ontology-level only) |
| French   |              92 |         92 |              92 | Add_FR_01–14 (14 additions)                  |
| English  |             297 |        297 |             297 | Rule_EN_01–12 (12 rules; ABox)               |
| **Total**|         **569** |    **569** |         **564** |                                              |

The 5-item gap between total Lexical Entries (569) and total Benchmark Items (564) arises entirely from the German subset: 180 lexical entries but only 175 benchmark items.

---

## Evaluation Results

### ABox EvaluationResult Instances

| Identifier           | Language | Accuracy          | System |
| -------------------- | -------- | ----------------- | ------ |
| `EvalResult_EN_2026` | English  | 67.48% word-level | NECTEC automatic transliteration; 220/326 items |

Total ABox EvaluationResult instances: **1**

### Ontology-Level Evaluation Results

| Identifier           | Language | Accuracy                                 |
| -------------------- | -------- | ---------------------------------------- |
| `EvalResult_DE_2025` | German   | 92.68% word-level; 97.35% syllable-level |

The German evaluation result is represented as an ontology-level named individual and is not instantiated as an ABox `EvaluationResult`. French has not yet been benchmarked.

---

## CRL Assignments

CRL (Computational Readiness Level) scores are recorded in the ontology. The readiness score is computed as:

```
ReadinessScore = |Additions| + 2×|Ambiguities| + |Decisions|
```

| Language | Additions | Ambiguities | Decisions | ReadinessScore | CRL |
| -------- | --------: | ----------: | --------: | -------------: | --- |
| English  |         0 |           4 |         4 |             12 | CRL-3 |
| German   |         0 |           0 |         4 |              4 | CRL-4 |
| French   |        14 |           3 |         3 |             23 | CRL-5 |

Note: CRL scores are recorded directly in the ontology as `crlScore` datatype property values on Language individuals. The ReadinessScore formula above is provided for reference; the definitive CRL assignment is the `crlScore` value in `transonto.ttl`.

### CRL Scale

| CRL   | Interpretation           |
| ----- | ------------------------ |
| CRL-1 | Directly executable      |
| CRL-2 | Minor supplementation    |
| CRL-3 | Moderate intervention    |
| CRL-4 | Substantial intervention |
| CRL-5 | Extensive intervention   |

---

## Validation Results

### Parse Validation

| File                        | Format   | Status | Triples |
| --------------------------- | -------- | ------ | ------: |
| `ontology/transonto.ttl` | Turtle  | PASS  |     887 |
| `ontology/transonto.owl` | RDF/XML | PASS  |     887 |
| `kg/kg_all.ttl`       | Turtle   | PASS   |  12,899 |

### Consistency Checks

| Check                                      | Result                    |
| ------------------------------------------ | ------------------------- |
| TTL and OWL triple counts match            | PASS (887 = 887)          |
| Ontology IRI consistent across formats     | PASS                      |
| Version IRI consistent across formats      | PASS                      |
| `hasGoldLabel` triples match GoldLabel count | PASS (564 = 564)        |
| LexicalEntry count equals ThaiForm count   | PASS (569 = 569)          |
| Merged graph triple count verified         | PASS (13,651)             |

---

## Known Limitations

The following limitations are directly evidenced by the supplied artifacts.

**German rules are ontology-level only.** The 31 German transliteration rules (`Rule_DE_01–31`) are represented as named individuals in the ontology (`transonto.ttl`) and are not instantiated as ABox assertions in `kg_all.ttl`. SPARQL queries that require German rules must load the merged graph.

**English rules are partially duplicated.** The 12 English rules (`Rule_EN_01–12`) appear in both the ontology and the KG ABox. The merged graph deduplicates these.

**French has not been evaluated.** No `EvaluationResult` instance for French exists in either artifact.

**German has no ABox EvaluationResult.** The German evaluation result (`EvalResult_DE_2025`, 92.68% word-level) is an ontology-level individual only.

**LexicalEntry and ThaiForm counts diverge in the combined graph.** The merged graph reports 572 LexicalEntries and 574 ThaiForm instances, reflecting ontology-level individuals added by graph union. ABox counts (569 each) are authoritative for publication.

---

## Reproducibility

To reproduce the merged graph and verify triple counts:

```python
from rdflib import Graph

g = Graph()
g.parse("ontology/transonto.ttl", format="turtle")
g.parse("kg/kg_all.ttl", format="turtle")

print(len(g))  # Expected: 13,651
```

Required input files:

```
ontology/transonto.ttl
ontology/transonto.owl
kg/kg_all.ttl
```

---

## Release Status

**Release Candidate**

All three supplied artifacts parse without error. Ontology IRI, version IRI, and triple counts are consistent across both serializations. All ABox individual counts have been verified by direct SPARQL-equivalent enumeration over the graph. The release is suitable for Zenodo submission once the DOI post-update script is executed and the W3ID redirect is registered.

---

## Post-Release Checklist

- [ ] Run `bash POST_DOI_UPDATE.sh 10.5281/zenodo.XXXXXXX`
- [ ] Register W3ID redirect at `https://w3id.org/transonto`
- [ ] Update camera-ready paper with final DOI
- [ ] Confirm CC BY 4.0 compatibility for all benchmark data
- [ ] Verify SPARQL competency queries against merged graph

---

*This file must not be modified after the Zenodo DOI is assigned and release metadata are finalized.*

# kg_statistics.md

# RoyalSocietyTransKG — Knowledge Graph Statistics

Generated: 2026-06-15

Source files (authoritative):

- `ontology/transonto.ttl`
- `ontology/transonto.owl`
- `kg/kg_all.ttl`

All counts derived directly from these files using rdflib. No values carried forward from prior releases.

---

## Ontology File (`transonto.ttl`)

### Parse Status

| File                     | Format   | Status | Triples |
| ------------------------ | -------- | ------ | ------: |
| `transonto.ttl`  | Turtle   | PASS   |     887 |
| `transonto.owl`  | RDF/XML  | PASS   |     887 |

Both serializations yield identical triple counts. Ontology IRI and version IRI are consistent across both files.

### Ontology Identity

| Item          | Value                            |
| ------------- | -------------------------------- |
| Ontology IRI  | `https://w3id.org/transonto`     |
| Version IRI   | `https://w3id.org/transonto/1.0` |

### Schema Metrics

| Item                   | Count |
| ---------------------- | ----: |
| Total triples          |   887 |
| Classes                |    15 |
| Object Properties      |    18 |
| Datatype Properties    |    20 |
| Annotation Properties  |     0 |
| Named Individuals      |    98 |
| OWL Restrictions       |     0 |
| Namespace bindings     |    30 |

### Ontology-Level Named Individuals (by type)

| Type                       | Count |
| -------------------------- | ----: |
| Rule                       |    43 |
| RuleAddition               |    14 |
| ExpertDecision             |    11 |
| RuleAmbiguity              |     7 |
| ThaiForm                   |     5 |
| LexicalEntry               |     4 |
| Language                   |     3 |
| ErrorType                  |     3 |
| Guideline                  |     3 |
| ComputationalReadinessLevel|     3 |
| EvaluationResult           |     2 |
| **Total**                  |**98** |

Note: Rules (43), RuleAdditions (14), RuleAmbiguities (7), ExpertDecisions (11), and EvaluationResults (2) are represented as named individuals in the ontology. The 31 German rules and all French rule additions are ontology-level individuals only. English rules and the English ABox benchmark data co-exist in both layers.

---

## Knowledge Graph File (`kg_all.ttl`)

### ABox Authoritative Counts

These are the canonical figures for all downstream citation, publication, and release documentation.

| Item               |  Count |
| ------------------ | -----: |
| Total triples      | 12,899 |
| LexicalEntries     |    569 |
| ThaiForm instances |    569 |
| Benchmark Items    |    564 |
| Gold Labels        |    564 |
| Rules (EN only)    |     12 |
| Rule Additions (FR)|     14 |
| Rule Ambiguities   |      7 |
| Expert Decisions   |     11 |
| Experts            |      3 |
| Evaluation Results |      1 |

### Graph-Level Metrics

| Item                                                     |  Count |
| -------------------------------------------------------- | -----: |
| Object property assertion triples (object is URI ref)    |  3,614 |
| Datatype property assertion triples (object is Literal)  |  4,653 |
| `rdf:type` triples                                       |  4,632 |

### Predicates by Frequency

| Predicate                                | Count |
| ---------------------------------------- | ----: |
| `rdf:type`                               | 4,632 |
| `rdfs:label`                             | 1,748 |
| `to:thaiScript`                          | 1,133 |
| `to:exemplifiesRule`                     |   771 |
| `to:evaluatesRule`                       |   696 |
| `to:isPreferred`                         |   569 |
| `to:sourceForm`                          |   569 |
| `to:fromSourceLanguage`                  |   569 |
| `to:hasThaiForm`                         |   569 |
| `to:hasGoldLabel`                        |   564 |
| `to:ipa`                                 |   547 |
| `to:producedEvaluationResult`            |   298 |
| `to:hasAmbiguity`                        |    47 |
| `to:evaluatesPhenomenon`                 |    40 |
| `to:appliedToLanguage`                   |    26 |
| `to:ruleText`                            |    26 |
| `to:additionNumber`                      |    14 |
| `to:ruleNumber`                          |    12 |
| `to:madeByExpert`                        |    11 |
| `to:decisionJustification`               |    11 |
| `to:justifiedByDecision`                 |    11 |
| `to:ambiguityDescription`                |     7 |
| `dcterms:description`                    |     7 |
| `owl:imports`                            |     7 |

---

## Language Coverage

### Per-Language Breakdown (ABox)

| Language    | Lexical Entries | Thai Forms | Benchmark Items | Rules / Additions  |
| ----------- | --------------: | ---------: | --------------: | ------------------ |
| German      |             180 |        180 |             175 | Rule_DE_01–31 (31 rules, ontology-level) |
| French      |              92 |         92 |              92 | Add_FR_01–14 (14 additions) |
| English     |             297 |        297 |             297 | Rule_EN_01–12 (12 rules, ABox) |
| **Total**   |         **569** |    **569** |         **564** |                    |

The 5-item discrepancy between total Lexical Entries (569) and total Benchmark Items (564) arises from the German subset: 180 lexical entries but 175 benchmark items, indicating 5 German entries are not directly benchmarked.

### Experts (ABox)

| Identifier                    | Label                                         |
| ----------------------------- | --------------------------------------------- |
| `Expert_RoyalSociety_DE`      | Royal Society of Thailand — German Committee  |
| `Expert_RoyalSociety_FR`      | Royal Society of Thailand — French Committee  |
| `Expert_NECTEC_EN`            | NECTEC Natural Language Processing Team       |

### Rule Ambiguities (ABox)

| Identifier         | Scope   | Summary                                        |
| ------------------ | ------- | ---------------------------------------------- |
| `Ambiguity_EN_01`  | English | /k/ mapping: ค (rule-based) vs ก (conventional) |
| `Ambiguity_EN_05`  | English | Silent consonant retention policy              |
| `Ambiguity_EN_09`  | English | Diphthong /aɪ/ rendering variation             |
| `Ambiguity_EN_11`  | English | Short vowel glyph (ไม้ไต่คู้) usage            |
| `Ambiguity_FR_03`  | French  | Nasal consonant mapping in proper nouns        |
| `Ambiguity_FR_09`  | French  | Semi-vowel yod cluster patterns                |
| `Ambiguity_FR_13`  | French  | H muet vs h aspiré distinction                 |

### Expert Decisions (ABox)

| Identifier            | Scope   |
| --------------------- | ------- |
| `Decision_DE_17_Rad`  | German  |
| `Decision_DE_21`      | German  |
| `Decision_DE_25`      | German  |
| `Decision_DE_27_von`  | German  |
| `Decision_EN_01_k`    | English |
| `Decision_EN_05_silent` | English |
| `Decision_EN_09_diphthong` | English |
| `Decision_EN_11_maitaikhu` | English |
| `Decision_FR_03_nasal` | French |
| `Decision_FR_09_yod`  | French  |
| `Decision_FR_13_h`    | French  |

### Evaluation Results (ABox)

| Identifier             | Language | Accuracy Score | Notes                              |
| ---------------------- | -------- | -------------: | ---------------------------------- |
| `EvalResult_EN_2026`   | English  |        67.48%  | Word-level; NECTEC system; 220/326 items |

Total ABox EvaluationResult instances: **1**

The German evaluation result (`EvalResult_DE_2025`) is represented as a named individual in the ontology, not instantiated as an ABox EvaluationResult.

---

## Combined Graph Statistics

Combined graph produced by RDF graph union of `transonto.ttl` and `kg_all.ttl`.

### Triple Counts

| Item                      |   Count |
| ------------------------- | ------: |
| Ontology triples          |     887 |
| KG triples                |  12,899 |
| Raw sum                   |  13,786 |
| Duplicate triples removed |     135 |
| **Merged graph triples**  |**13,651** |

### Combined Individual Counts

| Item                | ABox (KG) | Combined |
| ------------------- | --------: | -------: |
| LexicalEntries      |       569 |      572 |
| ThaiForm instances  |       569 |      574 |
| Rule Ambiguities    |         7 |       14 |
| Expert Decisions    |        11 |       22 |
| Evaluation Results  |         1 |        3 |
| Rules               |        12 |       43 |

For all benchmark reporting and publication statistics, use the ABox (KG) counts above.

---

## Validation Summary

### Parse Validation

| File                    | Format  | Status |
| ----------------------- | ------- | ------ |
| `transonto.ttl` | Turtle  | PASS   |
| `transonto.owl` | RDF/XML | PASS   |
| `kg_all.ttl`      | Turtle  | PASS   |

### Consistency Checks

| Check                                  | Result |
| -------------------------------------- | ------ |
| TTL and OWL triple counts match        | PASS (887 = 887) |
| Ontology IRI consistent across formats | PASS   |
| Version IRI consistent across formats  | PASS   |
| hasGoldLabel triples match GoldLabel count | PASS (564 = 564) |
| LexicalEntry and ThaiForm counts equal | PASS (569 = 569) |

### Reproduction

```python
from rdflib import Graph

g = Graph()
g.parse("ontology/transonto.ttl", format="turtle")
g.parse("kg/kg_all.ttl", format="turtle")

print(len(g))  # Expected: 13651
```

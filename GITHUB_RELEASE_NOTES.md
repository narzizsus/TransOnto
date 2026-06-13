## TransOnto v1.0.0 + RoyalSocietyTransKG v1.0.0

**First public release** — 2026-06-13

---

### TransOnto v1.0

An OWL 2 ontology for representing prescriptive transliteration standards and their computational formalization.

- **IRI:** `https://w3id.org/transonto`
- **15 classes** · **18 object properties** · **19 data properties** · **59 named individuals**
- Four-layer architecture: Language Standards, Formalization, Lexicon, Evaluation
- Computational Readiness Level (CRL) framework (CRL-1 to CRL-5)
- Alignment with OntoLex-Lemon and PROV-O

### RoyalSocietyTransKG v1.0

| Component | Triples |
|---|---|
| Ontology (`transonto.ttl`) | 697 |
| Knowledge Graph (`kg_all.ttl`) | 12,899 |
| **Combined** | **13,591** |

| Item | Count |
|---|---|
| Lexical Entries | 572 (DE 183 · FR 92 · EN 297) |
| Benchmark Items | 564 |
| Rules + Additions | 57 (DE 31 · EN 12 · FR 14) |
| Rule Ambiguities | 12 |
| Expert Decisions | 12 |
| Evaluation Results | 2 (DE 92.68% · EN 67.48%) |

### Files

```
ontology/transonto.ttl   — OWL ontology (Turtle)
ontology/transonto.owl   — OWL ontology (RDF/XML)
kg/kg_de.ttl, kg_fr.ttl, kg_en.ttl, kg_all.ttl
sparql/ (UC1, UC3–UC8)
docs/competency_questions.md, crl_framework.md, kg_statistics.md
```

### Quick load

```python
from rdflib import Graph
g = Graph()
g.parse("ontology/transonto.ttl", format="turtle")
g.parse("kg/kg_all.ttl", format="turtle")
print(len(g))  # 13591
```

**License:** CC BY 4.0 · **Zenodo DOI:** [to be assigned]

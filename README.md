# TransOnto v1.0 + RoyalSocietyTransKG v1.0

**TransOnto** is an OWL 2 ontology for representing prescriptive transliteration standards and their computational formalization. **RoyalSocietyTransKG** is its instantiation as a knowledge graph, drawn from the Royal Society of Thailand's transliteration guidelines for German, French, and English.

> Associated paper: *TransOnto: An Ontology and Knowledge Graph for Formalizing Prescriptive Multilingual Transliteration Standards*, IJCKG 2026.

---

## Repository Structure

```
transonto/
├── ontology/
│   ├── transonto.ttl        # OWL ontology (Turtle)
│   └── transonto.owl        # OWL ontology (RDF/XML)
├── kg/
│   ├── kg_de.ttl            # German KG (4,109 triples)
│   ├── kg_fr.ttl            # French KG (2,073 triples)
│   ├── kg_en.ttl            # English KG (6,709 triples)
│   └── kg_all.ttl           # Merged KG  all languages (12,899 triples)
├── sparql/
│   ├── UC1_ambiguity.rq     # Ambiguity chains (CQ4)
│   ├── UC3_crl.rq           # CRL assessment (CQ8)
│   ├── UC4_explainability.rq# Provenance traversal (CQ9)
│   ├── UC5_coverage.rq      # Benchmark coverage (CQ10)
│   ├── UC6_errors.rq        # G2P-sensitive entries (CQ7)
│   ├── UC7_en_coverage.rq   # English rule distribution
│   └── UC8_fr_additions.rq  # French rule additions (CQ5)
├── docs/
│   ├── competency_questions.md
│   ├── crl_framework.md
│   └── kg_statistics.md
├── LICENSE                  # CC BY 4.0
├── README.md
└── CITATION.cff
```

---

## What is TransOnto?

TransOnto (`https://w3id.org/transonto`) is an OWL 2 ontology organized into four interconnected layers:

- **Layer 1  Language Standards:** official guideline rules and source-to-target unit mappings (`to:Language`, `to:Guideline`, `to:Rule`)
- **Layer 2  Formalization** *(novel contribution)*: expert knowledge absent from official documents  ambiguities, additions, and decisions made queryable (`to:RuleAmbiguity`, `to:RuleAddition`, `to:ExpertDecision`)
- **Layer 3  Lexicon:** validated transliteration entries with variant management (`to:LexicalEntry`, `to:ThaiForm`)
- **Layer 4  Evaluation:** benchmark items with gold labels and error attribution (`to:BenchmarkItem`, `to:GoldLabel`, `to:EvaluationResult`)

**Ontology statistics (transonto.ttl):**

| Item | Count |
| --- | --- |
| Classes | 15 |
| Object properties | 18 |
| Data properties | 19 |
| Named individuals | 59 |
| Schema triples (TBox, schema-only) | 285 |
| Total triples incl. individuals | 697 |

> The paper reports 285 TBox triples (schema definitions only, excluding named individuals). The complete `transonto.ttl` file contains 697 triples including 59 named individuals for languages, guidelines, rules, CRL levels, error types, and evaluation results.

Alignment: `to:LexicalEntry` ⊑ `ontolexLexicalEntry` · `to:ThaiForm` ⊑ `ontolexForm` · `to:Expert` ⊑ `provAgent`

---

## What is RoyalSocietyTransKG?

RoyalSocietyTransKG (ABox) instantiates TransOnto with benchmark and formalization data from the NECTEC Royal Society transliteration project. Load `transonto.ttl` + `kg_all.ttl` for a single queryable graph.

### Triple Counts

| Component | File | Triples |
| --- | --- | --- |
| Ontology (schema + individuals) | `transonto.ttl` | 697 |
| Knowledge Graph | `kg_all.ttl` | 12,899 |
| **Combined** | | **13,591** |

### Knowledge Graph Statistics (ABox  kg_all.ttl)

| Item | Count |
| --- | --- |
| Languages | 3 (German, French, English) |
| Rules (DE + EN) | 43 |
| Rule Additions (FR) | 14 |
| Rule Ambiguities | 7 |
| Expert Decisions | 11 |
| Lexical Entries | 569 |
| Benchmark Items | 564 |
| Gold Labels | 564 |
| Evaluation Results | 1 (EN: 67.48% word accuracy) |

### Language Coverage

| Language | Lexical Entries | Benchmark Items | Rules / Additions | System Accuracy |
| --- | --- | --- | --- | --- |
| German | 180 | 175 | Rule\_DE\_01-31 | 92.68% word documented in ontology named individual `EvalResult_DE_2025`; not instantiated as ABox `EvaluationResult` |
| French | 92 | 92 | Add\_FR\_01-14 |  |
| English | 297 | 297 | Rule\_EN\_01-12 | 67.48% word |

---

## Quick Start

### Load in Python (rdflib)

```python
from rdflib import Graph, Namespace, RDF

g = Graph()
g.parse("ontology/transonto.ttl", format="turtle")
g.parse("kg/kg_all.ttl",          format="turtle")

TO = Namespace("https://w3id.org/transonto#")
count = lambda cls: sum(1 for _ in g.subjects(RDF.type, TO[cls]))

print(f"Total triples:    {len(g)}")
print(f"Lexical Entries:  {count('LexicalEntry')}")
print(f"Benchmark Items:  {count('BenchmarkItem')}")
print(f"Languages:        {count('Language')}")
```

Expected:

```
Total triples:    13591
Lexical Entries:  569
Benchmark Items:  564
Languages:        3
```

### Load in Apache Jena

```bash
sparql --data ontology/transonto.ttl --data kg/kg_all.ttl \
       --query sparql/UC3_crl.rq
```

---

## Selected Competency Questions

TransOnto is designed around ten competency questions (CQ1-CQ10). The table below shows selected CQs with corresponding SPARQL files. The complete CQ catalogue is in `docs/competency_questions.md`.

| CQ | Question | SPARQL file |
| --- | --- | --- |
| CQ4 | Which rules have documented ambiguities? | UC1\_ambiguity.rq |
| CQ5 | How many expert additions does language L require? | UC8\_fr\_additions.rq |
| CQ7 | What is the error type distribution? | UC6\_errors.rq |
| CQ8 | What is the CRL of language L? | UC3\_crl.rq |
| CQ9 | Why is word W transliterated as T? | UC4\_explainability.rq |
| CQ10 | How many benchmark items cover rule R? | UC5\_coverage.rq |

---

## Sample SPARQL Queries

### CRL Assessment  UC3 (CQ8)

```sparql
PREFIX to:   <https://w3id.org/transonto#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?langLabel ?crlScore ?readinessScore ?crlEvidence WHERE {
  ?lang a to:Language ;
        rdfs:label ?langLabel ;
        to:hasReadinessLevel ?crl .
  ?crl  to:crlScore    ?crlScore ;
        to:readinessScore ?readinessScore ;
        to:crlEvidence ?crlEvidence .
  FILTER(lang(?langLabel) = "en")
}
ORDER BY ?crlScore
```

Expected result: EN=3 (CRL-3), DE=4 (CRL-4), FR=5 (CRL-5) with readiness scores 35/35/104.

CRL scale: **1=CRL-1 (directly executable), 5=CRL-5 (requires most expert intervention).**

### Explainability Path  UC4 (CQ9)

```sparql
PREFIX to: <https://w3id.org/transonto#>

SELECT ?sourceForm ?thaiScript ?isPreferred
       ?ruleNum ?ambiguityDescription ?decisionJustification
WHERE {
  ?entry a to:LexicalEntry ;
         to:sourceForm "Berg" ;
         to:hasThaiForm ?tf ;
         to:exemptifiesRule ?rule .
  ?tf   to:thaiScript ?thaiScript ;
        to:isPreferred ?isPreferred .
  ?rule to:ruleNumber ?ruleNum .
  OPTIONAL {
    ?rule to:hasAmbiguity ?amb .
    ?amb  to:ambiguityDescription ?ambiguityDescription .
    OPTIONAL {
      ?amb to:justifiedByDecision ?dec .
      ?dec to:decisionJustification ?decisionJustification .
    }
  }
}
ORDER BY DESC(?isPreferred)
```

### Benchmark Coverage  UC5 (CQ10)

```sparql
PREFIX to:   <https://w3id.org/transonto#>

SELECT ?ruleNum (COUNT(?bm) AS ?items) WHERE {
  ?rule a to:Rule ;
        to:ruleNumber ?ruleNum ;
        to:appliedToLanguage to:German .
  ?bm a to:BenchmarkItem ;
      to:evaluatesRule ?rule .
}
GROUP BY ?ruleNum
ORDER BY ?ruleNum
```

---

## Computational Readiness Level (CRL)

CRL is a 1-5 scale measuring how directly implementable a transliteration guideline is without expert supplementation. Each level is a named individual in TransOnto linked via `to:hasReadinessLevel`.

**Scoring formula:** `ReadinessScore = |Additions| + 2 × |Ambiguities| + |Decisions|`

| CRL | Score Range | Interpretation |
| --- | --- | --- |
| CRL-1 | 0 | Directly executable; no additions or ambiguities required |
| CRL-2 | 1-15 | Minor supplementation; edge cases only |
| CRL-3 | 16-40 | Moderate intervention; systematic but manageable gaps |
| CRL-4 | 41-70 | Substantial intervention; multiple ambiguous rules |
| CRL-5 | >70 | Extensive intervention; pervasive underspecification |

**Assignments for this release:**

| Language | ReadinessScore | CRL | Rationale |
| --- | --- | --- | --- |
| English | 35 | CRL-3 | Irregular orthography; G2P dependency; decisions are localized |
| German | 35 | CRL-4 | Two ambiguous rules with broad cross-item impact (expert upward adjustment) |
| French | 104 | CRL-5 | 14 expert additions required |

English and German share score 35 but differ in CRL because German's two ambiguities each affect broad vocabulary categories, generating systematic cross-item failures. See `docs/crl_framework.md`.

---

## Source Data

| Language | Source | Benchmark Size |
| --- | --- | --- |
| German | Royal Society DE Guideline (2025); Duden Band 6 IPA | 175 items |
| French | Royal Society FR Guideline (2025); Le Petit Robert 2006 | 92 items |
| English | Royal Society EN Guideline (1989/BE 2532); Cambridge Dictionary IPA | 297 items (326 test cases) |

---

## License

CC BY 4.0  see `LICENSE`.

---

## Citation

```bibtex
@inproceedings{transonto2026,
  title     = {TransOnto: An Ontology and Knowledge Graph for Formalizing
               Prescriptive Multilingual Transliteration Standards},
  booktitle = {Proceedings of the International Joint Conference on
               Knowledge Graphs (IJCKG 2026)},
  year      = {2026},
  note      = {DOI: [Zenodo, to be assigned upon acceptance]}
}
```

---

## Contact

Artificial Intelligence Research Team, NECTEC, NSTDA, Thailand.

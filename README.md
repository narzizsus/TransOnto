# TransOnto v1.0 and RoyalSocietyTransKG v1.0

**TransOnto** is an OWL 2 ontology for representing prescriptive transliteration standards and their computational formalization.

**RoyalSocietyTransKG** is a multilingual knowledge graph instantiated from TransOnto using the Royal Society of Thailand transliteration guidelines for German, French, and English.

> Associated paper: *TransOnto: An Ontology and Knowledge Graph for Formalizing Prescriptive Multilingual Transliteration Standards* (IJCKG 2026).

---

# Repository Structure

```text
transonto/
├── ontology/
│   ├── transonto.ttl
│   └── transonto.owl
├── kg/
│   ├── kg_de.ttl
│   ├── kg_fr.ttl
│   ├── kg_en.ttl
│   └── kg_all.ttl
├── sparql/
│   ├── UC1_ambiguity.rq
│   ├── UC3_crl.rq
│   ├── UC4_explainability.rq
│   ├── UC5_coverage.rq
│   ├── UC6_errors.rq
│   ├── UC7_en_coverage.rq
│   └── UC8_fr_additions.rq
├── docs/
│   ├── competency_questions.md
│   ├── crl_framework.md
│   └── kg_statistics.md
├── LICENSE
├── README.md
├── CHANGELOG.md
└── CITATION.cff
```

---

# What is TransOnto?

TransOnto (`https://w3id.org/transonto`) is an OWL 2 ontology organized into four interconnected layers.

## Layer 1: Language Standards

Represents official transliteration guidelines and formal rules.

Core classes:

* `to:Language`
* `to:Guideline`
* `to:Rule`

## Layer 2: Formalization

Captures expert knowledge that is not explicitly specified in guideline documents.

Core classes:

* `to:RuleAmbiguity`
* `to:RuleAddition`
* `to:ExpertDecision`

## Layer 3: Lexicon

Represents transliteration examples and lexical entries.

Core classes:

* `to:LexicalEntry`
* `to:ThaiForm`

## Layer 4: Evaluation

Represents benchmark datasets and evaluation results.

Core classes:

* `to:BenchmarkItem`
* `to:GoldLabel`
* `to:EvaluationResult`

---

# Ontology Statistics

Statistics derived directly from the current `transonto.ttl`.

| Item              | Count |
| ----------------- | ----: |
| Classes           |    15 |
| Object Properties |    18 |
| Data Properties   |    20 |
| Named Individuals |    98 |
| Total Triples     |   887 |

Alignment includes:

* OntoLex-Lemon
* PROV-O

Examples:

```text
to:LexicalEntry ⊑ ontolex:LexicalEntry
to:ThaiForm ⊑ ontolex:Form
to:Expert ⊑ prov:Agent
```

---

# What is RoyalSocietyTransKG?

RoyalSocietyTransKG is the ABox instantiation of TransOnto.

It contains benchmark data, transliteration examples, ambiguities, expert decisions, and evaluation metadata derived from Royal Society transliteration standards.

---

# Triple Counts

| Component                      | Triples |
| ------------------------------ | ------: |
| Ontology (`transonto.ttl`)     |     887 |
| Knowledge Graph (`kg_all.ttl`) |  12,899 |
| Combined Graph                 |  13,677 |

The combined graph count is computed after RDF graph merging and duplicate triple elimination.

---

# Knowledge Graph Statistics (ABox Authoritative Counts)

The following statistics use `kg_all.ttl` as the authoritative source.

| Item                | Count |
| ------------------- | ----: |
| Languages           |     3 |
| Lexical Entries     |   569 |
| Benchmark Items     |   564 |
| Gold Labels         |   564 |
| Rules (DE + EN)     |    43 |
| Rule Additions (FR) |    14 |
| Rule Ambiguities    |     7 |
| Expert Decisions    |    11 |
| Evaluation Results  |     1 |

---

# Language Coverage

| Language | Lexical Entries | Benchmark Items | Rules/Additions |
| -------- | --------------: | --------------: | --------------- |
| German   |             180 |             175 | Rule_DE_01–31   |
| French   |              92 |              92 | Add_FR_01–14    |
| English  |             297 |             297 | Rule_EN_01–12   |

---

# Evaluation Results

## English

* Word-level accuracy: 67.48%

Represented as an ABox `EvaluationResult` instance.

## German

* Word-level accuracy: 92.68%
* Syllable-level accuracy: 97.35%

Documented in ontology individual:

```text
EvalResult_DE_2025
```

German evaluation is not instantiated as an ABox `EvaluationResult`.

---

# Computational Readiness Level (CRL)

CRL measures how readily a transliteration guideline can be transformed into an executable computational system.

Formula:

```text
ReadinessScore = |Additions| + 2×|Ambiguities| + |Decisions|
```

## CRL Assignments

| Language | ReadinessScore | Final CRL |
| -------- | -------------: | --------- |
| English  |             35 | CRL-3     |
| German   |             35 | CRL-4     |
| French   |            104 | CRL-5     |

CRL Scale:

| Level | Interpretation           |
| ----- | ------------------------ |
| CRL-1 | Directly executable      |
| CRL-2 | Minor supplementation    |
| CRL-3 | Moderate intervention    |
| CRL-4 | Substantial intervention |
| CRL-5 | Extensive intervention   |

---

# Competency Questions

The ontology is designed around ten competency questions (CQ1–CQ10).

Examples include:

* Which rules apply to a language?
* Which rules contain ambiguities?
* Why was a word transliterated in a particular way?
* How many benchmark items cover a rule?
* What is the CRL of a language?

See:

```text
docs/competency_questions.md
```

for the complete list.

---

# Quick Start

## Python (rdflib)

```python
from rdflib import Graph

g = Graph()
g.parse("ontology/transonto.ttl", format="turtle")
g.parse("kg/kg_all.ttl", format="turtle")

print(len(g))
```

Expected output:

```text
13677
```

## Apache Jena

```bash
sparql \
  --data ontology/transonto.ttl \
  --data kg/kg_all.ttl \
  --query sparql/UC3_crl.rq
```

---

# License

CC BY 4.0

See `LICENSE`.

---

# Citation

```bibtex
@inproceedings{transonto2026,
  title={TransOnto: An Ontology and Knowledge Graph for Formalizing Prescriptive Multilingual Transliteration Standards},
  booktitle={Proceedings of the International Joint Conference on Knowledge Graphs},
  year={2026}
}
```

---

# Contact

Artificial Intelligence Research Team
NECTEC, NSTDA, Thailand

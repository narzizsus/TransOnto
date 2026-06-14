# Changelog

All notable changes to TransOnto and RoyalSocietyTransKG are documented in this file.

The format follows Keep a Changelog and Semantic Versioning.

---

# [1.0.0] - 2026-06-13

First public release.

---

## Added - TransOnto v1.0

### Ontology

* OWL 2 ontology published under IRI `https://w3id.org/transonto`
* Available in Turtle (`transonto.ttl`) and RDF/XML (`transonto.owl`)
* Four-layer architecture:

  * Language Standards
  * Formalization
  * Lexicon
  * Evaluation

### Ontology Statistics

* 15 classes
* 18 object properties
* 20 data properties
* 98 named individuals
* 887 ontology triples

### Formalization Layer

Introduced explicit modelling of expert knowledge absent from guideline documents:

* `to:RuleAmbiguity`
* `to:RuleAddition`
* `to:ExpertDecision`

This layer enables computational representation of ambiguity resolution and expert intervention.

### Computational Readiness Level (CRL)

Added Computational Readiness Level framework:

* CRL-1 = directly executable
* CRL-2 = minor supplementation
* CRL-3 = moderate intervention
* CRL-4 = substantial intervention
* CRL-5 = extensive intervention

Added ontology support for:

* `to:ComputationalReadinessLevel`
* `to:readinessScore`
* `to:crlScore`
* `to:crlEvidence`

### Ontology Alignment

Added interoperability mappings with:

* OntoLex-Lemon
* PROV-O

Including:

```text
to:LexicalEntry ⊑ ontolex:LexicalEntry
to:ThaiForm ⊑ ontolex:Form
to:Expert ⊑ prov:Agent
```

---

## Added - RoyalSocietyTransKG v1.0

### Knowledge Graph

Released multilingual transliteration knowledge graph derived from Royal Society transliteration standards.

Files:

* `kg_de.ttl`
* `kg_fr.ttl`
* `kg_en.ttl`
* `kg_all.ttl`

### Triple Counts

| Resource                       | Triples |
| ------------------------------ | ------: |
| Ontology (`transonto.ttl`)     |     887 |
| Knowledge Graph (`kg_all.ttl`) |  12,899 |
| Combined Graph                 |  13,677 |

Combined graph count is computed after RDF graph merging and duplicate triple elimination.

### ABox Statistics

Authoritative benchmark statistics derived from `kg_all.ttl`.

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

### Language Coverage

#### German

* 180 lexical entries
* 175 benchmark items
* Rule_DE_01–31
* 92.68% word-level accuracy
* 97.35% syllable-level accuracy

#### French

* 92 lexical entries
* 92 benchmark items
* Add_FR_01–14
* Benchmark available
* System evaluation pending

#### English

* 297 lexical entries
* 297 benchmark items
* Rule_EN_01–12
* 67.48% word-level accuracy

### Evaluation Results

ABox evaluation results:

* English: 67.48% word-level accuracy

Ontology-documented evaluation results:

* German: 92.68% word-level accuracy
* German: 97.35% syllable-level accuracy

German evaluation is represented by ontology individual `EvalResult_DE_2025` and is not instantiated as an ABox `EvaluationResult`.

---

## Added - SPARQL Query Layer

Released competency-question-driven SPARQL query package.

### Included Queries

| Query                 | Purpose               |
| --------------------- | --------------------- |
| UC1_ambiguity.rq      | Ambiguity analysis    |
| UC3_crl.rq            | CRL assessment        |
| UC4_explainability.rq | Explainability path   |
| UC5_coverage.rq       | Benchmark coverage    |
| UC6_errors.rq         | Error analysis        |
| UC7_en_coverage.rq    | English rule coverage |
| UC8_fr_additions.rq   | French additions      |

### Validation

Phase 3 validation completed successfully.

| Query                 | Status |
| --------------------- | ------ |
| UC4_explainability.rq | PASS   |
| UC3_crl.rq            | PASS   |
| UC5_coverage.rq       | PASS   |
| UC6_errors.rq         | PASS   |

---

## Added - Documentation

Released accompanying documentation:

* `README.md`
* `docs/competency_questions.md`
* `docs/crl_framework.md`
* `docs/kg_statistics.md`
* `CITATION.cff`
* `LICENSE`

### Competency Questions

Ten competency questions (CQ1–CQ10) documented and mapped to ontology constructs and SPARQL implementations.

### Statistics Documentation

Added graph-derived statistical reporting with explicit distinction between:

* Ontology statistics
* ABox statistics
* Combined graph statistics

---

## License

Released under CC BY 4.0.

---

# Future Releases

Planned for v1.1 and later:

* Indonesian transliteration module
* Malay transliteration module
* Japanese transliteration module
* Chinese transliteration module
* SHACL validation shapes
* Compliance checking toolkit
* Widoco-generated ontology documentation
* Additional benchmark datasets
* Expanded evaluation framework

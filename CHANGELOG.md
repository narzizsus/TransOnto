# Changelog

All notable changes to TransOnto and RoyalSocietyTransKG are documented here.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versioning follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0]  2026-06-13

**First public release.**

### Added  TransOnto v1.0

- OWL 2 ontology (`transonto.ttl`, `transonto.owl`) with IRI `https://w3id.org/transonto`
- Four-layer architecture: Language Standards, Formalization, Lexicon, Evaluation
- 15 classes, 18 object properties, 19 data properties, 59 named individuals
- Computational Readiness Level (CRL) framework (CRL-1 to CRL-5, paper-standard scale: 1=CRL-1 executable, 5=CRL-5 most expert intervention)
- Alignment declarations: `ontolexLexicalEntry`, `ontolexForm`, `provAgent`
- `to:readinessScore` datatype property for formula-derived scores

### Added  RoyalSocietyTransKG v1.0

- German KG (`kg_de.ttl`): 180 lexical entries, 175 benchmark items, Rule_DE_01-31
- French KG (`kg_fr.ttl`): 92 lexical entries, 92 benchmark items, Add_FR_01-14
- English KG (`kg_en.ttl`): 297 lexical entries, 297 benchmark items, Rule_EN_01-12
- Merged KG (`kg_all.ttl`): 12,899 triples (combined with ontology: 13,591)
- 7 RuleAmbiguity instances across all languages (ABox count)
- 11 ExpertDecision instances with full `decisionJustification` literals (ABox count)
- 1 EvaluationResult instance in ABox (EN: 67.48% word accuracy); German system accuracy (92.68%) is documented in ontology named individual `EvalResult_DE_2025` and is not instantiated as an ABox `EvaluationResult`

### Added  SPARQL Query Layer

- 7 use-case queries (UC1, UC3-UC8) validated against merged graph
- Phase 3 validation report: all four demo queries PASS (2026-06-13)

### Added  Documentation

- `README.md`, `docs/competency_questions.md` (CQ1-CQ10), `docs/crl_framework.md`
- `docs/kg_statistics.md`  statistics derived from graph; ABox-authoritative counts use kg_all.ttl only
- `CITATION.cff`, `LICENSE` (CC BY 4.0)

---

## Future Releases

Planned for v1.1+:

- ABox extension for Indonesian, Malay, Japanese, Chinese
- SHACL constraint shapes for KG validation
- SPARQL-based compliance checking tools
- Widoco-generated HTML ontology documentation

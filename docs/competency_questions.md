# Competency Questions — TransOnto v1.0

This document maps each competency question (CQ) to the ontology constructs and SPARQL query that answers it.

---

## Design Competency Questions

### CQ1: Which rules apply to language L?

**Query:** UC1_ambiguity.rq (filtered by language)

```sparql
SELECT ?ruleNum ?ruleLabel WHERE {
  ?rule a to:Rule ;
        to:ruleNumber ?ruleNum ;
        rdfs:label ?ruleLabel ;
        to:appliedToLanguage to:German .
  FILTER(lang(?ruleLabel) = "en")
}
ORDER BY ?ruleNum
```

Expected: 31 rules for German (Rule_DE_01–31), 12 for English (Rule_EN_01–12), 14 additions for French (Add_FR_01–14).

---

### CQ2: What ambiguities exist in rule R?

```sparql
SELECT ?ruleNum ?ambiguityDescription WHERE {
  ?rule to:ruleNumber ?ruleNum ;
        to:hasAmbiguity ?amb .
  ?amb  to:ambiguityDescription ?ambiguityDescription .
  FILTER(?ruleNum = 7)
}
```

Expected: Returns ambiguity description for DE Rule 7 (r-coloring).

---

### CQ3: What is the CRL of language L?

**Query:** UC3_crl.rq

Returns CRL score and evidence string. Expected: DE=3, FR=3, EN=2.

---

### CQ4: What is the accuracy of the evaluation system for language L?

```sparql
SELECT ?langCode ?wordAccuracy WHERE {
  ?lang to:languageCode ?langCode ;
        to:hasGuideline ?guide .
  ?guide to:producedEvaluationResult ?result .
  ?result to:accuracyScore ?wordAccuracy .
}
```

Expected: de=0.9268, en=0.6748.

---

### CQ5: How does German Rule R map grapheme G to Thai?

```sparql
SELECT ?ruleText ?sourceGrapheme ?targetGrapheme WHERE {
  ?rule to:ruleNumber 7 ;
        to:ruleText ?ruleText .
  OPTIONAL { ?rule to:sourceGrapheme ?sourceGrapheme }
  OPTIONAL { ?rule to:targetGrapheme ?targetGrapheme }
}
```

---

### CQ6: What Thai forms exist for source word W?

```sparql
SELECT ?thaiScript ?isPreferred WHERE {
  ?entry to:sourceForm "Müller" ;
         to:hasThaiForm ?tf .
  ?tf to:thaiScript ?thaiScript ;
      to:isPreferred ?isPreferred .
}
ORDER BY DESC(?isPreferred)
```

Expected: มึลเลอร์ (preferred=true), มุลเลอร์ (preferred=false).

---

### CQ7: Which words in language L exemplify rule R?

```sparql
SELECT ?sourceForm ?thaiScript WHERE {
  ?entry to:exemplifiesRule to:Rule_DE_07 ;
         to:sourceForm ?sourceForm ;
         to:hasThaiForm ?tf .
  ?tf to:thaiScript ?thaiScript ;
      to:isPreferred "true"^^xsd:boolean .
}
```

---

### CQ8: Which expert decisions exist, and who made them?

```sparql
SELECT ?justification ?expertLabel WHERE {
  ?dec a to:ExpertDecision ;
       to:decisionJustification ?justification ;
       to:madeByExpert ?expert .
  ?expert rdfs:label ?expertLabel .
  FILTER(lang(?expertLabel) = "en")
}
```

---

### CQ9: Why is word W transliterated as T?

**Query:** UC4_explainability.rq

Full path: LexicalEntry → ThaiForm → Rule → RuleAmbiguity → ExpertDecision.

Validated result for "Berg": 2 rows (preferred + non-preferred), rule 7 with ambiguity and decision.

---

### CQ10: How many benchmark items cover rule R?

**Query:** UC5_coverage.rq

Returns count per rule. German: 31 rules × 1–20 items.

---

### CQ11: Which entries are sensitive to G2P errors?

**Query:** UC6_errors.rq

Returns entries with `to:hasAmbiguity` links, cross-referenced to error-prone phenomena.

---

## Query Validation Results (Phase 3)

All four demo queries validated against merged DE graph (4,801 triples):

| Query | Status | Rows |
|---|---|---|
| UC4_explainability.rq | PASS | 2 |
| UC3_crl.rq | PASS | 3 |
| UC5_coverage.rq | PASS | 31 |
| UC6_errors.rq | PASS | 30 |

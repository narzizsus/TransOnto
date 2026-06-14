# Competency Questions  TransOnto v1.0

This document maps each competency question (CQ1-CQ10) to the ontology constructs and SPARQL query that answers it.

---

## CQ1: Which rules apply to language L?

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

Expected: 31 rules for German (Rule_DE_01-31), 12 for English (Rule_EN_01-12), 14 additions for French (Add_FR_01-14).

---

## CQ2: What is the Thai transliteration of source word W?

```sparql
SELECT ?thaiScript ?isPreferred WHERE {
  ?entry to:sourceForm "Mueller" ;
         to:hasThaiForm ?tf .
  ?tf to:thaiScript ?thaiScript ;
      to:isPreferred ?isPreferred .
}
ORDER BY DESC(?isPreferred)
```

Expected: มุลเลอร์ (preferred=true), มุลเลอร์ (preferred=false).

---

## CQ3: What lexical examples exist for rule R in language L?

```sparql
SELECT ?sourceForm ?thaiScript WHERE {
  ?entry to:exemptifiesRule to:Rule_DE_07 ;
         to:sourceForm ?sourceForm ;
         to:hasThaiForm ?tf .
  ?tf to:thaiScript ?thaiScript ;
      to:isPreferred "true"^^xsd:boolean .
}
```

---

## CQ4: Which rules have documented ambiguities?

**Query:** UC1_ambiguity.rq

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

## CQ5: How many expert additions does language L require?

**Query:** UC8_fr_additions.rq

```sparql
SELECT (COUNT(?add) AS ?count) WHERE {
  ?add a to:RuleAddition ;
       to:appliedToLanguage to:French .
}
```

Expected: 14 for French.

---

## CQ6: What is the accuracy of the evaluation system for language L?

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

## CQ7: What is the error type distribution?

**Query:** UC6_errors.rq

Returns entries with `to:hasAmbiguity` links, cross-referenced to error-prone phenomena.

---

## CQ8: What is the CRL of language L?

**Query:** UC3_crl.rq

Returns CRL score (1-5), readiness score, and evidence string.

**Expected results (paper-standard scale: 1=CRL-1 executable, 5=CRL-5 most intervention):**

| Language | crlScore (ontology) | readinessScore | Final CRL |
|---|---|---|---|
| English | 3 | 35 | CRL-3 |
| German | 4 | 35 | CRL-4 |
| French | 5 | 104 | CRL-5 |

---

## CQ9: Why is word W transliterated as T?

**Query:** UC4_explainability.rq

Full path: LexicalEntry -> ThaiForm -> Rule -> RuleAmbiguity -> ExpertDecision.

Validated result for "Berg": 2 rows (preferred + non-preferred), rule 7 with ambiguity and decision.

---

## CQ10: How many benchmark items cover rule R?

**Query:** UC5_coverage.rq

Returns count per rule. German: 31 rules × 1-20 items.

---

## Query Validation Results (Phase 3)

All four demo queries validated against merged DE graph (4,801 triples):

| Query | Status | Rows |
|---|---|---|
| UC4_explainability.rq | PASS | 2 |
| UC3_crl.rq | PASS | 3 |
| UC5_coverage.rq | PASS | 31 |
| UC6_errors.rq | PASS | 30 |

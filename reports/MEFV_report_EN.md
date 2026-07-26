# MEFV Variant Analysis Report

**Sample:** SRR31325587
**Technology:** Oxford Nanopore (ONT), long-read
**Reference:** GRCh38 (hg38)
**Report date:** 2026-07-26

---

## 1. Summary

Nanopore sequencing data from sample SRR31325587 was processed through a
MEFV-focused variant analysis workflow. Reads were aligned to the GRCh38
reference genome, followed by variant calling and functional annotation.

A c.715C>T (p.Arg239*) change introducing a premature termination codon
was identified in MEFV at chr16:3254353. The variant is heterozygous and
supported by 88X read depth.

Although this is a high-impact nonsense change, loss of function is not
an established disease mechanism for MEFV. The variant is therefore
classified as a **variant of uncertain significance (VUS)**.

---

## 2. Methods

| Step | Tool | Version |
|---|---|---|
| Data retrieval | SRA Toolkit (prefetch, fasterq-dump) | — |
| Quality control | NanoPlot | 1.47.1 |
| Alignment | minimap2 (-ax map-ont) | 2.30-r1287 |
| BAM processing | samtools | 1.23.1 |
| Variant calling | Longshot | 0.4.3 |
| Filtering | bcftools | 1.23.1 |
| Annotation | snpEff (database GRCh38.99) | 5.3a |
| Visualization | IGV | — |

Variant files were processed in the following order: raw Longshot output
(`SRR31325587.vcf`) → chromosome naming adjusted (`.chr.vcf`) → snpEff
input (`.hg38.vcf`) → final annotated file (`.ann.vcf`). Findings in this
report are based on the annotated file.

---

## 3. Finding

| Field | Value |
|---|---|
| Gene | MEFV |
| Genomic position | chr16:3254353 (GRCh38) |
| Genomic change | G>A |
| Coding | c.715C>T |
| Protein | p.Arg239* |
| Variant type | stop_gained |
| snpEff impact | HIGH |
| Genotype | Heterozygous (0/1) |
| Read depth | 88X |
| Alternate allele fraction | [add VAF from VCF] |

MEFV lies on the minus strand, so the genomic G>A change corresponds to
C>T at the coding level, converting the arginine codon at position 239
(CGA) into a stop codon (TGA).

The variant was inspected in IGV; the alignment snapshot is provided in
`figures/igv_snapshotMEVF16.png`.

---

## 4. Interpretation

The identified change is a nonsense variant truncating the pyrin protein
from residue 239 onward. As it lies in exon 2, well upstream of the final
exon-exon junction, the transcript is predicted to undergo nonsense-
mediated decay (NMD), with no protein expected from the affected allele.

This observation does not by itself imply pathogenicity. The established
disease mechanism for MEFV-related Familial Mediterranean Fever (FMF) is
not loss of function; known pathogenic variants are predominantly
missense changes in exon 10 that lead to pyrin hyperactivation (M694V,
V726A, M680I). Truncating variants have not been established as a cause
of the FMF phenotype.

Accordingly, the ACMG/AMP PVS1 criterion was not applied, as it requires
loss of function to be a known disease mechanism for the gene in
question.

FMF is also predominantly autosomal recessive. A single heterozygous
allele is not diagnostic in the absence of clinical findings and a second
pathogenic allele.

**Classification: Variant of uncertain significance (VUS)**

---

## 5. Limitations

- Targeted analysis of a single sample.
- The variant call was not confirmed by an orthogonal method (Sanger
  sequencing).
- Single-nucleotide changes in Nanopore data, particularly within
  homopolymer regions, require careful evaluation.
- gnomAD population frequency and ClinVar/INFEVERS records were not
  queried in this study.
- No family segregation analysis was performed.

---

## 6. Suggested Next Steps

1. Sanger confirmation of the variant
2. gnomAD allele frequency lookup
3. ClinVar and INFEVERS database search
4. Screening of MEFV exon 10 for common pathogenic variants
5. Family segregation analysis if clinical findings are present

---

## 7. Scope

This work is for educational and research purposes. It is not intended
for clinical diagnosis, screening, or treatment decisions. Clinical
interpretation should be performed by a medical genetics specialist.

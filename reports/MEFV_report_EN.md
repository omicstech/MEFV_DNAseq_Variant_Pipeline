# MEFV Variant Analysis Report

**Sample:** SRR31325587
**Technology:** Oxford Nanopore (ONT), long-read
**Reference:** GRCh38 (hg38)
**Report date:** 2026-07-26

---

## 1. Summary

The Nanopore sequencing data of sample SRR31325587 was processed through a
variant analysis workflow focused on the MEFV gene. Reads were aligned to the
GRCh38 reference genome, followed by variant calling and functional
annotation.

A c.715C>T (p.Arg239*) change, which creates a premature stop codon at the
protein level, was identified in the MEFV gene at chr16:3254353. The variant
is heterozygous and is supported by 88X read depth.

Although this is a high-impact nonsense variant, loss of function is not the
established disease mechanism for MEFV, so it was classified as a
**variant of uncertain significance (VUS)**.

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

The variant files were processed in the following order: raw Longshot output
(`SRR31325587.vcf`) → intermediate version with only the chr16 chromosome name
changed (`.chr.vcf`) → snpEff input with all chromosome names converted to
Ensembl format (`.hg38.vcf`) → final annotated file (`.ann.vcf`). The findings
in this report are based on the `.ann.vcf` file.

---

## 3. Finding

| Field | Value |
|---|---|
| Gene | MEFV (ENSG00000103313) |
| Transcript | ENST00000219596.5 (Ensembl 99, protein_coding) |
| Genomic position | chr16:3254353 (GRCh38) |
| Genomic change | G>A |
| Coding change | c.715C>T |
| Protein change | p.Arg239* (codon 239 of a 781 aa protein) |
| Exon | 2/10 |
| Variant type | stop_gained |
| snpEff impact class | HIGH |
| Genotype | Heterozygous (0/1) |
| Read depth | 88X |
| Allele depth | AD 51,26 (reference, alternate) |
| Alternate allele fraction | 0.34 |
| Genotype quality | GQ 70 |
| Variant quality | QUAL 70.0 (PASS) |

Because the MEFV gene is located on the minus strand, the G>A change at the
genomic level corresponds to C>T in the coding sequence. This change converts
the arginine codon (CGA) at codon 239 into a stop codon (TGA).

The variant was inspected visually in IGV; the alignment view is provided in
`figures/igv_snapshotMEVF16.png`.

---

## 4. Call Quality Assessment

Although the variant passed the PASS filter, the evidence supporting the call
is limited and should be evaluated carefully.

**Observations that increase uncertainty:**

- The alternate allele fraction is 0.34, below the ~0.50 expected for a
  heterozygous call.
- Of the 88 reads in total, 77 were assigned to an allele and 11 remained
  ambiguous (AM=11).
- The mean quality of reads supporting the alternate allele is low
  (AQ=12.25).
- Mismatch rates in the region are high (MF=0.221; MB=0.227).

**Observations that support the call:**

- Mapping quality is perfect at all thresholds (MQ10–MQ50 = 1.00).
- The sequence context (CTTCTAGGTC[G]CATCTTTCCC) contains no homopolymer;
  therefore the variant does not fall on the most common error type of
  Nanopore data.

Taken together, validation of the variant by an orthogonal method is not a
recommendation but a requirement.

---

## 5. Interpretation

The identified change is a nonsense variant that truncates the pyrin protein
from amino acid 239 onward. Because the variant lies in exon 2, well upstream
of the last exon-exon junction, the transcript is expected to undergo
nonsense-mediated decay (NMD). The expected outcome is that no protein is
produced from the affected allele.

The LOF and NMD tags of snpEff report that only one of the 14 transcripts
defined for the gene (7%) is affected by this variant; in the remaining
transcripts the change falls in an intronic region. This is an additional
source of uncertainty that limits the overall effect of the variant on the
gene product.

However, it must be emphasized that these observations do not directly imply
pathogenicity. In Familial Mediterranean Fever (FMF), which is associated with
MEFV, loss of function is not the established disease mechanism; the known
pathogenic variants are predominantly missense changes located mainly in exon
10 that lead to overactivation of the pyrin protein (M694V, V726A, M680I). The
association of truncating variants with the FMF phenotype is not established.

For this reason, the ACMG/AMP criterion PVS1 was not applied; this criterion
requires that loss of function be the known disease mechanism for the gene in
question.

In addition, FMF mostly shows autosomal recessive inheritance. The presence of
a single heterozygous allele is not diagnostic without clinical findings and a
second pathogenic allele.

**Classification: Variant of uncertain significance (VUS)**

---

## 6. Limitations

- The analysis is a targeted study performed on a single sample.
- The variant call has not been validated by an orthogonal method (Sanger
  sequencing).
- The alternate allele fraction is below the expected heterozygous range.
- Single nucleotide changes in Nanopore data should be evaluated carefully.
- The gnomAD population frequency and ClinVar/INFEVERS records were not
  queried within the scope of this study.
- Family segregation analysis was not performed.

---

## 7. Recommended Next Steps

1. Validation of the variant by Sanger sequencing
2. Querying the gnomAD allele frequency
3. Searching for records in the ClinVar and INFEVERS databases
4. Examination of MEFV exon 10 for common pathogenic variants
5. Family segregation analysis if clinical findings are present

---

## 8. Scope Note

This study is for educational and research purposes. It cannot be used for
clinical diagnosis, screening, or treatment decisions. Clinical evaluation
must be performed by a medical geneticist.


# MEFV_DNAseq_Variant_Pipeline

## Project Overview

This project presents an end-to-end DNA sequencing (DNA-Seq) variant analysis workflow using the MEFV dataset. The pipeline includes quality control, reference-based alignment, variant calling, annotation, and visualization of genomic variants.

## Objectives

* Process raw sequencing data.
* Identify genomic variants in the MEFV gene.
* Annotate and interpret detected variants.
* Visualize variants using IGV.
* Build a reproducible bioinformatics workflow.

## Pipeline

1. Data acquisition
2. Quality control (FastQC, MultiQC)
3. Reference genome preparation (hg38)
4. Read alignment (BWA-MEM)
5. BAM processing (samtools)
6. Variant calling
7. Variant annotation (snpEff)
8. Visualization (IGV)

## Key Result

A high-impact stop-gained variant was identified in the MEFV gene:

* Chromosome: chr16
* Position: 3254353
* Reference allele: G
* Alternative allele: A
* Protein effect: p.Arg239*
* Impact: HIGH (stop_gained)

## Directory Structure

* raw_fastq/
* reference/
* qc/
* alignment/
* variants/
* annotation/
* figures/
* reports/
* scripts/

## Tools Used

* FastQC
* MultiQC
* BWA-MEM
* samtools
* snpEff
* IGV
* Git
* GitHub

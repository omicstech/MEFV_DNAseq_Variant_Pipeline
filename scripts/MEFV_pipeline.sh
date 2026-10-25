#!/usr/bin/env bash
set -euo pipefail   # bir komut hata verirse script durur

SRR=SRR31325587
THREADS=4
REF=reference/hg38.fa

mkdir -p raw_fastq alignment qc/nanoplot variants

# 1. Veri çekme
if [ ! -s raw_fastq/$SRR.fastq ]; then
  prefetch $SRR -O raw_fastq
  fasterq-dump raw_fastq/$SRR -O raw_fastq
fi

# 2. Kalite kontrol
NanoPlot --fastq raw_fastq/$SRR.fastq -t $THREADS -o qc/nanoplot

# 3. Hizalama (Nanopore için map-ont ayarı)
# Not: ilk analizde hazır hg38.mmi indeksi kullanıldı; burada hg38.fa kullanılıyor, okuma kayıtları birebir aynı çıktı.
minimap2 -ax map-ont -t $THREADS $REF raw_fastq/$SRR.fastq > alignment/$SRR.sam

# 4. BAM işlemleri
samtools view -b -@ $THREADS alignment/$SRR.sam > alignment/$SRR.bam
samtools sort -@ $THREADS alignment/$SRR.bam -o alignment/$SRR.sorted.bam
samtools index alignment/$SRR.sorted.bam

# 5. Varyant çağırma (rapordaki sonuçlar Longshot 0.4.3 ile üretildi)
longshot --bam alignment/$SRR.sorted.bam --ref $REF --out variants/$SRR.vcf

# 5b. Sadece chr16 adı değiştirilmiş ara sürüm (CM000678.2 -> 16)
grep "CM000678.2" scripts/chr_map.txt > /tmp/chr16_map.txt
awk -F'\t' -v OFS='\t' '
  NR==FNR { split($0,a," "); m[a[1]]=a[2]; next }
  /^#/    { print; next }
          { if ($1 in m) $1=m[$1]; print }
' /tmp/chr16_map.txt variants/$SRR.vcf > variants/$SRR.chr.vcf

# 6. Kromozom adlarını assembly biçiminden Ensembl biçimine çevirme (CM000678.2 -> 16)
awk -F'\t' -v OFS='\t' '
  NR==FNR { split($0,a," "); m[a[1]]=a[2]; next }
  /^#/    { print; next }
          { $1=m[$1]; print }
' scripts/chr_map.txt variants/$SRR.vcf > variants/$SRR.hg38.vcf

# 7. Anotasyon (snpEff ayrıca snpEff_summary.html ve snpEff_genes.txt üretir)
(cd variants && snpEff GRCh38.99 $SRR.hg38.vcf > $SRR.ann.vcf)
MEFV (SRR31325587) Nanopore Pipeline

1. Veri çekme
   prefetch SRR31325587
   fasterq-dump SRR31325587

2. Kalite kontrol
   NanoPlot

3. Referans genom hazırlama
   hg38 indir
   minimap2 index oluştur (gerekirse)

4. Hizalama (Alignment)
   minimap2

5. BAM işlemleri
   samtools view
   samtools sort
   samtools index

6. Varyant çağırma
   Longshot veya Clair3

7. VCF inceleme
   bcftools view
   bcftools filter

8. Klinik yorumlama
   ClinVar
   MEFV varyantları:
   - M694V
   - V726A
   - M680I
   - R202Q
   - E148Q

9. Sonuçların kaydedilmesi
   results/

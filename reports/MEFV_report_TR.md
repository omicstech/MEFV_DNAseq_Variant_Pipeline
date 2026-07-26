# MEFV Varyant Analizi Raporu

**Örnek:** SRR31325587
**Teknoloji:** Oxford Nanopore (ONT), uzun okuma
**Referans:** GRCh38 (hg38)
**Rapor tarihi:** 2026-07-26

---

## 1. Özet

SRR31325587 örneğine ait Nanopore dizileme verisi, MEFV geni odaklı bir
varyant analizi iş akışından geçirilmiştir. Okumalar GRCh38 referans
genomuna hizalanmış, varyant çağırma ve fonksiyonel anotasyon
gerçekleştirilmiştir.

MEFV geninde chr16:3254353 konumunda, protein düzeyinde erken sonlanma
kodonu oluşturan c.715C>T (p.Arg239*) değişimi saptanmıştır. Varyant
heterozigot durumda ve 88X okuma derinliği ile desteklenmektedir.

Değişim yüksek etkili bir anlamsız (nonsense) varyant olmakla birlikte,
MEFV için yerleşik hastalık mekanizması fonksiyon kaybı olmadığından
**belirsiz öneme sahip varyant (VUS)** olarak sınıflandırılmıştır.

---

## 2. Yöntem

| Adım | Araç | Sürüm |
|---|---|---|
| Veri çekme | SRA Toolkit (prefetch, fasterq-dump) | — |
| Kalite kontrol | NanoPlot | 1.47.1 |
| Hizalama | minimap2 (-ax map-ont) | 2.30-r1287 |
| BAM işleme | samtools | 1.23.1 |
| Varyant çağırma | Longshot | 0.4.3 |
| Filtreleme | bcftools | 1.23.1 |
| Anotasyon | snpEff (veritabanı GRCh38.99) | 5.3a |
| Görselleştirme | IGV | — |

Varyant dosyaları şu sırayla işlenmiştir: Longshot ham çıktısı
(`SRR31325587.vcf`) → kromozom isimlendirmesi düzenlenmiş sürüm
(`.chr.vcf`) → snpEff girdisi (`.hg38.vcf`) → anote edilmiş nihai dosya
(`.ann.vcf`). Rapordaki bulgular `.ann.vcf` dosyasına dayanmaktadır.

---

## 3. Bulgu

| Alan | Değer |
|---|---|
| Gen | MEFV |
| Genomik konum | chr16:3254353 (GRCh38) |
| Genomik değişim | G>A |
| Kodlama düzeyi | c.715C>T |
| Protein düzeyi | p.Arg239* |
| Varyant tipi | stop_gained |
| snpEff etki sınıfı | HIGH |
| Genotip | Heterozigot (0/1) |
| Okuma derinliği | 88X |
| Alternatif alel oranı | [VAF değerini VCF'ten ekleyin] |

MEFV geni eksi iplikte yer aldığından, genomik düzeydeki G>A değişimi
kodlama dizisinde C>T olarak karşılık bulur. Bu değişim 239. kodondaki
arginin kodonunu (CGA) durdurma kodonuna (TGA) dönüştürmektedir.

Varyant IGV ile görsel olarak incelenmiş, hizalama görüntüsü
`figures/igv_snapshotMEVF16.png` dosyasında sunulmuştur.

---

## 4. Yorum

Saptanan değişim, pirin proteininin 239. aminoasitten itibaren
kesilmesine yol açan bir anlamsız varyanttır. Varyant ekzon 2'de yer
aldığı ve son ekzon-ekzon bağlantısının belirgin biçimde yukarısında
kaldığı için, transkriptin anlamsız kodon aracılı yıkıma (NMD)
uğraması beklenir. Bu durumda beklenen sonuç, ilgili alelden protein
üretilmemesidir.

Bununla birlikte, bu gözlemin doğrudan patojenite anlamına gelmediğini
vurgulamak gerekir. MEFV ile ilişkili Ailevi Akdeniz Ateşi'nde (FMF)
tanımlanmış hastalık mekanizması fonksiyon kaybı değildir; bilinen
patojenik varyantlar ağırlıklı olarak ekzon 10'da yer alan ve pirin
proteininin aşırı aktivasyonuna yol açan yanlış anlamlı değişimlerdir
(M694V, V726A, M680I). Trunkasyona yol açan varyantların FMF fenotipi
ile ilişkisi yerleşik değildir.

Bu nedenle ACMG/AMP kriterlerinden PVS1 uygulanmamıştır; söz konusu
kriter, kayıp-fonksiyonun ilgili gen için bilinen hastalık mekanizması
olmasını şart koşar.

Ek olarak FMF çoğunlukla otozomal resesif kalıtım gösterir. Tek
heterozigot alelin varlığı, klinik bulgu ve ikinci bir patojenik alel
olmaksızın tanı koydurucu değildir.

**Sınıflandırma: Belirsiz öneme sahip varyant (VUS)**

---

## 5. Sınırlılıklar

- Analiz tek örnek üzerinde yürütülmüş hedefli bir çalışmadır.
- Varyant çağrısı ortogonal bir yöntemle (Sanger dizileme)
  doğrulanmamıştır.
- Nanopore verisinde tek nükleotid değişimleri, özellikle homopolimer
  bölgelerinde, dikkatli değerlendirilmelidir.
- gnomAD popülasyon frekansı ve ClinVar/INFEVERS kayıtları bu çalışma
  kapsamında sorgulanmamıştır.
- Aile segregasyon analizi yapılmamıştır.

---

## 6. Önerilen Sonraki Adımlar

1. Varyantın Sanger dizileme ile doğrulanması
2. gnomAD alel frekansının sorgulanması
3. ClinVar ve INFEVERS veritabanlarında kayıt aranması
4. MEFV ekzon 10'un yaygın patojenik varyantlar açısından incelenmesi
5. Klinik bulgu varlığında aile segregasyon analizi

---

## 7. Kapsam Notu

Bu çalışma eğitim ve araştırma amaçlıdır. Klinik tanı, tarama veya
tedavi kararı için kullanılamaz. Klinik değerlendirme, tıbbi genetik
uzmanı tarafından yapılmalıdır.

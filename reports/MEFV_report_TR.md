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
| Gen | MEFV (ENSG00000103313) |
| Transkript | ENST00000219596.5 (Ensembl 99, protein_coding) |
| Genomik konum | chr16:3254353 (GRCh38) |
| Genomik değişim | G>A |
| Kodlama düzeyi | c.715C>T |
| Protein düzeyi | p.Arg239* (781 aa proteinde 239. kodon) |
| Ekzon | 2/10 |
| Varyant tipi | stop_gained |
| snpEff etki sınıfı | HIGH |
| Genotip | Heterozigot (0/1) |
| Okuma derinliği | 88X |
| Alel dağılımı | AD 51,26 (referans, alternatif) |
| Alternatif alel oranı | 0,34 |
| Genotip kalitesi | GQ 70 |
| Varyant kalitesi | QUAL 70,0 (PASS) |

MEFV geni eksi iplikte yer aldığından, genomik düzeydeki G>A değişimi
kodlama dizisinde C>T olarak karşılık bulur. Bu değişim 239. kodondaki
arginin kodonunu (CGA) durdurma kodonuna (TGA) dönüştürmektedir.

Varyant IGV ile görsel olarak incelenmiş, hizalama görüntüsü
`figures/igv_snapshotMEVF16.png` dosyasında sunulmuştur.

---

## 4. Çağrı Kalitesi Değerlendirmesi

Varyant PASS filtresini geçmiş olmakla birlikte, çağrıyı destekleyen
kanıtlar sınırlıdır ve dikkatli değerlendirilmelidir.

**Belirsizliği artıran gözlemler:**

- Alternatif alel oranı 0,34 olup, heterozigot bir çağrıda beklenen
  ~0,50 değerinin altındadır.
- Toplam 88 okumadan 77'si bir alele atanmış, 11 okuma belirsiz
  kalmıştır (AM=11).
- Alternatif aleli destekleyen okumaların ortalama kalitesi düşüktür
  (AQ=12,25).
- Bölgedeki uyumsuzluk oranları yüksektir (MF=0,221; MB=0,227).

**Çağrıyı destekleyen gözlemler:**

- Haritalama kalitesi tüm eşiklerde kusursuzdur (MQ10–MQ50 = 1,00).
- Dizi bağlamı (CTTCTAGGTC[G]CATCTTTCCC) homopolimer içermemektedir; bu
  nedenle varyant, Nanopore verisinin en sık hata tipine denk
  gelmemektedir.

Bu değerler bir arada değerlendirildiğinde, varyantın ortogonal bir
yöntemle doğrulanması bir öneri değil, gerekliliktir.

---

## 5. Yorum

Saptanan değişim, pirin proteininin 239. aminoasitten itibaren
kesilmesine yol açan bir anlamsız varyanttır. Varyant ekzon 2'de yer
aldığı ve son ekzon-ekzon bağlantısının belirgin biçimde yukarısında
kaldığı için, transkriptin anlamsız kodon aracılı yıkıma (NMD) uğraması
beklenir. Bu durumda beklenen sonuç, ilgili alelden protein
üretilmemesidir.

snpEff'in LOF ve NMD etiketleri, gen için tanımlı 14 transkriptten
yalnızca birinin (%7) bu varyanttan etkilendiğini bildirmektedir; kalan
transkriptlerde değişim intronik bölgeye düşmektedir. Bu durum,
varyantın gen ürünü üzerindeki toplam etkisini sınırlayan ek bir
belirsizlik kaynağıdır.

Bununla birlikte, bu gözlemlerin doğrudan patojenite anlamına gelmediğini
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

## 6. Sınırlılıklar

- Analiz tek örnek üzerinde yürütülmüş hedefli bir çalışmadır.
- Varyant çağrısı ortogonal bir yöntemle (Sanger dizileme)
  doğrulanmamıştır.
- Alternatif alel oranı beklenen heterozigot aralığın altındadır.
- Nanopore verisinde tek nükleotid değişimleri dikkatli
  değerlendirilmelidir.
- gnomAD popülasyon frekansı ve ClinVar/INFEVERS kayıtları bu çalışma
  kapsamında sorgulanmamıştır.
- Aile segregasyon analizi yapılmamıştır.

---

## 7. Önerilen Sonraki Adımlar

1. Varyantın Sanger dizileme ile doğrulanması
2. gnomAD alel frekansının sorgulanması
3. ClinVar ve INFEVERS veritabanlarında kayıt aranması
4. MEFV ekzon 10'un yaygın patojenik varyantlar açısından incelenmesi
5. Klinik bulgu varlığında aile segregasyon analizi

---

## 8. Kapsam Notu

Bu çalışma eğitim ve araştırma amaçlıdır. Klinik tanı, tarama veya
tedavi kararı için kullanılamaz. Klinik değerlendirme, tıbbi genetik
uzmanı tarafından yapılmalıdır.

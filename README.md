# Ordinal-Logistic-Regression-Analysis
Menganalisa Faktor yang Mempengaruhi Tingkat Keparahan Kecelakaan Lalu Lintas

**Introduction**

Melakukan Exploratory Data Analysis terhadap tingkat keparahan kecelakaan lalu lintas dan serta memodelkan features yang dianggap mempengaruhi tingkat keparahan kecelakaan lalu lintas dengan pemodelan regresi Logistik Ordinal 

**Objective Statement**
- Memberi insight faktor apa saja yang mempengaruhi tingkat keparahan kecelakaan lalu lintas
- Member insight kepada pihak berwenang untuk menentukan 
Get business insight about how much customer spend their money every month.
To reduce risk in deciding where, when, how, and to whom a product, service, or brand will be marketed.
To increase marketing efficiency by directing effort specifically toward the designated segment in a manner consistent with that segment’s characteristics.

**Data Set**
- Usia 
- Jenis kelamin 
-	Jenis kecelakaan 
  DB = tabrakan depan-belakang.
  DD = depan-depan.
  DS = depan-samping.
  DJ = menabrak penyebrang jalan.
  DO = kecelakaan lain-lain (tabrakan sendiri, hilang kontrol, dan menabrak-obyek tetap).
- Peran korban dalam kecelakaan ( P = pengemudi, N = penumpang, J = pengguna jalan )
- Jenis kendaraan yang bertabrakan 
X_5=1 jika kendaraan yang bertabrakan merupakankendaraan bermotor roda dua atau tiga vs kendaraan bermotor roda dua atau tiga .
X_5=2 jika kendaraan yang bertabrakan merupakan kendaraan bermotor roda dua atau tiga vs kendaraan bermotor roda empat atau lebih.
X_5=3 jika kendaraan yang bertabrakan merupakan kendaraan bermotor roda dua atau tiga vs kendaraan lain-lain..
X_5=4 jika kendaraan yang bertabrakan merupakan kendaraan bermotor 
roda empat atau lebih vs kendaraan bermotor roda empat atau lebih.
X_5=5 jika kendaraan yang bertabrakan merupakan kendaraan bermotor roda empat atau lebih vs kendaraan lain-lain.

**Challenges:
- Kebanyakan feature merupakan data ketegorik, sehingga memerlukan waktu untuk prepartion data

**Methodology / Analytic Technique**
- Descriptive analysis
- Regresi Logistik Ordinal

** Business Benefit:**
- Membantu pihak yang berwajib untuk mengambil kebijakan terkait peraturan lalu lintas
- Memberikan awarness kepada masyarakat tentang kecelakaan lalu lintas

** Expected Outcome:
- Train an ordinal logistic model
- Mengetahui faktor apa saja yang mempengaruhi tingkat keparahan kecelakaan lalu lintas
- Feature yang paling berpengaruh 



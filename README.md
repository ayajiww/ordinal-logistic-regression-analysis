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
- Tingkat Keparahan Kecelakaan : Merupakan data ordinal dengan 3 tingkatan 
  Luka Ringan < Luka Berat < Meninggal Dunia
- Usia : Usian korban yang mengalami kecelakaan
- Jenis kelamin : Laki-laki, Perempuan
-	Jenis kecelakaan : Kecelakaan antara kendaraan yang terjadi
  TDD (Tabrakan Depan Depan) , TDB (Tabrakan Depan Belakang), TDS (Tabrakan Depan Samping), PJ (Menabrak Penyeberang Jalan)
- Jenis kendaraan : Kendaraan Roda 2 atau 3 , Kendaraan Roda 4 , Kendaraan Roda lebih dari 4, dan Penyeberang jalan (others) 
- Peran Korban : Penumpang, Pengemudi, atau Penyeberang jalan (others)

**Challenges:**
- Handling Missing value
- Handling Categorical Encoding 
- Feature Engineering
- Interpretasi Model

**Methodology / Analytic Technique**
- Descriptive analysis
- Regresi Logistik Ordinal

**Business Benefit**
- Membantu pihak yang berwajib untuk mengambil kebijakan terkait peraturan lalu lintas
- Memberikan awarness kepada masyarakat tentang kecelakaan lalu lintas

**Expected Outcome**
- Ordinal logistic model
- Mengetahui faktor apa saja yang mempengaruhi tingkat keparahan kecelakaan lalu lintas
- Mengetahui Feature yang paling berpengaruh 

**Technical**
- Using R Program
- Libraries:
  tidyverse
  dplyr
  tidyr
  ggplot2
  psych
  glmnet
  MASS

**OVERALL SUMMARY**
**Data Visualization and Exploratory Data Analysis**
![image](https://user-images.githubusercontent.com/95867761/155179594-a87f6e79-1a5d-4e58-81d3-86364cc3f236.png)

Dapat dilihat bahwa jumlah korban yang meninggal dunia, mengalami luka berat maupun lukan ringan akibat kecelakaan lalu lintas realtif sama banyak. Dengan korban terbanyak adalah mengalami luka berat yaitu sebesar 35,29%


Adapun features pada project ini 5/6 merupakan data berbentuk kategori dan hanya 1 feature yang merupakan data numerik yaitu data Usia.
Adapun Sebaran data Usia berdasarkan tingkat keparahan kecelakaan lalu lintas dapat digambarkan sebagai berikut :
![image](https://user-images.githubusercontent.com/95867761/155181386-fda7c46e-25e0-493f-9978-9cae2582c15e.png)

Terdapat beberapa outliner, namun outliner tersebut masih layak dimasukkan kedalam kedalam train data.


Selanjutnya untuk mengetahui korelasi antara data dan mengecek adanya multikolinearitas dapat kita gambarkan hubungan antara tiap feature sebagai berikut :
![image](https://user-images.githubusercontent.com/95867761/155181910-141d3541-63d9-4ff4-8496-b549d6863b9e.png)

Dimana terlihat bahwasanya tidak tedapat multikolinearitas, sehingga kita bisa lanjut melakukan pemodelan dengan feature yang ada.


**Analyse the Data**
Analisa ini menggunakan fungsi regresi logistik ordinal, dimana tingkat keparahan kecelakaan lalu lintas dikategorikan sebagai data kualitatif berbentuk polikotomus dengan skala ordinal.  Kemudian untuk mengetahui feature yang berpengaruh terhadap tingkat keparahan kecelakaan lalu lintas maka dapat ditunjukkan melalui nilai p (p-value) uji Wald. 
![image](https://user-images.githubusercontent.com/95867761/155183186-0db667d7-8c72-465c-92d9-8194306c0b38.png)

Berdasarkan output diatas tampak bahwa Usia, Peran korban dalam kecelakaan, dan jenis tabrakan mempunyai pengaruh signifikan terhadap tingkat keparahan kecelakaan lalu lintas dikarenakan nilai p-value < alpha( 0.05). 

**Conclusion & Reccomendation**
- Diketahi bahwa Usia berpengaruh terhadap tingkat keparahaan kecelakaan lalu lintas, dimana dapat kita lihat korban dengan usia 30 tahun keatas cendrung mengalami tinkat kecelakaan lebih parah dibanding usia muda. Sehingga perlu adanya extra kehati-hatian lagi untuk orang dewasa dalam berlalu lintas
- Selanjutnya diketahui juga bahwasanya peran korban dalam kecelakaan berpengaruh terhadap tingkat keparahanan kecelakaan lalu lintas. Sehingga perlu dianalisa lebih lanjut kategori mana yang berpeluang mengalami tingkat keparahan yang lebih tinggi. Jika pengguna jalan non kendaraan lebih berpeluang mengalami luka berat sampai dengan meninggal dunia, dapat diberi masukan kepada pihak yang berwenang untuk menyediakan fasilitas pengguna jalan yang lebih layak seperti penambahanan trotoar, rambu-rambu lalu lintas atau tempat penyeberangan.
- Atas analisa ini belum dibentuk model dengan feature berpengaruh dan juga belum dihitung untuk nilai hit ratio atau akurasi model. Sehingga diharapkan untuk melakukan pemodelan lebih lajut serta menambahkan data update dan feature terbaru.
- Untuk hasil ini tidak berlaku secara general karena geografif dan demografis tiap daerah berbeda-beda. Sehingga hasil dapat saja berbeda dengan data di wilayah yang berbeda
- Diharapkan menggunakan model lain sebagai pembanding model yang lebih baik berdasarkan tingkat akurasi

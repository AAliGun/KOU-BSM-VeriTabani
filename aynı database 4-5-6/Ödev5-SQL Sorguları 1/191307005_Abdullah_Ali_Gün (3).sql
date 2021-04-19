
use 191307005_abdullah_ali_gün;  /* Örnek: use 101307001_ahmet_veli_başarılı;  */ 

/* 1-54 numaralı öğrencinin adı, soyadı ve cinsiyet bilgilerini veren sql komutu nedir? */
/* CEVAP: */ 
select adi, soyadi, cinsiyet
from ogrenciler
where ogrenci_no =54;


/* 2-Derslerin adını ve kodunu veren sql komutu nedir? */

/* CEVAP: */
select ders_kodu, ders_adi
from dersler;


/* 3-Geometri dersinin kodunu veren sql komutu nedir? */

/* CEVAP: */
select ders_kodu
from dersler
where ogrenci_no ='Geometri';

/* 4-Erkek öğrencilerin sınıflarının kodunu veren sql komutu nedir? */

/* CEVAP: */
select sinif_kodu
from ogrenciler
where cinsiyet ='e';

/* 5-Alınan notlardan 50 ve üstü alan öğrencilerin numarasını veren sql komutu nedir? */

/* CEVAP: */
select ogrenci_no
from notlar
where notu >= 50;

/* 6-Alınan notlardan 50 ve altı alan öğrencilerin numara ve bulundukları ders kodunu veren sql komutu nedir? */

/* CEVAP: */
select ogrenci_no, ders_kodu
from notlar
where notu <= 50;

/* 7-Alınan derslerden en düşük notu alan öğrencinin numarasını veren sql komutu nedir? */

/* CEVAP: */ 
select ogrenci_no
from notlar
where notu = (select min(notu) from notlar);

use Odev4_AbdullahAli;

/* 1-18 numaralı öğrencinin adı, soyadı ve cinsiyet bilgilerini veren sql komutu nedir?*/
/* CEVAP: */select adi, soyadi, cinsiyet from ogrenciler where ogrenci_no =18;


/* 2-18 numaralı öğrencinin not aldığı derslerin kodunu veren sql komutu nedir?*/

/* CEVAP: */select ders_kodu from notlar where ogrenci_no =18;

/* 3-Matematik dersini alan öğrencilerin cinsiyet bilgilerini veren sql komutu nedir? */

/* CEVAP: */select cinsiyet from ogrenciler where ogrenci_no = (select ogrenci_no from notlar where  ders_kodu = 'mat');

/* 4-Geometri dersini alan öğrencinin bulunduğu sınıfın adını veren sql komutu nedir?  */

/* CEVAP: */ select sinif_adi from siniflar where sinif_kodu = (select sinif_kodu from ogrenciler where ogrenci_no = (select ogrenci_no from notlar where ders_kodu = 'geo'));

/* 5- 12 Bilişim A sınıfında okuyan öğrencilerin aldıkları derslerin kodu ve notunu veren sql komutu nedir? */

/* CEVAP: */  select ders_kodu, notu from notlar where ogrenci_no IN (select ogrenci_no from ogrenciler where sinif_kodu = '12blsa');

/* 6- Matematik dersinden not alan öğrencilerin aldıkları notu, adı, soyadı ve sınıflarının adlarını veren sql komutu nedir? */

/* CEVAP: */
select notlar.notu, ogrenciler.adi, ogrenciler.soyadi, siniflar.sinif_adi
from notlar ,ogrenciler,siniflar
where notlar.ogrenci_no = (select ogrenci_no from notlar where ders_kodu = 'mat')
and ogrenciler.ogrenci_no = (select ogrenci_no from notlar where ders_kodu = 'mat')
and siniflar.sinif_kodu = (select sinif_kodu from ogrenciler where ogrenci_no = (select ogrenci_no from notlar where ders_kodu = 'mat'));

/* 7-Alınan notlardan 60 ve üstü alan öğrencilerin numarası ve adını veren sql komutu nedir?  */

/* CEVAP: */  select ogrenci_no, adi from ogrenciler where ogrenci_no in (select ogrenci_no from notlar where notu >= 60);

/* 8-  Alınan notlardan 60 ve üstü alan öğrencilerin adını ve bulundukları sınıfların adlarını veren sql komutu nedir?*/

/* CEVAP: */ 
select ogrenciler.adi, siniflar.sinif_adi
from ogrenciler,siniflar
where ogrenciler.ogrenci_no in (select ogrenci_no from notlar where notu >= 60)
and siniflar.sinif_kodu in (select sinif_kodu from ogrenciler where ogrenci_no in (select ogrenci_no from notlar where notu >= 60));

/* 9-Alınan notlardan 60 ve üstü alan öğrencilerin adlarını ve notu aldıkları derslerin adlarını veren sql komutu nedir?  */

/* CEVAP: */
select ogrenciler.adi, notlar.notu, dersler.ders_adi
from notlar ,ogrenciler,dersler
where ogrenciler.ogrenci_no in (select ogrenci_no from notlar where notu >= 60)
and notlar.ogrenci_no in (select ogrenci_no from notlar where notu >= 60)
and dersler.ders_kodu in (select ders_kodu from notlar where notu >= 60);

/* 10-Alınan derslerden en yüksek notu alan öğrencinin numarasını veren sql komutu nedir?  */

/* CEVAP: */
select ogrenci_no from notlar where notu = (select max(notu) from notlar);

/* 11-Alınan derslerden en yüksek notu alan öğrencinin adı,soyadı ve bulunduğu sınıfın adını veren sql komutu nedir?  */

/* CEVAP: */   
select ogrenciler.adi, ogrenciler.soyadi, siniflar.sinif_adi
from ogrenciler, siniflar 
where ogrenciler.ogrenci_no = (select ogrenci_no from notlar where notu = (select max(notu) from notlar))
and siniflar.sinif_kodu = (select sinif_kodu from ogrenciler where ogrenci_no = (select ogrenci_no from notlar where notu = (select max(notu) from notlar)));
/* 12- Alınan derslerden en yüksek notu alan öğrencinin notunu aldığı dersin adını veren sql komutu nedir? */

/* CEVAP: */   
select max(notlar.notu), dersler.ders_adi
from notlar, dersler
where dersler.ders_kodu = (select ders_kodu from notlar where notu = (select max(notu) from notlar));
/* 13- Alınan derslerden en yüksek notu alan öğrencinin notunu aldığı dersi alan diğer öğrencilerin numarasını veren sql komutu nedir? */

/* CEVAP: */  
select ogrenci_no
from ogrenciler
where ogrenci_no in (select ogrenci_no from notlar where ders_kodu = (select ders_kodu from notlar where notu = (select max(notu) from notlar)));

/* 14-  Erkek öğrencilerin aldıkları derslerin adını, derslerden aldıkları notları, öğrencilerin bulundukları sınıfların adlarını veren sql komutu nedir?*/

/* CEVAP: */   
select dersler.ders_adi, notlar.notu, siniflar.sinif_adi
from dersler, notlar, siniflar
where dersler.ders_kodu in (select ders_kodu from notlar where ogrenci_no in (select ogrenci_no from ogrenciler where cinsiyet = 'e'))
and notlar.ogrenci_no in (select ogrenci_no from ogrenciler where cinsiyet = 'e')
and siniflar.sinif_kodu in (select sinif_kodu from ogrenciler where cinsiyet = 'e');


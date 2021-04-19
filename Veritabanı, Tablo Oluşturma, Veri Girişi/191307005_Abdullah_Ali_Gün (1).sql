CREATE DATABASE ODEV3_ABDULLAHALI;
USE ODEV3_ABDULLAHALI;
CREATE TABLE ogrenci (
    numara INT(9) NOT NULL,
    tc_no varchar(11) NOT NULL,
    adi varchar(20) NOT NULL,
    soyadi varchar(15) NOT NULL,
    okula_baslama_tarihi varchar(8) NOT NULL,
    dogum_tarihi varchar(8) NOT NULL,
    dogum_yeri varchar(15) NOT NULL,
    PRIMARY KEY (numara)
);

INSERT INTO ogrenci (numara, tc_no, adi, soyadi, okula_baslama_tarihi, dogum_tarihi, dogum_yeri)
VALUES ('161307001', '12345678910', 'Berk', 'Bir', '10.10.00', '10.10.00', 'Kocaeli');
INSERT INTO ogrenci (numara, tc_no, adi, soyadi, okula_baslama_tarihi, dogum_tarihi, dogum_yeri)
VALUES ('161307002', '12345678911', 'Seda', 'İki', '11.10.00', '11.10.00', 'İstanbul');
INSERT INTO ogrenci (numara, tc_no, adi, soyadi, okula_baslama_tarihi, dogum_tarihi, dogum_yeri)
VALUES ('161307003', '12345678912', 'Handan', 'Üc', '12.05.05', '12.05.05', 'İzmir');
INSERT INTO ogrenci (numara, tc_no, adi, soyadi, okula_baslama_tarihi, dogum_tarihi, dogum_yeri)
VALUES ('161307004', '12345678913', 'Emre', 'Doruk', '05.05.05', '05.05.05', 'Aydin');

ALTER TABLE ogrenci ADD ogr_boy_uzunlugu varchar(3);
ALTER TABLE ogrenci ADD ogr_kilosu varchar(3);

UPDATE ogrenci
SET ogr_boy_uzunlugu = '165', ogr_kilosu= '74'
WHERE numara = 161307001;

UPDATE ogrenci
SET ogr_boy_uzunlugu = '180', ogr_kilosu='52'
WHERE numara = 161307002;

UPDATE ogrenci
SET ogr_boy_uzunlugu = '162', ogr_kilosu= '45'
WHERE numara = 161307003;

UPDATE ogrenci
SET ogr_boy_uzunlugu = '187', ogr_kilosu= '80'
WHERE numara = 161307004;
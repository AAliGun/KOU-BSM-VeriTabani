create database nCovid_19_191307005;

use nCovid_19_191307005;
create table risk (
	risk_ID int not null,
	renk_kodu varchar(10) not null,
    hs_yasagi bool not null,
    okullar_acik_mi bool not null,
    SY18_65 bool not null,
    primary key(risk_ID)
);
create table sehirler(
	sehir_ID int not null,
    sehir_Adi varchar(20) not null,
    vaka_Orani int not null,
    hastane_Doluluk_Orani int not null,
    risk_ID int,
    primary key(sehir_ID),
    FOREIGN KEY (risk_ID) REFERENCES risk(risk_ID),
    constraint vokisit check(vaka_Orani > -1 and vaka_Orani <101),
    constraint hdokisit check(hastane_Doluluk_Orani > -1 and hastane_Doluluk_Orani <101)
);

INSERT INTO risk (risk_ID, renk_kodu, hs_yasagi, okullar_acik_mi,SY18_65)
VALUES (1, "yeşil", false, true,false),
(2, "sarı", false, true, false),
(3, "turuncu", true, true,false),
(4, "yeşil", true, false,true);

INSERT INTO sehirler (sehir_ID, sehir_Adi, vaka_Orani, hastane_Doluluk_Orani,risk_ID)
VALUES (1, "adana", 6, 4,null),
(2, "ankara", 8, 10,null),
(3, "bursa", 14, 4,null),
(4, "kocaeli", 18, 50,null),
(5, "istanbul", 11, 90,null),
(6, "izmir", 15, 11,null),
(7, "van", 1,90,null);

/*kullanım örneği için kaynak :https://github.com/ibrahimyldz11q/MYSQL-IF-ELSE/blob/master/ıfelse.sql*/
DELIMITER //
CREATE PROCEDURE test(IN vaka int,IN hastane int, OUT durum int)
BEGIN
	IF hastane < 10 THEN SET durum = 1;
	ELSEIF hastane > 70 THEN SET durum = 4;
	ELSEIF vaka < 6 THEN SET durum = 1;
	ELSEIF vaka > 5 and vaka < 11 THEN SET durum = 2;
	ELSEIF vaka > 10 and vaka < 16 THEN SET durum = 3;
	ELSEIF vaka > 15 THEN SET durum = 4;
    ELSE SET durum = null;
END IF;
END//
DELIMITER ;
/*kullanım örneği için kaynak : https://www.yusufsezer.com.tr/mysql-while/*/
DELIMITER //
CREATE PROCEDURE riskgüncelle()
BEGIN
  DECLARE x INT;
  SET x = 1;
  WHILE x <= 7 DO
	SET @riskid = 0;
	CALL test((Select vaka_Orani from sehirler where sehir_ID = x),(Select hastane_Doluluk_Orani from sehirler where sehir_ID = x),@riskid);
	SELECT (@riskid);
    UPDATE sehirler
	SET risk_ID = @riskid
	WHERE sehir_ID = x;
	SET x = x + 1;
  END WHILE;
END //
DELIMITER ;
CALL riskgüncelle();
SELECT * FROM sehirler;

select sehir_Adi from sehirler where risk_ID = (select risk_ID from risk where okullar_acik_mi = false);

select sehir_Adi from sehirler where vaka_Orani = (select min(vaka_Orani) from sehirler);

select sehir_Adi from sehirler where hastane_Doluluk_Orani = (select max(hastane_Doluluk_Orani) from sehirler);

UPDATE sehirler	SET hastane_Doluluk_Orani = 20	WHERE sehir_ID = 7;
CALL riskgüncelle();
SELECT * FROM sehirler;

DELETE FROM sehirler WHERE sehir_ID  = 7;
SELECT * FROM sehirler;

update risk set hs_yasagi = false where risk_ID = 3;
SELECT * FROM risk;

select sehir_Adi from sehirler where risk_ID = (select risk_ID from risk where hs_yasagi = true);

select risk_ID from risk where okullar_acik_mi = true;
select count(sehir_Adi) from sehirler where risk_ID != (select risk_ID from risk where okullar_acik_mi = false);
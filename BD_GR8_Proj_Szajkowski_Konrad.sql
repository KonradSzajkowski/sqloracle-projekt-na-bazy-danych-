--Nazwa Projektu Rejsy Transatlantyckie
--Wykona³:Konrad Szajkowski
--Nr Indeksu :127768
--Grupa: lab 8

CREATE TABLE Klienci(
IdKlienta NUMBER(11) 
    CONSTRAINT klienci_pk PRIMARY KEY,
Imie VARCHAR2(20) 
    constraint imie_nn NOT NULL,
Nazwisko VARCHAR2(30)
    CONSTRAINT nazwisko NOT NULL,
DataUrodzenia DATE 
    CONSTRAINT DataUrodzenia_nn NOT NULL,
Narodowosc VARCHAR2(30)
    CONSTRAINT Narodowosc_nn NOT NULL,
Adres VARCHAR2(50)
    CONSTRAINT  Adres_nn NOT NULL
);

CREATE TABLE Okrety(
IdOkretu NUMBER(5)
    CONSTRAINT okrety_pk PRIMARY KEY,
TypOkretu VARCHAR2(30) 
    CONSTRAINT o_typ_nn NOT NULL,
NazwaOkretu VARCHAR2(30)
    CONSTRAINT o_nazwa_nn NOT NULL,
IloscKabin NUMBER(5) 
    CONSTRAINT o_kabiny_nn NOT NULL,
RokProdukcji DATE
    CONSTRAINT o_rokprodukcji_nn NOT NULL
);

CREATE TABLE Pracownicy(
IdPracownika NUMBER(11) 
    CONSTRAINT pracownicy_pk PRIMARY KEY,
Imie VARCHAR2(20) 
    constraint p_imie_nn NOT NULL,
Nazwisko VARCHAR2(30)
    CONSTRAINT p_nazwisko NOT NULL,
DataUrodzenia DATE 
    CONSTRAINT p_DataUrodzenia_nn NOT NULL,
Narodowosc VARCHAR2(30)
    CONSTRAINT p_Narodowosc_nn NOT NULL,
Adres VARCHAR2(50)
    CONSTRAINT  p_Adres_nn NOT NULL,
Funkcja VARCHAR2(50) 
    CONSTRAINT p_funkcja_nn NOT NULL,
Okret NUMBER(5)
    CONSTRAINT p_Okret_nn NOT NULL
    CONSTRAINT p_okret_fk REFERENCES Okrety(IdOkretu)
);

CREATE TABLE Rejsy(
IdRejsu NUMBER(11)
    CONSTRAINT rejsy_pk PRIMARY KEY,
Okret NUMBER(5)
    CONSTRAINT r_Okret_nn NOT NULL
    CONSTRAINT r_okret_fk REFERENCES Okrety(IdOkretu),
DataWyplyniecia DATE 
    CONSTRAINT r_datawyplyniecia_nn NOT NULL,
DataPrzyplyniecia DATE 
    CONSTRAINT r_dataprzyplyniecia_nn NOT NULL,
Kurs VARCHAR2(500)
    CONSTRAINT r_kurs_nn NOT NULL
);

CREATE TABLE Rezerwacje (
IdRezerwawcji NUMBER(11)
    CONSTRAINT rezerwacje_pk_ NOT NULL,
Rejs NUMBER(11) 
    CONSTRAINT rw_rejs_fk REFERENCES Rejsy(IdRejsu)
    CONSTRAINT rw_rejs_nn NOT NULL,
RodzajKabiny VARCHAR2(30)
    CONSTRAINT rw_kabina_nn NOT NULL,
Cena NUMBER(6)
    CONSTRAINT rw_cena_nn NOT NULL,
Klienci Number(11)
    CONSTRAINT rw_klienci_nn NOT NULL
    CONSTRAINT rw_klienci_fk REFERENCES Klienci(IdKlienta)
);

commit;

INSERT INTO Klienci VALUES
(1,'Jan','Kowalski',TO_DATE ('01-01-1980','dd-mm-yyyy'),'Polska','42-200 Czêstochowa ul.fikcyjna 12');
INSERT INTO Klienci VALUES
(2,'Robert','Nowak',TO_DATE ('01-01-1988','dd-mm-yyyy'),'Polska','40-220 Warszawa ul.nieprawdziwa 45');
INSERT INTO Klienci VALUES
(3,'John','Smith',TO_DATE ('11-06-1969','dd-mm-yyyy'),'Anglia','11220 Londyn Schekspir st.');
INSERT INTO Klienci VALUES
(4,'Remi','Reno',TO_DATE ('22-09-1992','dd-mm-yyyy'),'Francja','61992 Pary¿ ul.Napoleona 180');
INSERT INTO Klienci VALUES
(5,'Marian','Górny',TO_DATE ('11-06-1974','dd-mm-yyyy'),'Polska','88-122 Biaystok ul.Warszawska 12/10');

INSERT INTO Okrety VALUES
(1,'Prom','Dar Morza',60,TO_DATE ('01-01-1980','dd-mm-yyyy'));
INSERT INTO Okrety VALUES
(2,'Okret Wycieczkowy','Vanessa',400,TO_DATE ('09-08-2009','dd-mm-yyyy'));
INSERT INTO Okrety VALUES
(3,'Okret Wycieczkowy','Santa Maria',210,TO_DATE ('09-08-1965','dd-mm-yyyy'));
INSERT INTO Okrety VALUES
(4,'¯aglowiec','Bryza',30,TO_DATE ('04-04-1982','dd-mm-yyyy'));
INSERT INTO Okrety VALUES
(5,'Jacht','Kupidyn',8,TO_DATE ('21-07-2015','dd-mm-yyyy'));

INSERT INTO Pracownicy VALUES
(1,'Anna','Zawisza',TO_DATE ('01-06-1995','dd-mm-yyyy'),'Polska','88-226 Gdañsk ul.Portowa 41/12','Kelnerka',2);
INSERT INTO Pracownicy VALUES
(2,'Marcin','Król',TO_DATE ('01-06-1982','dd-mm-yyyy'),'Polska','88-226 Gdañsk ul.Krótka 1','Kapitan',1);
INSERT INTO Pracownicy VALUES
(3,'Marian','Pyra',TO_DATE ('01-06-1968','dd-mm-yyyy'),'Polska','88-226 Gdañsk ul.Pocztowa 88/62','Kucharz',2);
INSERT INTO Pracownicy VALUES
(4,'Arnold','Remi',TO_DATE ('01-06-1991','dd-mm-yyyy'),'Francja','78246 Lion ul.Paryska','Marynarz',4);
INSERT INTO Pracownicy VALUES
(5,'Mia','Steward',TO_DATE ('01-06-1994','dd-mm-yyyy'),'USA','87192 Majami ul.sloneczna','barmanka',5);

INSERT INTO Rejsy VALUES
('1','1',TO_DATE('09-08-2018','dd-mm-yyyy'),TO_DATE('09-08-2018','dd-mm-yyyy'),'Gdañsk->Borcholm->Gdañsk');
INSERT INTO Rejsy VALUES
('2','2',TO_DATE('01-08-2018','dd-mm-yyyy'),TO_DATE('20-08-2018','dd-mm-yyyy'),'Gdañsk->Kopenchaga->Madera->Hawana->Majami->Turawentura->Londyn->Gdañsk');
INSERT INTO Rejsy VALUES
('3','3',TO_DATE('22-07-2018','dd-mm-yyyy'),TO_DATE('14-08-2018','dd-mm-yyyy'),'Gdañsk->Amsterdam->Porto->Madera->Teneryfa->Lizbona->Gdañsk');
INSERT INTO Rejsy VALUES
('4','4',TO_DATE('20-07-2018','dd-mm-yyyy'),TO_DATE('20-09-2018','dd-mm-yyyy'),'Gdañsk->Amsterdam->La Rochelle->Lizbona->Dakar->Kapsztad->Mombasa->Phatos->Malta->Amsterdam->Gdañsk');
INSERT INTO Rejsy VALUES
('5','5',TO_DATE('06-08-2018','dd-mm-yyyy'),TO_DATE('24-08-2018','dd-mm-yyyy'),'gdañsk->Amsterdam->Londyn->Porto->Lizbona->San Juan->Santo Domingo->Madera->La Rochelle->Gdañsk');

INSERT INTO Rezerwacje  VALUES
('1','1','2 osobowa ekonomiczna','100','1');
INSERT INTO Rezerwacje  VALUES
('2','2','1 osobowa Premium','4500','2');
INSERT INTO Rezerwacje  VALUES 
('3','3','4 osobowa Normalna','8000','3');
INSERT INTO Rezerwacje  VALUES
('4','4','1 osobowa Normalna','8000','4');
INSERT INTO Rezerwacje  VALUES
('5','5','2 osobowa Premium Pro','50000','5');

commit;

--Podaj liczbê okrêtów ka¿dego typu wyprodukowanych w latach 1960-2010
SELECT TypOkretu,COUNT(*)
FROM OKRETY 
WHERE EXTRACT(year FROM RokProdukcji) BETWEEN 1960 AND 2010
GROUP BY TypOkretu;
--Podaj Typy okrêtów które zarobily wiêcej ni¿ 10000 w 2018 roku 
SELECT TypOkretu,SUM(cena)
FROM Rezerwacje rw JOIN Rejsy r ON rw.Rejs=r.IdRejsu Join Okrety o ON o.IdOkretu=r.Okret
WHERE EXTRACT(year FROM DataWyplyniecia)=2018
GROUP BY TypOkretu
HAVING SUM(cena)>=10000;
--podaj nazwy i zarobki okretów  które zarobiy powy¿ej œredniej
SELECT nazwaokretu,zarobek
FROM OKRETY o JOIN
(SELECT okret,SUM(cena) as zarobek
FROM Rezerwacje rw JOIN Rejsy r ON rw.Rejs=r.IdRejsu Join Okrety o ON o.IdOkretu=r.Okret
GROUP BY okret
HAVING SUM(cena)>=(SELECT AVG(zarobek) as srednia
FROM (SELECT o.idOkretu,SUM(cena) as zarobek
    FROM Rezerwacje rw JOIN Rejsy r ON rw.Rejs=r.IdRejsu Join Okrety o ON o.IdOkretu=r.Okret
    GROUP BY o.idOkretu))) z ON z.okret=o.IDOKRETU;
--policz klientów z poszczegolnych krajow którzy plyneli z przynajmniej jedna osoba z personelu ich narodowosci
SELECT Narodowosc,count(*)
FROM (SELECT  DISTINCT k.IDKLIENTA as klient,k.NARODOWOSC as narodowosc
FROM KLIENCI k join Rezerwacje rw ON k.IDKLIENTA=rw.KLIENCI JOIN Rejsy r ON rw.Rejs=r.IdRejsu Join Okrety o ON o.IdOkretu=r.Okret Join PRACOWNICY p ON p.Okret=o.idOkretu
WHERE k.NARODOWOSC=p.NARODOWOSC)
group by NARODOWOSC;
--widok porownaj -pokauje ile œrednio zarobily okrêty powy¿ej i poni¿ej lub równo ze œrednim rokiem produkcji
CREATE OR REPLACE VIEW Porownaj AS
SELECT *
FROM 
(SELECT ROUND(AVG(zarobek),0) as nowsze
FROM (SELECT okret,SUM(cena) as zarobek
FROM Rezerwacje rw JOIN Rejsy r ON rw.Rejs=r.IdRejsu Join Okrety o ON o.IdOkretu=r.Okret
WHERE extract(year from RokProdukcji)>(SELECT ROUND(AVG(extract(year FROM RokProdukcji)),0) 
FROM OKRETY)
group by okret))
CROSS JOIN
(SELECT ROUND(AVG(zarobek),0) as starsze
FROM (SELECT okret,SUM(cena) as zarobek
FROM Rezerwacje rw JOIN Rejsy r ON rw.Rejs=r.IdRejsu Join Okrety o ON o.IdOkretu=r.Okret
WHERE extract(year from RokProdukcji)<=(SELECT ROUND(AVG(extract(year FROM RokProdukcji)),0) 
FROM OKRETY)
group by okret));

select * from porownaj;
--Widok Dekady - dzieli pracowników na dekady 
--i pokazuje sredni zysk z okretów na których osoby z danej dekady aktualnie pracuja
CREATE OR REPLACE VIEW Dekady AS
SELECT dekada,ROUND(AVG(cena)) as srednizysk
FROM(SELECT CONCAT(CONCAT(TRUNC(EXTRACT(year FROM p.DataUrodzenia),-1),'-'),
TRUNC(EXTRACT(year FROM p.DataUrodzenia)+10,-1)) as dekada,cena
FROM Rezerwacje rw JOIN Rejsy r ON rw.Rejs=r.IdRejsu Join Okrety o ON o.IdOkretu=r.Okret JOIN PRACOWNICY p ON p.Okret=o.idOkretu)
GROUP BY dekada;

select * from Dekady;


--sprawdzanie czy sa jeszcze wolne miejsca na statku w czasie rezerwacji 
CREATE OR REPLACE TRIGGER Wolne_Miejsca BEFORE INSERT ON Rezerwacje 
FOR EACH ROW
DECLARE 
miejsca NUMBER;
zarezerwowane NUMBER;
BEGIN
    BEGIN
        SELECT ilosckabin into miejsca 
        FROM (SELECT IloscKabin
            FROM Rezerwacje rw JOIN Rejsy r ON rw.Rejs=r.IdRejsu Join Okrety o ON o.IdOkretu=r.Okret
            WHERE rw.rejs=:new.rejs);
            EXCEPTION
        WHEN NO_DATA_FOUND THEN
        miejsca:=1;
   END;    
    
    BEGIN 
        SELECT wynik into zarezerwowane
        FROM(SELECT rejs,count(*) as wynik
            FROM Rezerwacje rw JOIN Rejsy r ON rw.Rejs=r.IdRejsu Join Okrety o ON o.IdOkretu=r.Okret
            WHERE rw.rejs=:new.rejs
            GROUP BY rejs);
        EXCEPTION
        WHEN NO_DATA_FOUND THEN
        zarezerwowane:=0;
   END;     
    IF miejsca<=zarezerwowane  THEN
         raise_application_error(-20010,'nie mo¿na dokonaæ rezerwacji brak wolnych miejsc');
    END IF;
END;

--obni¿a cenê o 10 % przy zmianie okretu
CREATE OR REPLACE TRIGGER zmiana_okretu AFTER UPDATE OF Okret ON Rejsy
FOR EACH ROW
BEGIN
    UPDATE rezerwacje set cena=cena-(cena*(1/10)) where rejs=:new.IdRejsu;
END;


--wyswietla o zmianie nazwiska kobiet po wyjœciu za maz
CREATE OR REPLACE TRIGGER ZmianaNazwiska AFTER UPDATE OF  Nazwisko ON Pracownicy 
FOR EACH ROW 
BEGIN
DBMS_OUTPUT.PUT_LINE('Pani  ' || :new.imie || ' wysza za ma¿ i zmienia nazwisko z ' 
|| :old.nazwisko || ' na '|| :new.nazwisko);
END;
-- pokazuje informacje o uzyskanym rabacie na rejs 
CREATE OR REPLACE TRIGGER Promocja AFTER UPDATE OF  Cena ON Rezerwacje
FOR EACH ROW 
BEGIN
if :new.cena<:old.cena then 
DBMS_OUTPUT.PUT_LINE('W zwiazku z promocja obni¿ono koszt rejsu z ' || :old.cena || ' na ' || :new.cena);
END IF;
END;

--podstawowe zapytania do testów
select * from klienci;
select * from Pracownicy;
select * from okrety;
select * from rejsy;
select * from rezerwacje;
--widoki
select * from Dekady;
select * from porownaj;
-- komunikaty konsoli

SET SERVEROUTPUT ON;

--test wyzwalacza wolne_miejsca
INSERT INTO Okrety VALUES
(6,'Katamaran','Odyseusz',1,TO_DATE ('06-07-2017','dd-mm-yyyy'));
INSERT INTO Rejsy VALUES
('6','6',TO_DATE('02-08-2018','dd-mm-yyyy'),TO_DATE('02-08-2018','dd-mm-yyyy'),'Gdañsk->Hel');
INSERT INTO Rezerwacje  VALUES
('6','6','1 osobowa normalna','1000','2');
INSERT INTO Rezerwacje  VALUES
('6','6','1 osobowa normalna','1000','5');
--test wyzwalacza zmiana_okretu
select cena
FROM Rezerwacje rw JOIN Rejsy r ON rw.Rejs=r.IdRejsu 
WHERE rejs=6;

update rejsy set okret=5 where Idrejsu=6;

select cena
FROM Rezerwacje rw JOIN Rejsy r ON rw.Rejs=r.IdRejsu 
WHERE rejs=6;
--test wyzwalacza promocja
update rezerwacje set cena=600 where IdRezerwawcji=6;
commit;
--test wyzwalacza ZmianaNazwiska
update pracownicy set nazwisko='kowal' where IdPracownika=1;
commit;

--usuwanie tabel i wyzwalaczy ktore sa z nim zwiazane
drop table klienci cascade constraints;
drop table pracownicy cascade constraints;
drop table okrety cascade constraints;
drop table rejsy cascade constraints;
drop table rezerwacje cascade constraints;
commit;






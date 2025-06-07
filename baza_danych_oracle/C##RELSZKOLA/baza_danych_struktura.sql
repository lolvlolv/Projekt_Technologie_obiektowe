CREATE TABLE klasy (
   klasa_id NUMBER NOT NULL,
   nazwa VARCHAR2(20) NOT NULL,
   PRIMARY KEY (klasa_id)
);
/
CREATE TABLE adresy (
   adres_id NUMBER NOT NULL,
   ulica VARCHAR2(100),
   miasto VARCHAR2(50),
   kod_pocztowy VARCHAR2(10),
   PRIMARY KEY (adres_id)
);
/
CREATE TABLE uczniowie (
   uczen_id NUMBER NOT NULL,
   imie VARCHAR2(50) NOT NULL,
   nazwisko VARCHAR2(50) NOT NULL,
   pesel VARCHAR2(11) NOT NULL,
   adres_id NUMBER,
   klasa_id NUMBER NOT NULL,
   PRIMARY KEY (uczen_id),
   FOREIGN KEY (klasa_id) REFERENCES klasy(klasa_id),
   FOREIGN KEY (adres_id) REFERENCES adresy(adres_id)
);
/
CREATE TABLE nauczyciele (
   nauczyciel_id NUMBER NOT NULL,
   imie VARCHAR2(50) NOT NULL,
   nazwisko VARCHAR2(50) NOT NULL,
   pesel VARCHAR2(11) NOT NULL,
   adres_id NUMBER,
   przedmiot VARCHAR2(100),
   PRIMARY KEY (nauczyciel_id),
   FOREIGN KEY (adres_id) REFERENCES adresy(adres_id)
);
/
CREATE TABLE przedmioty (
  przedmiot_id NUMBER PRIMARY KEY,
  nazwa        VARCHAR2(100) NOT NULL UNIQUE
);
/
CREATE TABLE dni_tygodnia (
   dzien_id NUMBER NOT NULL,
   nazwa VARCHAR2(15) NOT NULL UNIQUE,
   PRIMARY KEY (dzien_id)
);
/
CREATE TABLE plan_zajec (
  plan_id        NUMBER PRIMARY KEY,
  klasa_id       NUMBER NOT NULL REFERENCES klasy(klasa_id),
  przedmiot_id   NUMBER NOT NULL REFERENCES przedmioty(przedmiot_id),
  nauczyciel_id  NUMBER NOT NULL REFERENCES nauczyciele(nauczyciel_id),
  dzien_id       NUMBER NOT NULL REFERENCES dni_tygodnia(dzien_id),
  godz_start     VARCHAR2(5) NOT NULL,
  godz_end       VARCHAR2(5) NOT NULL
);
/
CREATE TABLE oceny (
  ocena_id       NUMBER PRIMARY KEY,
  uczen_id       NUMBER NOT NULL REFERENCES uczniowie(uczen_id),
  przedmiot_id   NUMBER NOT NULL REFERENCES przedmioty(przedmiot_id),
  ocena          NUMBER NOT NULL CHECK (ocena BETWEEN 1 AND 6),
  data_wstawienia DATE DEFAULT SYSDATE
);
/
CREATE TABLE wychowawcy (
  klasa_id       NUMBER PRIMARY KEY REFERENCES klasy(klasa_id),
  nauczyciel_id  NUMBER NOT NULL REFERENCES nauczyciele(nauczyciel_id)
);



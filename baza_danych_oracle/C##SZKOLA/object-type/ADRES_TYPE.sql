-- Typ adresu
CREATE OR REPLACE TYPE C##SZKOLA.adres_type AS OBJECT (
  ulica     VARCHAR2(100),
  miasto    VARCHAR2(50),
  kod_poczt VARCHAR2(10)
);
/
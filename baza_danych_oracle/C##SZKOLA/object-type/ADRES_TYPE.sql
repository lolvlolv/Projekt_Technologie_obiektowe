CREATE OR REPLACE TYPE adres_type AS OBJECT (
    ulica     VARCHAR2(100),
    miasto    VARCHAR2(50),
    kod_poczt VARCHAR2(10)
);
/
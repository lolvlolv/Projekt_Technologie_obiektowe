-- Typ pochodny nauczyciel
CREATE OR REPLACE TYPE C##SZKOLA.nauczyciel_type UNDER C##SZKOLA.osoba_type (
  przedmiot VARCHAR2(50)
);
/
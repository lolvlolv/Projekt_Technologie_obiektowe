-- Typ pochodny uczen
CREATE OR REPLACE TYPE C##SZKOLA.uczen_type UNDER C##SZKOLA.osoba_type (
  klasa VARCHAR2(50),
  przedmioty C##SZKOLA.przedmioty_list,
  oceny C##SZKOLA.oceny_list
);
/
-- Typ ocena
CREATE OR REPLACE TYPE C##SZKOLA.ocena_type AS OBJECT (
  uczen_ref      REF C##SZKOLA.uczen_type,
  przedmiot_ref  REF C##SZKOLA.przedmiot_type,
  ocena          NUMBER,
  data_wstawienia DATE
);
/
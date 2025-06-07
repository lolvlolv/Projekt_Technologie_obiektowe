-- Typ przedmiot
CREATE OR REPLACE TYPE C##SZKOLA.przedmiot_type AS OBJECT (
  przedmiot_id NUMBER,
  nazwa        VARCHAR2(100)
) NOT FINAL;
/
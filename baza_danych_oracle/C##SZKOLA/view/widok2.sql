-- Widok 2: srednie oceny
CREATE OR REPLACE VIEW C##SZKOLA.WIDOK_SREDNIE_OCENY AS
SELECT
  DEREF(o.uczen_ref).pelne_nazwisko() AS uczen,
  DEREF(o.przedmiot_ref).nazwa AS przedmiot,
  ROUND(AVG(o.ocena), 2) AS srednia_ocena
FROM C##SZKOLA.oceny o
GROUP BY DEREF(o.uczen_ref).pelne_nazwisko(), DEREF(o.przedmiot_ref).nazwa
ORDER BY uczen, przedmiot;
/
-- Widok 3: Wychowawcy
CREATE OR REPLACE VIEW C##SZKOLA.WIDOK_WYCHOWAWCY AS
SELECT
  wu.id_ucznia,
  wu.imie_ucznia || ' ' || wu.nazwisko_ucznia AS uczen,
  u.klasa AS nazwa_klasy,
  n.pelne_nazwisko() AS wychowawca,
  n.przedmiot AS przedmiot_wychowawcy
FROM C##SZKOLA.wychowawca_ucznia wu
JOIN C##SZKOLA.uczniowie u ON wu.id_ucznia = u.id
JOIN C##SZKOLA.nauczyciele n ON wu.wychowawca.id = n.id
ORDER BY u.klasa, uczen;
/
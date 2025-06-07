-- Widok 6: Pełne nazwiska uczniów i wychowawców
CREATE OR REPLACE VIEW C##SZKOLA.WIDOK_UCZEN_WYCHOWAWCA_FULLNAME AS
SELECT
  u.pelne_nazwisko() AS uczen,
  u.klasa AS nazwa_klasy,
  n.pelne_nazwisko() AS wychowawca,
  n.przedmiot AS przedmiot_wychowawcy
FROM C##SZKOLA.wychowawca_ucznia wu
JOIN C##SZKOLA.uczniowie u ON wu.id_ucznia = u.id
JOIN C##SZKOLA.nauczyciele n ON wu.wychowawca.id = n.id
ORDER BY u.klasa, u.pelne_nazwisko();
/
-- Widok 4: Uczniowie w klasach
CREATE OR REPLACE VIEW C##SZKOLA.WIDOK_UCZNIOWIE_KLASY AS
SELECT
  u.klasa AS nazwa_klasy,
  u.pelne_nazwisko() AS uczen,
  u.pesel
FROM C##SZKOLA.uczniowie u
ORDER BY u.klasa, uczen;
/
-- Widok 5: Nauczyciele i ich przedmioty w planie
CREATE OR REPLACE VIEW C##SZKOLA.WIDOK_NAUCZYCIELE_PRZEDMIOTY AS
SELECT
  n.pelne_nazwisko() AS nauczyciel,
  n.przedmiot AS specjalizacja_nauczyciela,
  p.nazwa AS przedmiot_w_plan,
  k.nazwa AS klasa,
  pz.dzien_tygodnia,
  pz.godz_start,
  pz.godz_end
FROM C##SZKOLA.plan_zajec pz
JOIN C##SZKOLA.nauczyciele n ON pz.id_nauczyciela = n.id
JOIN C##SZKOLA.przedmioty p ON pz.id_przedmiotu = p.przedmiot_id
JOIN C##SZKOLA.klasy k ON pz.id_klasy = k.klasa_id
ORDER BY nauczyciel, klasa, pz.dzien_tygodnia, pz.godz_start;
/
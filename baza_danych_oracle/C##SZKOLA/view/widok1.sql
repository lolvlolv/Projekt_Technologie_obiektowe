-- Widok 1: Plan zajęć dla klas
CREATE OR REPLACE VIEW C##SZKOLA.WIDOK_PLAN_ZAJEC_KLAS AS
SELECT
  k.nazwa AS klasa,
  p.nazwa AS przedmiot,
  n.pelne_nazwisko() AS nauczyciel,
  pz.dzien_tygodnia,
  pz.godz_start,
  pz.godz_end
FROM C##SZKOLA.plan_zajec pz
JOIN C##SZKOLA.klasy k ON pz.id_klasy = k.klasa_id
JOIN C##SZKOLA.przedmioty p ON pz.id_przedmiotu = p.przedmiot_id
JOIN C##SZKOLA.nauczyciele n ON pz.id_nauczyciela = n.id
ORDER BY k.nazwa, pz.dzien_tygodnia, pz.godz_start;
/
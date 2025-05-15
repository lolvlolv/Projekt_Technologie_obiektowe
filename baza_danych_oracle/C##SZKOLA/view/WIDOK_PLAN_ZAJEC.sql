create view WIDOK_PLAN_ZAJEC as
SELECT
  p.id_planu,
  k.nazwa AS nazwa_klasy,
  pr.nazwa AS nazwa_przedmiotu,
  n.imie || ' ' || n.nazwisko AS nauczyciel,
  p.dzien_tygodnia,
  p.godz_start,
  p.godz_end
FROM
  plan_zajec p
  JOIN klasy k ON p.id_klasy = k.KLASA_ID
  JOIN przedmioty pr ON p.id_przedmiotu = pr.przedmiot_id
  JOIN nauczyciele n ON p.id_nauczyciela = n.id
/


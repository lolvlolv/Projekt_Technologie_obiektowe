CREATE OR REPLACE VIEW widok_plan_zajec AS
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
    JOIN klasy k ON p.id_klasy = k.klasa_id
    JOIN przedmioty pr ON p.id_przedmiotu = pr.przedmiot_id
    JOIN nauczyciele n ON p.id_nauczyciela = n.id;
/
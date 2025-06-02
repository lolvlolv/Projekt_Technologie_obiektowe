SELECT
    p.id_planu,
    k.nazwa AS klasa,
    pr.nazwa AS przedmiot,
    n.pelne_nazwisko() AS nauczyciel,
    p.dzien_tygodnia,
    p.godz_start,
    p.godz_end
FROM plan_zajec p
JOIN klasy k ON p.id_klasy = k.klasa_id
JOIN przedmioty pr ON p.id_przedmiotu = pr.przedmiot_id
JOIN nauczyciele n ON p.id_nauczyciela = n.id
WHERE k.nazwa = '3A';
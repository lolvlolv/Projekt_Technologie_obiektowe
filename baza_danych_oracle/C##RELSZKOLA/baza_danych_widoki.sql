CREATE OR REPLACE VIEW C##RELSZKOLA.WIDOK_PLAN_ZAJEC_KLAS AS
SELECT
    k.nazwa AS klasa,
    p.nazwa AS przedmiot,
    n.imie || ' ' || n.nazwisko AS nauczyciel,
    d.nazwa AS dzien_tygodnia,
    pz.godz_start,
    pz.godz_end
FROM C##RELSZKOLA.plan_zajec pz
JOIN C##RELSZKOLA.klasy k ON pz.klasa_id = k.klasa_id
JOIN C##RELSZKOLA.przedmioty p ON pz.przedmiot_id = p.przedmiot_id
JOIN C##RELSZKOLA.nauczyciele n ON pz.nauczyciel_id = n.nauczyciel_id
JOIN C##RELSZKOLA.dni_tygodnia d ON pz.dzien_id = d.dzien_id
ORDER BY k.nazwa, d.dzien_id, pz.godz_start;
/
/
CREATE OR REPLACE VIEW C##RELSZKOLA.WIDOK_SREDNIE_OCENY AS
SELECT
    u.imie || ' ' || u.nazwisko AS uczen,
    p.nazwa AS przedmiot,
    ROUND(AVG(o.ocena), 2) AS srednia_ocena
FROM C##RELSZKOLA.oceny o
JOIN C##RELSZKOLA.uczniowie u ON o.uczen_id = u.uczen_id
JOIN C##RELSZKOLA.przedmioty p ON o.przedmiot_id = p.przedmiot_id
GROUP BY u.imie, u.nazwisko, p.nazwa
ORDER BY uczen, przedmiot;
/
/
CREATE OR REPLACE VIEW C##RELSZKOLA.WIDOK_WYCHOWAWCY_KLAS AS
SELECT
    u.uczen_id,
    u.imie || ' ' || u.nazwisko AS uczen,
    k.nazwa AS nazwa_klasy,
    n.imie || ' ' || n.nazwisko AS wychowawca,
    n.przedmiot AS przedmiot_wychowawcy
FROM C##RELSZKOLA.wychowawcy w
JOIN C##RELSZKOLA.uczniowie u ON w.klasa_id = u.klasa_id
JOIN C##RELSZKOLA.nauczyciele n ON w.nauczyciel_id = n.nauczyciel_id
JOIN C##RELSZKOLA.klasy k ON u.klasa_id = k.klasa_id
ORDER BY nazwa_klasy, uczen;
/
CREATE OR REPLACE VIEW C##RELSZKOLA.WIDOK_UCZNIOWIE_KLASY AS
SELECT
    k.nazwa AS nazwa_klasy,
    u.imie || ' ' || u.nazwisko AS uczen,
    u.pesel
FROM C##RELSZKOLA.uczniowie u
JOIN C##RELSZKOLA.klasy k ON u.klasa_id = k.klasa_id
ORDER BY k.nazwa, uczen;
/
CREATE OR REPLACE VIEW C##RELSZKOLA.WIDOK_NAUCZYCIELE_PRZEDMIOTY AS
SELECT
    n.imie || ' ' || n.nazwisko AS nauczyciel,
    p.nazwa AS przedmiot_w_plan,
    k.nazwa AS klasa,
    d.nazwa AS dzien_tygodnia,
    pz.godz_start,
    pz.godz_end
FROM C##RELSZKOLA.plan_zajec pz
JOIN C##RELSZKOLA.nauczyciele n ON pz.nauczyciel_id = n.nauczyciel_id
JOIN C##RELSZKOLA.przedmioty p ON pz.przedmiot_id = p.przedmiot_id
JOIN C##RELSZKOLA.klasy k ON pz.klasa_id = k.klasa_id
JOIN C##RELSZKOLA.dni_tygodnia d ON pz.dzien_id = d.dzien_id
ORDER BY nauczyciel, klasa, d.dzien_id, pz.godz_start;
/
CREATE OR REPLACE VIEW C##RELSZKOLA.WIDOK_UCZEN_WYCHOWAWCA_FULLNAME AS
SELECT
    u.imie || ' ' || u.nazwisko AS uczen,
    k.nazwa AS nazwa_klasy,
    n.imie || ' ' || n.nazwisko AS wychowawca,
    n.przedmiot AS przedmiot_wychowawcy
FROM C##RELSZKOLA.wychowawcy w
JOIN C##RELSZKOLA.uczniowie u ON w.klasa_id = u.klasa_id
JOIN C##RELSZKOLA.nauczyciele n ON w.nauczyciel_id = n.nauczyciel_id
JOIN C##RELSZKOLA.klasy k ON u.klasa_id = k.klasa_id
ORDER BY k.nazwa, uczen;
/


-- Widok 1: Plan zajęć dla każdej klasy
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


-- Widok 2: Średnie oceny uczniów
CREATE OR REPLACE VIEW C##SZKOLA.WIDOK_SREDNIE_OCENY AS
SELECT
 DEREF(o.uczen_ref).pelne_nazwisko() AS uczen,
 DEREF(o.przedmiot_ref).nazwa AS przedmiot,
 ROUND(AVG(o.ocena), 2) AS srednia_ocena
FROM C##SZKOLA.oceny o
GROUP BY DEREF(o.uczen_ref).pelne_nazwisko(), DEREF(o.przedmiot_ref).nazwa
ORDER BY uczen, przedmiot;
/


-- Widok 3: Wychowawcy klas
CREATE OR REPLACE VIEW C##SZKOLA.WIDOK_WYCHOWAWCY_KLAS AS
SELECT
   wk.id_klasy,
   wk.klasa AS nazwa_klasy,
   wk.wychowawca.pelne_nazwisko() AS wychowawca,
   wk.wychowawca.przedmiot AS przedmiot_wychowawcy
FROM C##SZKOLA.wychowawca_klasy wk
ORDER BY wk.klasa;
/


-- Widok 4: Uczniowie w klasach
CREATE OR REPLACE VIEW C##SZKOLA.WIDOK_UCZNIOWIE_KLASY AS
SELECT
 u.klasa AS nazwa_klasy,
 u.pelne_nazwisko() AS uczen,
 u.pesel
FROM C##SZKOLA.uczniowie u
ORDER BY u.klasa, uczen;
/


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


-- Widok 6: Pełne nazwiska uczniów i wychowawców
CREATE OR REPLACE VIEW C##SZKOLA.WIDOK_UCZEN_WYCHOWAWCA_FULLNAME AS
SELECT
   u.pelne_nazwisko() AS uczen,
   u.klasa AS nazwa_klasy,
   wk.wychowawca.pelne_nazwisko() AS wychowawca,
   wk.wychowawca.przedmiot AS przedmiot_wychowawcy
FROM C##SZKOLA.uczniowie u
JOIN C##SZKOLA.wychowawca_klasy wk ON u.klasa = wk.klasa
ORDER BY u.klasa, u.pelne_nazwisko();
/

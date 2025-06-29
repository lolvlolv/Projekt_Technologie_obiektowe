-- 1. Klasy
BEGIN
INSERT INTO C##SZKOLA.klasy (klasa_id, nazwa) VALUES (1, '1A');
INSERT INTO C##SZKOLA.klasy (klasa_id, nazwa) VALUES (2, '1B');
INSERT INTO C##SZKOLA.klasy (klasa_id, nazwa) VALUES (3, '1C');
INSERT INTO C##SZKOLA.klasy (klasa_id, nazwa) VALUES (4, '1D');
INSERT INTO C##SZKOLA.klasy (klasa_id, nazwa) VALUES (5, '2A');
INSERT INTO C##SZKOLA.klasy (klasa_id, nazwa) VALUES (6, '2B');
INSERT INTO C##SZKOLA.klasy (klasa_id, nazwa) VALUES (7, '2C');
INSERT INTO C##SZKOLA.klasy (klasa_id, nazwa) VALUES (8, '3A');
INSERT INTO C##SZKOLA.klasy (klasa_id, nazwa) VALUES (9, '3B');
INSERT INTO C##SZKOLA.klasy (klasa_id, nazwa) VALUES (10, '4A');
END;
/

-- 2. Przedmioty
BEGIN
INSERT INTO C##SZKOLA.przedmioty (przedmiot_id, nazwa) VALUES (1, 'Język Polski');
INSERT INTO C##SZKOLA.przedmioty (przedmiot_id, nazwa) VALUES (2, 'Matematyka');
INSERT INTO C##SZKOLA.przedmioty (przedmiot_id, nazwa) VALUES (3, 'Informatyka');
INSERT INTO C##SZKOLA.przedmioty (przedmiot_id, nazwa) VALUES (4, 'Fizyka');
INSERT INTO C##SZKOLA.przedmioty (przedmiot_id, nazwa) VALUES (5, 'Chemia');
INSERT INTO C##SZKOLA.przedmioty (przedmiot_id, nazwa) VALUES (6, 'Biologia');
INSERT INTO C##SZKOLA.przedmioty (przedmiot_id, nazwa) VALUES (7, 'Historia');
INSERT INTO C##SZKOLA.przedmioty (przedmiot_id, nazwa) VALUES (8, 'Geografia');
INSERT INTO C##SZKOLA.przedmioty (przedmiot_id, nazwa) VALUES (9, 'Wychowanie Fizyczne');
INSERT INTO C##SZKOLA.przedmioty (przedmiot_id, nazwa) VALUES (10, 'Język Angielski');
END;
/

-- 3. Nauczyciele
BEGIN
INSERT INTO C##SZKOLA.nauczyciele VALUES (
    C##SZKOLA.nauczyciel_type(1, 'Marcelina', 'Gajos', '12345678901', C##SZKOLA.adres_type('Szkolna 2', 'Warszawa', '00-002'), 'Język Polski')
);
INSERT INTO C##SZKOLA.nauczyciele VALUES (
    C##SZKOLA.nauczyciel_type(2, 'Zbigniew', 'Krzos', '12345678902', C##SZKOLA.adres_type('Matematyczna 5', 'Kraków', '30-010'), 'Matematyka')
);
INSERT INTO C##SZKOLA.nauczyciele VALUES (
    C##SZKOLA.nauczyciel_type(3, 'Dawid', 'Stal', '12345678903', C##SZKOLA.adres_type('Informatyczna 9', 'Poznań', '60-020'), 'Informatyka')
);
INSERT INTO C##SZKOLA.nauczyciele VALUES (
    C##SZKOLA.nauczyciel_type(4, 'Anna', 'Kowalska', '12345678904', C##SZKOLA.adres_type('Fizyczna 3', 'Gdańsk', '80-003'), 'Fizyka')
);
INSERT INTO C##SZKOLA.nauczyciele VALUES (
    C##SZKOLA.nauczyciel_type(5, 'Jan', 'Nowak', '12345678905', C##SZKOLA.adres_type('Chemiczna 7', 'Wrocław', '50-004'), 'Chemia')
);
INSERT INTO C##SZKOLA.nauczyciele VALUES (
    C##SZKOLA.nauczyciel_type(6, 'Katarzyna', 'Wiśniewska', '12345678906', C##SZKOLA.adres_type('Biologiczna 12', 'Łódź', '90-005'), 'Biologia')
);
INSERT INTO C##SZKOLA.nauczyciele VALUES (
    C##SZKOLA.nauczyciel_type(7, 'Piotr', 'Zieliński', '12345678907', C##SZKOLA.adres_type('Historyczna 15', 'Szczecin', '70-006'), 'Historia')
);
INSERT INTO C##SZKOLA.nauczyciele VALUES (
    C##SZKOLA.nauczyciel_type(8, 'Maria', 'Dąbrowska', '12345678908', C##SZKOLA.adres_type('Geograficzna 20', 'Lublin', '20-007'), 'Geografia')
);
INSERT INTO C##SZKOLA.nauczyciele VALUES (
    C##SZKOLA.nauczyciel_type(9, 'Tomasz', 'Lewandowski', '12345678909', C##SZKOLA.adres_type('Sportowa 25', 'Katowice', '40-008'), 'Wychowanie Fizyczne')
);
INSERT INTO C##SZKOLA.nauczyciele VALUES (
    C##SZKOLA.nauczyciel_type(10, 'Ewa', 'Szymańska', '12345678910', C##SZKOLA.adres_type('Angielska 30', 'Bydgoszcz', '85-009'), 'Język Angielski')
);
END;
/

-- 4. Uczniowie
DECLARE
v_przedmioty C##SZKOLA.przedmioty_list := C##SZKOLA.przedmioty_list();
BEGIN
-- Pobierz referencje do przedmiotów (np. Język Polski, Matematyka, Informatyka)
SELECT REF(p) BULK COLLECT INTO v_przedmioty
FROM C##SZKOLA.przedmioty p
WHERE p.przedmiot_id IN (1, 2, 3);




-- Wstaw uczniów
INSERT INTO C##SZKOLA.uczniowie VALUES (
    C##SZKOLA.uczen_type(1, 'Sylwester', 'Lenarczyk', '98765432101', C##SZKOLA.adres_type('Szkolna 1', 'Warszawa', '00-001'), '1A', v_przedmioty, C##SZKOLA.oceny_list())
);
INSERT INTO C##SZKOLA.uczniowie VALUES (
    C##SZKOLA.uczen_type(2, 'Franciszek', 'Teodorczyk', '98765432102', C##SZKOLA.adres_type('Lipowa 2', 'Kraków', '30-002'), '1B', v_przedmioty, C##SZKOLA.oceny_list())
);
INSERT INTO C##SZKOLA.uczniowie VALUES (
    C##SZKOLA.uczen_type(3, 'Jacek', 'Antecki', '98765432103', C##SZKOLA.adres_type('Długa 5', 'Poznań', '60-003'), '1C', v_przedmioty, C##SZKOLA.oceny_list())
);
INSERT INTO C##SZKOLA.uczniowie VALUES (
    C##SZKOLA.uczen_type(4, 'Mariola', 'Rudy', '98765432104', C##SZKOLA.adres_type('Krótka 8', 'Gdańsk', '80-004'), '1D', v_przedmioty, C##SZKOLA.oceny_list())
);
INSERT INTO C##SZKOLA.uczniowie VALUES (
    C##SZKOLA.uczen_type(5, 'Agnieszka', 'Sosna', '98765432105', C##SZKOLA.adres_type('Leśna 10', 'Wrocław', '50-005'), '2A', v_przedmioty, C##SZKOLA.oceny_list())
);
INSERT INTO C##SZKOLA.uczniowie VALUES (
    C##SZKOLA.uczen_type(6, 'Dawid', 'Pudlo', '98765432106', C##SZKOLA.adres_type('Polna 11', 'Łódź', '90-006'), '2B', v_przedmioty, C##SZKOLA.oceny_list())
);
INSERT INTO C##SZKOLA.uczniowie VALUES (
    C##SZKOLA.uczen_type(7, 'Wioletta', 'Bartosz', '98765432107', C##SZKOLA.adres_type('Zielona 12', 'Szczecin', '70-007'), '2C', v_przedmioty, C##SZKOLA.oceny_list())
);
INSERT INTO C##SZKOLA.uczniowie VALUES (
    C##SZKOLA.uczen_type(8, 'Alojzy', 'Kalisz', '98765432108', C##SZKOLA.adres_type('Parkowa 15', 'Lublin', '20-008'), '3A', v_przedmioty, C##SZKOLA.oceny_list())
);
INSERT INTO C##SZKOLA.uczniowie VALUES (
    C##SZKOLA.uczen_type(9, 'Klaudia', 'Wójcik', '98765432109', C##SZKOLA.adres_type('Słoneczna 18', 'Katowice', '40-009'), '3B', v_przedmioty, C##SZKOLA.oceny_list())
);
INSERT INTO C##SZKOLA.uczniowie VALUES (
    C##SZKOLA.uczen_type(10, 'Michał', 'Kowalczyk', '98765432110', C##SZKOLA.adres_type('Kwiatowa 20', 'Bydgoszcz', '85-010'), '4A', v_przedmioty, C##SZKOLA.oceny_list())
);
END;
/


-- 5. Plan zajęć
BEGIN
INSERT INTO C##SZKOLA.plan_zajec (id_planu, id_klasy, id_przedmiotu, id_nauczyciela, dzien_tygodnia, godz_start, godz_end)
VALUES (1, 1, 2, 2, 'Poniedziałek', '09:00', '09:45');
INSERT INTO C##SZKOLA.plan_zajec (id_planu, id_klasy, id_przedmiotu, id_nauczyciela, dzien_tygodnia, godz_start, godz_end)
VALUES (2, 1, 1, 1, 'Poniedziałek', '10:00', '10:45');
INSERT INTO C##SZKOLA.plan_zajec (id_planu, id_klasy, id_przedmiotu, id_nauczyciela, dzien_tygodnia, godz_start, godz_end)
VALUES (3, 2, 3, 3, 'Wtorek', '08:00', '08:45');
INSERT INTO C##SZKOLA.plan_zajec (id_planu, id_klasy, id_przedmiotu, id_nauczyciela, dzien_tygodnia, godz_start, godz_end)
VALUES (4, 3, 4, 4, 'Środa', '09:00', '09:45');
INSERT INTO C##SZKOLA.plan_zajec (id_planu, id_klasy, id_przedmiotu, id_nauczyciela, dzien_tygodnia, godz_start, godz_end)
VALUES (5, 4, 5, 5, 'Czwartek', '10:00', '10:45');
INSERT INTO C##SZKOLA.plan_zajec (id_planu, id_klasy, id_przedmiotu, id_nauczyciela, dzien_tygodnia, godz_start, godz_end)
VALUES (6, 5, 6, 6, 'Piątek', '11:00', '11:45');
INSERT INTO C##SZKOLA.plan_zajec (id_planu, id_klasy, id_przedmiotu, id_nauczyciela, dzien_tygodnia, godz_start, godz_end)
VALUES (7, 6, 7, 7, 'Poniedziałek', '12:00', '12:45');
INSERT INTO C##SZKOLA.plan_zajec (id_planu, id_klasy, id_przedmiotu, id_nauczyciela, dzien_tygodnia, godz_start, godz_end)
VALUES (8, 7, 8, 8, 'Wtorek', '13:00', '13:45');
INSERT INTO C##SZKOLA.plan_zajec (id_planu, id_klasy, id_przedmiotu, id_nauczyciela, dzien_tygodnia, godz_start, godz_end)
VALUES (9, 8, 9, 9, 'Środa', '08:00', '08:45');
INSERT INTO C##SZKOLA.plan_zajec (id_planu, id_klasy, id_przedmiotu, id_nauczyciela, dzien_tygodnia, godz_start, godz_end)
VALUES (10, 9, 10, 10, 'Czwartek', '09:00', '09:45');
END;
/

--6 Oceny
BEGIN
-- Ocena 1: Uczeń 1, Język Polski
C##SZKOLA.dodaj_ocene(
    p_id_ucznia     => 1,
    p_id_przedmiotu => 1,
    p_ocena         => 5,
    p_data_wstawienia => SYSDATE
);

-- Ocena 2: Uczeń 2, Matematyka
C##SZKOLA.dodaj_ocene(
    p_id_ucznia     => 2,
    p_id_przedmiotu => 2,
    p_ocena         => 4,
    p_data_wstawienia => SYSDATE
);

-- Ocena 3: Uczeń 3, Informatyka
C##SZKOLA.dodaj_ocene(
    p_id_ucznia     => 3,
    p_id_przedmiotu => 3,
    p_ocena         => 3,
    p_data_wstawienia => SYSDATE
);

-- Ocena 4: Uczeń 4, Fizyka
C##SZKOLA.dodaj_ocene(
    p_id_ucznia     => 4,
    p_id_przedmiotu => 4,
    p_ocena         => 6,
    p_data_wstawienia => SYSDATE
);

-- Ocena 5: Uczeń 5, Chemia
C##SZKOLA.dodaj_ocene(
    p_id_ucznia     => 5,
    p_id_przedmiotu => 5,
    p_ocena         => 2,
    p_data_wstawienia => SYSDATE
);

-- Ocena 6: Uczeń 6, Biologia
C##SZKOLA.dodaj_ocene(
    p_id_ucznia     => 6,
    p_id_przedmiotu => 6,
    p_ocena         => 5,
    p_data_wstawienia => SYSDATE
);

-- Ocena 7: Uczeń 7, Historia
C##SZKOLA.dodaj_ocene(
    p_id_ucznia     => 7,
    p_id_przedmiotu => 7,
    p_ocena         => 4,
    p_data_wstawienia => SYSDATE
);

-- Ocena 8: Uczeń 8, Geografia
C##SZKOLA.dodaj_ocene(
    p_id_ucznia     => 8,
    p_id_przedmiotu => 8,
    p_ocena         => 3,
    p_data_wstawienia => SYSDATE
);

-- Ocena 9: Uczeń 9, Wychowanie Fizyczne
C##SZKOLA.dodaj_ocene(
    p_id_ucznia     => 9,
    p_id_przedmiotu => 9,
    p_ocena         => 6,
    p_data_wstawienia => SYSDATE
);

-- Ocena 10: Uczeń 10, Język Angielski
C##SZKOLA.dodaj_ocene(
    p_id_ucznia     => 10,
    p_id_przedmiotu => 10,
    p_ocena         => 5,
    p_data_wstawienia => SYSDATE
);
END;
/

-- 7. Wychowawcy klas
BEGIN
C##SZKOLA.dodaj_wychowawce_klasy(1, 1);
C##SZKOLA.dodaj_wychowawce_klasy(2, 2);
C##SZKOLA.dodaj_wychowawce_klasy(3, 3);
C##SZKOLA.dodaj_wychowawce_klasy(4, 4);
C##SZKOLA.dodaj_wychowawce_klasy(5, 5);
C##SZKOLA.dodaj_wychowawce_klasy(6, 6);
C##SZKOLA.dodaj_wychowawce_klasy(7, 7);
C##SZKOLA.dodaj_wychowawce_klasy(8, 8);
C##SZKOLA.dodaj_wychowawce_klasy(9, 9);
C##SZKOLA.dodaj_wychowawce_klasy(10, 10);
END;

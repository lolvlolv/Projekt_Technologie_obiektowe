INSERT INTO C##RELSZKOLA.KLASY (KLASA_ID, NAZWA) VALUES (1, '1A');
INSERT INTO C##RELSZKOLA.KLASY (KLASA_ID, NAZWA) VALUES (2, '1B');
INSERT INTO C##RELSZKOLA.KLASY (KLASA_ID, NAZWA) VALUES (3, '1C');
INSERT INTO C##RELSZKOLA.KLASY (KLASA_ID, NAZWA) VALUES (4, '1D');
INSERT INTO C##RELSZKOLA.KLASY (KLASA_ID, NAZWA) VALUES (5, '2A');
INSERT INTO C##RELSZKOLA.KLASY (KLASA_ID, NAZWA) VALUES (6, '2B');
INSERT INTO C##RELSZKOLA.KLASY (KLASA_ID, NAZWA) VALUES (7, '2C');
INSERT INTO C##RELSZKOLA.KLASY (KLASA_ID, NAZWA) VALUES (8, '3A');
INSERT INTO C##RELSZKOLA.KLASY (KLASA_ID, NAZWA) VALUES (9, '3B');
INSERT INTO C##RELSZKOLA.KLASY (KLASA_ID, NAZWA) VALUES (10, '4A');


INSERT INTO C##RELSZKOLA.PRZEDMIOTY (PRZEDMIOT_ID, NAZWA) VALUES (1, 'Język Polski');
INSERT INTO C##RELSZKOLA.PRZEDMIOTY (PRZEDMIOT_ID, NAZWA) VALUES (2, 'Matematyka');
INSERT INTO C##RELSZKOLA.PRZEDMIOTY (PRZEDMIOT_ID, NAZWA) VALUES (3, 'Informatyka');
INSERT INTO C##RELSZKOLA.PRZEDMIOTY (PRZEDMIOT_ID, NAZWA) VALUES (4, 'Fizyka');
INSERT INTO C##RELSZKOLA.PRZEDMIOTY (PRZEDMIOT_ID, NAZWA) VALUES (5, 'Chemia');
INSERT INTO C##RELSZKOLA.PRZEDMIOTY (PRZEDMIOT_ID, NAZWA) VALUES (6, 'Biologia');
INSERT INTO C##RELSZKOLA.PRZEDMIOTY (PRZEDMIOT_ID, NAZWA) VALUES (7, 'Historia');
INSERT INTO C##RELSZKOLA.PRZEDMIOTY (PRZEDMIOT_ID, NAZWA) VALUES (8, 'Geografia');
INSERT INTO C##RELSZKOLA.PRZEDMIOTY (PRZEDMIOT_ID, NAZWA) VALUES (9, 'Wychowanie Fizyczne');
INSERT INTO C##RELSZKOLA.PRZEDMIOTY (PRZEDMIOT_ID, NAZWA) VALUES (10, 'Język Angielski');

-- 1. adresy
INSERT INTO C##RELSZKOLA.adresy VALUES (1, 'Szkolna 2', 'Warszawa', '00-002');
INSERT INTO C##RELSZKOLA.adresy VALUES (2, 'Matematyczna 5', 'Kraków', '30-010');
INSERT INTO C##RELSZKOLA.adresy VALUES (3, 'Informatyczna 9', 'Poznań', '60-020');
INSERT INTO C##RELSZKOLA.adresy VALUES (4, 'Fizyczna 3', 'Gdańsk', '80-003');
INSERT INTO C##RELSZKOLA.adresy VALUES (5, 'Chemiczna 7', 'Wrocław', '50-004');
INSERT INTO C##RELSZKOLA.adresy VALUES (6, 'Biologiczna 12', 'Łódź', '90-005');
INSERT INTO C##RELSZKOLA.adresy VALUES (7, 'Historyczna 15', 'Szczecin', '70-006');
INSERT INTO C##RELSZKOLA.adresy VALUES (8, 'Geograficzna 20', 'Lublin', '20-007');
INSERT INTO C##RELSZKOLA.adresy VALUES (9, 'Sportowa 25', 'Katowice', '40-008');
INSERT INTO C##RELSZKOLA.adresy VALUES (10, 'Angielska 30', 'Bydgoszcz', '85-009');
INSERT INTO C##RELSZKOLA.adresy VALUES (11, 'Szkolna 1', 'Warszawa', '00-001');
INSERT INTO C##RELSZKOLA.adresy VALUES (12, 'Lipowa 2', 'Kraków', '30-002');
INSERT INTO C##RELSZKOLA.adresy VALUES (13,'Długa 5', 'Poznań', '60-003');
INSERT INTO C##RELSZKOLA.adresy VALUES (14,'Krótka 8', 'Gdańsk', '80-004');
INSERT INTO C##RELSZKOLA.adresy VALUES (15,'Leśna 10', 'Wrocław', '50-005');
INSERT INTO C##RELSZKOLA.adresy VALUES (16,'Polna 11', 'Łódź', '90-006');
INSERT INTO C##RELSZKOLA.adresy VALUES (17,'Zielona 12', 'Szczecin', '70-007');
INSERT INTO C##RELSZKOLA.adresy VALUES (18,'Parkowa 15', 'Lublin', '20-008');
INSERT INTO C##RELSZKOLA.adresy VALUES (19, 'Słoneczna 18', 'Katowice', '40-009');
INSERT INTO C##RELSZKOLA.adresy VALUES (20, 'Kwiatowa 20', 'Bydgoszcz', '85-010');

INSERT INTO C##RELSZKOLA.nauczyciele VALUES (1, 'Marcelina', 'Gajos', '12345678901', 1, 'Język Polski');
INSERT INTO C##RELSZKOLA.nauczyciele VALUES (2, 'Zbigniew', 'Krzos', '12345678902', 2, 'Matematyka');
INSERT INTO C##RELSZKOLA.nauczyciele VALUES (3, 'Dawid', 'Stal', '12345678903', 3, 'Informatyka');
INSERT INTO C##RELSZKOLA.nauczyciele VALUES (4, 'Anna', 'Kowalska', '12345678904', 4, 'Fizyka');
INSERT INTO C##RELSZKOLA.nauczyciele VALUES (5, 'Jan', 'Nowak', '12345678905', 5, 'Chemia');
INSERT INTO C##RELSZKOLA.nauczyciele VALUES (6, 'Katarzyna', 'Wiśniewska', '12345678906', 6, 'Biologia');
INSERT INTO C##RELSZKOLA.nauczyciele VALUES (7, 'Piotr', 'Zieliński', '12345678907', 7, 'Historia');
INSERT INTO C##RELSZKOLA.nauczyciele VALUES (8, 'Maria', 'Dąbrowska', '12345678908', 8, 'Geografia');
INSERT INTO C##RELSZKOLA.nauczyciele VALUES (9, 'Tomasz', 'Lewandowski', '12345678909', 9, 'Wychowanie Fizyczne');
INSERT INTO C##RELSZKOLA.nauczyciele VALUES (10, 'Ewa', 'Szymańska', '12345678910', 10, 'Język Angielski');

INSERT INTO C##RELSZKOLA.uczniowie VALUES (1, 'Sylwester', 'Lenarczyk', '98765432101', 11, 1);
INSERT INTO C##RELSZKOLA.uczniowie VALUES (2, 'Franciszek', 'Teodorczyk', '98765432102', 12, 2);
INSERT INTO C##RELSZKOLA.uczniowie VALUES (3, 'Jacek', 'Antecki', '98765432103', 13, 3);
INSERT INTO C##RELSZKOLA.uczniowie VALUES (4, 'Mariola', 'Rudy', '98765432104', 14, 4);
INSERT INTO C##RELSZKOLA.uczniowie VALUES (5, 'Agnieszka', 'Sosna', '98765432105', 15, 5);
INSERT INTO C##RELSZKOLA.uczniowie VALUES (6, 'Dawid', 'Pudlo', '98765432106', 16, 6);
INSERT INTO C##RELSZKOLA.uczniowie VALUES (7, 'Wioletta', 'Bartosz', '98765432107', 17, 7);
INSERT INTO C##RELSZKOLA.uczniowie VALUES (8, 'Alojzy', 'Kalisz', '98765432108', 18, 8);
INSERT INTO C##RELSZKOLA.uczniowie VALUES (9, 'Klaudia', 'Wójcik', '98765432109', 19, 9);
INSERT INTO C##RELSZKOLA.uczniowie VALUES (10,'Michał', 'Kowalczyk', '98765432110', 20, 10);

INSERT INTO C##RELSZKOLA.dni_tygodnia (dzien_id, nazwa) VALUES (1, 'Poniedziałek');
INSERT INTO C##RELSZKOLA.dni_tygodnia (dzien_id, nazwa) VALUES (2, 'Wtorek');
INSERT INTO C##RELSZKOLA.dni_tygodnia (dzien_id, nazwa) VALUES (3, 'Środa');
INSERT INTO C##RELSZKOLA.dni_tygodnia (dzien_id, nazwa) VALUES (4, 'Czwartek');
INSERT INTO C##RELSZKOLA.dni_tygodnia (dzien_id, nazwa) VALUES (5, 'Piątek');

INSERT INTO C##RELSZKOLA.oceny (ocena_id, uczen_id, przedmiot_id, ocena, data_wstawienia) VALUES (1, 1, 1, 5, SYSDATE);
INSERT INTO C##RELSZKOLA.oceny (ocena_id, uczen_id, przedmiot_id, ocena, data_wstawienia) VALUES (2, 2, 1, 4, SYSDATE);
INSERT INTO C##RELSZKOLA.oceny (ocena_id, uczen_id, przedmiot_id, ocena, data_wstawienia) VALUES (3, 3, 1, 3, SYSDATE);
INSERT INTO C##RELSZKOLA.oceny (ocena_id, uczen_id, przedmiot_id, ocena, data_wstawienia) VALUES (4, 4, 1, 6, SYSDATE);
INSERT INTO C##RELSZKOLA.oceny (ocena_id, uczen_id, przedmiot_id, ocena, data_wstawienia) VALUES (5, 5, 1, 2, SYSDATE);
INSERT INTO C##RELSZKOLA.oceny (ocena_id, uczen_id, przedmiot_id, ocena, data_wstawienia) VALUES (6, 6, 1, 5, SYSDATE);
INSERT INTO C##RELSZKOLA.oceny (ocena_id, uczen_id, przedmiot_id, ocena, data_wstawienia) VALUES (7, 7, 1, 4, SYSDATE);
INSERT INTO C##RELSZKOLA.oceny (ocena_id, uczen_id, przedmiot_id, ocena, data_wstawienia) VALUES (8, 8, 1, 3, SYSDATE);
INSERT INTO C##RELSZKOLA.oceny (ocena_id, uczen_id, przedmiot_id, ocena, data_wstawienia) VALUES (9, 9, 1, 6, SYSDATE);
INSERT INTO C##RELSZKOLA.oceny (ocena_id, uczen_id, przedmiot_id, ocena, data_wstawienia) VALUES (10, 10, 1, 5, SYSDATE);

INSERT INTO C##RELSZKOLA.wychowawcy (uczen_id, nauczyciel_id) VALUES (1 , 1);
INSERT INTO C##RELSZKOLA.wychowawcy (uczen_id, nauczyciel_id) VALUES (2 , 2);
INSERT INTO C##RELSZKOLA.wychowawcy (uczen_id, nauczyciel_id) VALUES (3 , 3);
INSERT INTO C##RELSZKOLA.wychowawcy (uczen_id, nauczyciel_id) VALUES (4 , 4);
INSERT INTO C##RELSZKOLA.wychowawcy (uczen_id, nauczyciel_id) VALUES (5 , 5);
INSERT INTO C##RELSZKOLA.wychowawcy (uczen_id, nauczyciel_id) VALUES (6 , 6);
INSERT INTO C##RELSZKOLA.wychowawcy (uczen_id, nauczyciel_id) VALUES (7 , 7);
INSERT INTO C##RELSZKOLA.wychowawcy (uczen_id, nauczyciel_id) VALUES (8 , 8);
INSERT INTO C##RELSZKOLA.wychowawcy (uczen_id, nauczyciel_id) VALUES (9 , 9);
INSERT INTO C##RELSZKOLA.wychowawcy (uczen_id, nauczyciel_id) VALUES (10,10);

INSERT INTO C##RELSZKOLA.plan_zajec VALUES (1, 1, 2, 2, 1, '09:00', '09:45');
INSERT INTO C##RELSZKOLA.plan_zajec VALUES (2, 1, 1, 1, 1, '10:00', '10:45');
INSERT INTO C##RELSZKOLA.plan_zajec VALUES (3, 2, 3, 3, 2, '08:00', '08:45');
INSERT INTO C##RELSZKOLA.plan_zajec VALUES (4, 3, 4, 4, 3,  '09:00', '09:45');
INSERT INTO C##RELSZKOLA.plan_zajec VALUES (5, 4, 5, 5, 4, '10:00', '10:45');
INSERT INTO C##RELSZKOLA.plan_zajec VALUES (6, 5, 6, 6, 5, '11:00', '11:45');
INSERT INTO C##RELSZKOLA.plan_zajec VALUES (7, 6, 7, 7, 1, '12:00', '12:45');
INSERT INTO C##RELSZKOLA.plan_zajec VALUES (8, 7, 8, 8, 2, '13:00', '13:45');
INSERT INTO C##RELSZKOLA.plan_zajec VALUES (9, 8, 9, 9, 3, '08:00', '08:45');
INSERT INTO C##RELSZKOLA.plan_zajec VALUES (10, 9, 10, 10, 4, '09:00', '09:45');


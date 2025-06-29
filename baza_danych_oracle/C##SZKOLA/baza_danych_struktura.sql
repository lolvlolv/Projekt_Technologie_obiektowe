-- Typ adresu
CREATE OR REPLACE TYPE C##SZKOLA.adres_type AS OBJECT (
ulica     VARCHAR2(100),
miasto    VARCHAR2(50),
kod_poczt VARCHAR2(10)
)NOT FINAL;
/

-- Typ bazowy osoba, który jest abstrakcyjny, zawiera procedure przeciązeniowa-polimorfizm
CREATE OR REPLACE TYPE C##SZKOLA.osoba_type AS OBJECT (
id        NUMBER,
imie      VARCHAR2(50),
nazwisko  VARCHAR2(50),
pesel     VARCHAR2(11),
adres     C##SZKOLA.adres_type,
MEMBER PROCEDURE set_pesel(p_pesel IN VARCHAR2),
MEMBER FUNCTION get_pesel RETURN VARCHAR2,
MEMBER FUNCTION pelne_nazwisko RETURN VARCHAR2,
MEMBER FUNCTION opis_roli RETURN VARCHAR2 -- polimorfizm-uczen/nauczyciel
) NOT INSTANTIABLE NOT FINAL;
/

-- Implementacja metod dla typu obiektowego osoba_type/
—- Body jest niezbędne do tworzenia procedur i funkcji
CREATE OR REPLACE TYPE BODY C##SZKOLA.osoba_type AS
MEMBER PROCEDURE set_pesel(p_pesel IN VARCHAR2) IS
BEGIN
    IF LENGTH(p_pesel) = 11 AND REGEXP_LIKE(p_pesel, '^\d{11}$') THEN
        SELF.pesel := p_pesel;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Nieprawidłowy PESEL: musi zawierać dokładnie 11 cyfr.');
    END IF;
END;


MEMBER FUNCTION get_pesel RETURN VARCHAR2 IS
BEGIN
    RETURN SELF.pesel;
END;


MEMBER FUNCTION pelne_nazwisko RETURN VARCHAR2 IS
BEGIN
    RETURN imie || ' ' || nazwisko;
END;
END;
/

-- Typ przedmiot
CREATE OR REPLACE TYPE C##SZKOLA.przedmiot_type AS OBJECT (
przedmiot_id NUMBER,
nazwa        VARCHAR2(100)
) NOT FINAL;
/

-- Typ tablicowy dla listy przedmiotów
CREATE OR REPLACE TYPE C##SZKOLA.przedmioty_list AS VARRAY(15) OF REF C##SZKOLA.przedmiot_type;
/

-- Typ ocena z referencja
CREATE OR REPLACE TYPE C##SZKOLA.ocena_type AS OBJECT (
uczen_ref      REF C##SZKOLA.uczen_type,
przedmiot_ref  REF C##SZKOLA.przedmiot_type,
ocena          NUMBER,
data_wstawienia DATE
);
/

-- Typ tablicowy dla listy ocen
CREATE OR REPLACE TYPE C##SZKOLA.oceny_list AS VARRAY(15) OF REF C##SZKOLA.ocena_type;
/

-- Typ pochodny uczen z osoba
CREATE OR REPLACE TYPE C##SZKOLA.uczen_type UNDER C##SZKOLA.osoba_type (
klasa VARCHAR2(50),
przedmioty C##SZKOLA.przedmioty_list,
oceny C##SZKOLA.oceny_list,
OVERRIDING MEMBER FUNCTION opis_roli RETURN VARCHAR2
);
/

-- Polimorfizm dla ucznia
CREATE OR REPLACE TYPE BODY C##SZKOLA.uczen_type AS
OVERRIDING MEMBER FUNCTION opis_roli RETURN VARCHAR2 IS
BEGIN
RETURN 'Jestem uczniem klasy ' || SELF.klasa || '.';
END;
END; /
/

-- Typ pochodny nauczyciel z osoba
CREATE OR REPLACE TYPE C##SZKOLA.nauczyciel_type UNDER C##SZKOLA.osoba_type (
przedmiot VARCHAR2(50),
OVERRIDING MEMBER FUNCTION opis_roli RETURN VARCHAR2

);
/
-- Polimorfizm dla nauczyciela
CREATE OR REPLACE TYPE BODY C##SZKOLA.nauczyciel_type AS
OVERRIDING MEMBER FUNCTION opis_roli RETURN VARCHAR2 IS
BEGIN
RETURN 'Jestem nauczycielem ' || SELF.przedmiot || '.';
END;
END; /

-- Tabela klasy
CREATE TABLE C##SZKOLA.klasy (
klasa_id NUMBER PRIMARY KEY,
nazwa    VARCHAR2(20) NOT NULL
);
/

-- Tabela przedmioty
CREATE TABLE C##SZKOLA.przedmioty OF C##SZKOLA.przedmiot_type (
CONSTRAINT przedmioty_pk PRIMARY KEY(przedmiot_id)
);
/

-- Tabela nauczyciele
CREATE TABLE C##SZKOLA.nauczyciele OF C##SZKOLA.nauczyciel_type (
CONSTRAINT nauczyciele_pk PRIMARY KEY(id)
);
/

-- Tabela uczniowie
CREATE TABLE C##SZKOLA.uczniowie OF C##SZKOLA.uczen_type (
CONSTRAINT uczniowie_pk PRIMARY KEY(id)
);
/

-- Tabela oceny
CREATE TABLE C##SZKOLA.oceny OF C##SZKOLA.ocena_type;
/

-- Tabela plan zajęć
CREATE TABLE C##SZKOLA.plan_zajec (
id_planu       NUMBER PRIMARY KEY,
id_klasy       NUMBER NOT NULL REFERENCES C##SZKOLA.klasy(klasa_id),
id_przedmiotu  NUMBER NOT NULL REFERENCES C##SZKOLA.przedmioty(przedmiot_id),
id_nauczyciela NUMBER NOT NULL REFERENCES C##SZKOLA.nauczyciele(id),
dzien_tygodnia VARCHAR2(15) NOT NULL,
godz_start     VARCHAR2(5) NOT NULL,
godz_end       VARCHAR2(5) NOT NULL
);
/

-- Tabela wychowawca klasy
CREATE TABLE C##SZKOLA.wychowawca_klasy (
id_klasy NUMBER PRIMARY KEY REFERENCES C##SZKOLA.klasy(klasa_id),
klasa VARCHAR2(20),
wychowawca C##SZKOLA.nauczyciel_type
);
/

-- Procedura dodająca wychowawcę klasy
CREATE OR REPLACE PROCEDURE C##SZKOLA.dodaj_wychowawce_klasy(
p_id_klasy       IN NUMBER,
p_id_nauczyciela IN NUMBER
) IS
v_klasa       C##SZKOLA.klasy%ROWTYPE;
v_nauczyciel  C##SZKOLA.nauczyciel_type;
BEGIN
-- Pobierz klasę
SELECT * INTO v_klasa
FROM C##SZKOLA.klasy
WHERE klasa_id = p_id_klasy;

-- Pobierz nauczyciela
SELECT VALUE(n) INTO v_nauczyciel
FROM C##SZKOLA.nauczyciele n
WHERE n.id = p_id_nauczyciela;

-- Wstaw dane do tabeli wychowawca_klasy
INSERT INTO C##SZKOLA.wychowawca_klasy (
    id_klasy,
    klasa,
    wychowawca
)
VALUES (
    p_id_klasy,
    v_klasa.nazwa,
    v_nauczyciel
);
END;
/

CREATE OR REPLACE PROCEDURE C##SZKOLA.dodaj_ocene (
p_id_ucznia      IN NUMBER,
p_id_przedmiotu  IN NUMBER,
p_ocena          IN NUMBER,
p_data_wstawienia IN DATE
) IS
v_uczen_ref     REF C##SZKOLA.uczen_type;
v_przedmiot_ref REF C##SZKOLA.przedmiot_type;
BEGIN
SELECT REF(u) INTO v_uczen_ref
FROM C##SZKOLA.uczniowie u
WHERE u.id = p_id_ucznia;


SELECT REF(p) INTO v_przedmiot_ref
FROM C##SZKOLA.przedmioty p
WHERE p.przedmiot_id = p_id_przedmiotu;




INSERT INTO C##SZKOLA.oceny
VALUES (C##SZKOLA.ocena_type(v_uczen_ref, v_przedmiot_ref, p_ocena, p_data_wstawienia));
END;

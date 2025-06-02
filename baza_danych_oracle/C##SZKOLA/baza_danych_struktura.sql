-- Typ adresu
CREATE OR REPLACE TYPE adres_type AS OBJECT (
    ulica     VARCHAR2(100),
    miasto    VARCHAR2(50),
    kod_poczt VARCHAR2(10)
);
/

-- Typ bazowy osoba
CREATE OR REPLACE TYPE osoba_type AS OBJECT (
    id        NUMBER,
    imie      VARCHAR2(50),
    nazwisko  VARCHAR2(50),
    pesel     VARCHAR2(11),
    adres     adres_type,
    MEMBER PROCEDURE set_pesel(p_pesel IN VARCHAR2),
    MEMBER FUNCTION get_pesel RETURN VARCHAR2,
    MEMBER FUNCTION pelne_nazwisko RETURN VARCHAR2
) NOT FINAL;
/

-- Implementacja metod dla typu obiektowego osoba_type
-- Procedura set_pesel w przypadku podania niewłasciwego
-- numeru pesel zglosi wyjatek APP_ERROR
CREATE OR REPLACE TYPE BODY osoba_type AS
 MEMBER PROCEDURE set_pesel(p_pesel IN VARCHAR2) IS
 BEGIN
   IF LENGTH(p_pesel) = 11
      AND REGEXP_LIKE(p_pesel, '^\d{11}$') THEN
          --ustawienie pola pesel po waidacji
     SELF.pesel := p_pesel;
   ELSE
       -- blad jezeli format jest niewlasciwyS
     RAISE_APPLICATION_ERROR(-20001,
       'Nieprawidłowy PESEL: musi zawierać dokładnie 11 cyfr.');
   END IF;
 END;


--get_pesel- zwrocenie numeru przechowywanego w obiekcie
 MEMBER FUNCTION get_pesel RETURN VARCHAR2 IS
 BEGIN
   RETURN SELF.pesel;
 END;
-- polaczenie imienia i nazwiska z separatorem
 MEMBER FUNCTION pelne_nazwisko RETURN VARCHAR2 IS
 BEGIN
   RETURN imie || ' ' || nazwisko;
 END;


END;
/

-- Typ pochodny uczen
CREATE OR REPLACE TYPE uczen_type UNDER osoba_type (
    klasa VARCHAR2(50)
);
/

-- Typ pochodny nauczyciel
CREATE OR REPLACE TYPE nauczyciel_type UNDER osoba_type (
    przedmiot VARCHAR2(50)
);
/

-- Typ przedmiot
CREATE OR REPLACE TYPE przedmiot_type AS OBJECT (
    przedmiot_id NUMBER,
    nazwa        VARCHAR2(100)
) NOT FINAL;
/

-- Typ ocena
CREATE OR REPLACE TYPE ocena_type AS OBJECT (
    uczen_ref      REF uczen_type,
    przedmiot_ref  REF przedmiot_type,
    ocena          NUMBER,
    data_wstawienia DATE
);
/

-- Tabela uczniowie
CREATE TABLE uczniowie OF uczen_type (
    CONSTRAINT uczniowie_pk PRIMARY KEY(id)
);
/

<<<<<<< HEAD
CREATE TABLE UCZNIOWIE OF uczen_type
(
 CONSTRAINT uczniowie_pk PRIMARY KEY(id)
);
/


CREATE TABLE NAUCZYCIELE OF nauczyciel_type
(
 CONSTRAINT nauczyciele_pk PRIMARY KEY(id)
);


CREATE TABLE PRZEDMIOTY OF przedmiot_type
(
 CONSTRAINT przedmioty_pk PRIMARY KEY(przedmiot_id)
);
/

=======
-- Tabela nauczyciele
CREATE TABLE nauczyciele OF nauczyciel_type (
    CONSTRAINT nauczyciele_pk PRIMARY KEY(id)
);
/

-- Tabela przedmioty
CREATE TABLE przedmioty OF przedmiot_type (
    CONSTRAINT przedmioty_pk PRIMARY KEY(przedmiot_id)
);
/

-- Tabela oceny
CREATE TABLE oceny OF ocena_type;
/
>>>>>>> 3731c22 (zmiany)

-- Tabela klasy
CREATE TABLE klasy (
    klasa_id NUMBER PRIMARY KEY,
    nazwa    VARCHAR2(20) NOT NULL
);
/

-- Tabela plan zajęć
CREATE TABLE plan_zajec (
    id_planu       NUMBER PRIMARY KEY,
    id_klasy       NUMBER NOT NULL REFERENCES klasy,
    id_przedmiotu  NUMBER NOT NULL REFERENCES przedmioty,
    id_nauczyciela NUMBER NOT NULL REFERENCES nauczyciele,
    dzien_tygodnia VARCHAR2(15) NOT NULL,
    godz_start     VARCHAR2(5) NOT NULL,
    godz_end       VARCHAR2(5) NOT NULL
);
/

-- Tabela wychowawca ucznia
CREATE TABLE wychowawca_ucznia (
    id_ucznia        NUMBER PRIMARY KEY,
    imie_ucznia      VARCHAR2(50),
    nazwisko_ucznia  VARCHAR2(50),
    wychowawca       nauczyciel_type
);
/

-- Widok planu zajęć
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

-- Procedura dodająca wychowawcę
CREATE OR REPLACE PROCEDURE dodaj_wychowawce_ucznia(
    p_id_ucznia       IN NUMBER,
    p_id_nauczyciela  IN NUMBER
) IS
    v_uczen       uczen_type;
    v_nauczyciel  nauczyciel_type;
BEGIN
    SELECT VALUE(u) INTO v_uczen FROM uczniowie u WHERE u.id = p_id_ucznia;
    SELECT VALUE(n) INTO v_nauczyciel FROM nauczyciele n WHERE n.id = p_id_nauczyciela;

    INSERT INTO wychowawca_ucznia (
        id_ucznia,
        imie_ucznia,
        nazwisko_ucznia,
        wychowawca
    )
    VALUES (
        p_id_ucznia,
        v_uczen.imie,
        v_uczen.nazwisko,
        v_nauczyciel
    );
END;
/
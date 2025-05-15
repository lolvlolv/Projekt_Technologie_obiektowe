create TYPE osoba_type AS OBJECT (
 id        NUMBER,
 imie      VARCHAR2(50),
 nazwisko  VARCHAR2(50),
-- Prywatne pole pesel, dostępne tylko przez metody, zadeklarowane
 pesel     VARCHAR2(11),
--Metoda, ktora służydo ustawiania i pobierania PESEL
 MEMBER PROCEDURE set_pesel(p_pesel IN VARCHAR2),
 MEMBER FUNCTION get_pesel RETURN VARCHAR2,
--Metoda, ktora służy do ustawienia pelnego nazwiska
 MEMBER FUNCTION pelne_nazwisko RETURN VARCHAR2
) NOT FINAL
/

create TYPE BODY osoba_type AS
-- Implementacja metod dla typu obiektowego osoba_type
-- Procedura set_pesel w przypadku podania niewłasciwego
-- numeru pesel zglosi wyjatek APP_ERROR
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

create TYPE uczen_type UNDER OSOBA_TYPE (
    klasa VARCHAR2(50)
   )
/

create TYPE nauczyciel_type UNDER OSOBA_TYPE (
    przedmiot VARCHAR2(50)
   )
/

create TYPE address_type AS OBJECT (
 ulica     VARCHAR2(100),
 miasto    VARCHAR2(50),
 kod_poczt VARCHAR2(10)
)
/

create TYPE przedmiot_type AS OBJECT (
 przedmiot_id NUMBER,
 nazwa      VARCHAR2(100)
) NOT FINAL
/

create TYPE ocena_type AS OBJECT (
 uczen_ref   REF uczen_type,
 przedmiot_ref REF przedmiot_type,
 ocena       NUMBER,
 data_wstawienia DATE
)
/

create table OSOBY of OSOBA_TYPE
/

create table UCZNIOWIE of UCZEN_TYPE
/

create table NAUCZYCIELE of NAUCZYCIEL_TYPE
/

create table PRZEDMIOTY of PRZEDMIOT_TYPE
/

create table OCENY of OCENA_TYPE
/

create table KLASY
(
    KLASA_ID NUMBER       not null
        primary key,
    NAZWA    VARCHAR2(20) not null
)
/

create table PLAN_ZAJEC
(
    ID_PLANU       NUMBER       not null
        primary key,
    ID_KLASY       NUMBER       not null
        references KLASY,
    ID_PRZEDMIOTU  NUMBER       not null
        references PRZEDMIOTY,
    ID_NAUCZYCIELA NUMBER       not null
        references NAUCZYCIELE,
    DZIEN_TYGODNIA VARCHAR2(15) not null,
    GODZ_START     VARCHAR2(5)  not null,
    GODZ_END       VARCHAR2(5)  not null
)
/

create table WYCHOWAWCA_UCZNIA
(
    ID_UCZNIA  NUMBER not null
        primary key,
    WYCHOWAWCA NAUCZYCIEL_TYPE
)
/

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


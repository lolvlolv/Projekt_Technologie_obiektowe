CREATE OR REPLACE TYPE BODY osoba_type AS
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

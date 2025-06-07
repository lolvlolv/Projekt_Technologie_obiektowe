-- Implementacja metod dla typu obiektowego osoba_type
CREATE OR REPLACE TYPE BODY C##SZKOLA.osoba_type AS
  MEMBER PROCEDURE set_pesel(p_pesel IN VARCHAR2) IS
  BEGIN
      IF LENGTH(p_pesel) = 11 AND REGEXP_LIKE(p_pesel, '^\d{11}$') THEN
          -- ustawienie pola pesel po walidacji
          SELF.pesel := p_pesel;
      ELSE
          -- blad jezeli format jest niewlasciwy
          RAISE_APPLICATION_ERROR(-20001, 'Nieprawidłowy PESEL: musi zawierać dokładnie 11 cyfr.');
      END IF;
  END;

  -- get_pesel - zwrocenie numeru przechowywanego w obiekcie
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
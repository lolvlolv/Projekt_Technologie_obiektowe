-- Implementacja metod typu osoba_type
CREATE OR REPLACE TYPE BODY osoba_type AS
        -- Walidacja i przypisanie numeru PESEL
    MEMBER PROCEDURE set_pesel(p_pesel IN VARCHAR2) IS
    BEGIN
        IF LENGTH(p_pesel) = 11 AND REGEXP_LIKE(p_pesel, '^\d{11}$') THEN
            SELF.pesel := p_pesel;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Nieprawidłowy PESEL: musi zawierać dokładnie 11 cyfr.');
        END IF;
    END;

    -- Zwraca PESEL
    MEMBER FUNCTION get_pesel RETURN VARCHAR2 IS
    BEGIN
        RETURN SELF.pesel;
    END;

    -- Zwraca pełne nazwisko (imię + nazwisko)
    MEMBER FUNCTION pelne_nazwisko RETURN VARCHAR2 IS
    BEGIN
        RETURN imie || ' ' || nazwisko;
    END;
END;
/
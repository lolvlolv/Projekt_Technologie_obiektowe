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
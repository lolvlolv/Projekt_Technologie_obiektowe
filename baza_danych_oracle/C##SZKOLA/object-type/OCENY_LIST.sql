-- Typ tablicowy dla listy ocen
CREATE OR REPLACE TYPE C##SZKOLA.oceny_list AS VARRAY(15) OF REF C##SZKOLA.ocena_type;
/
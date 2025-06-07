-- Tabela wychowawca ucznia
CREATE TABLE C##SZKOLA.wychowawca_ucznia (
  id_ucznia        NUMBER PRIMARY KEY,
  imie_ucznia      VARCHAR2(50),
  nazwisko_ucznia  VARCHAR2(50),
  wychowawca       C##SZKOLA.nauczyciel_type
);
/
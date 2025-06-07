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
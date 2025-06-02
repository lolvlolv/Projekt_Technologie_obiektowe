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
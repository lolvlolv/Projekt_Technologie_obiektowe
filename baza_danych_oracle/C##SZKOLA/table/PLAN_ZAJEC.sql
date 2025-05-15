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


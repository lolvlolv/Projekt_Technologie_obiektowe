-- Procedura przypisująca wychowawcę uczniowi
CREATE OR REPLACE PROCEDURE dodaj_wychowawce_ucznia(
    p_id_ucznia       IN NUMBER,
    p_id_nauczyciela  IN NUMBER
) IS
    v_uczen       uczen_type;
    v_nauczyciel  REF nauczyciel_type;
BEGIN
    SELECT VALUE(u) INTO v_uczen FROM uczniowie u WHERE u.id = p_id_ucznia;
    SELECT REF(n) INTO v_nauczyciel FROM nauczyciele n WHERE n.id = p_id_nauczyciela;

    INSERT INTO wychowawca_ucznia (
        id_ucznia,
        imie_ucznia,
        nazwisko_ucznia,
        wychowawca
    )
    VALUES (
        p_id_ucznia,
        v_uczen.imie,
        v_uczen.nazwisko,
        v_nauczyciel
    );
END;
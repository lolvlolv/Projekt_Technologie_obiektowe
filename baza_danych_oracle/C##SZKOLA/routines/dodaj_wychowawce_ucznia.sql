-- Procedura dodająca wychowawcę
CREATE OR REPLACE PROCEDURE C##SZKOLA.dodaj_wychowawce_ucznia(
  p_id_ucznia       IN NUMBER,
  p_id_nauczyciela  IN NUMBER
) IS
  v_uczen       C##SZKOLA.uczen_type;
  v_nauczyciel  C##SZKOLA.NAUCZYCIEL_TYPE;

BEGIN
  SELECT VALUE(u) INTO v_uczen FROM C##SZKOLA.uczniowie u WHERE u.id = p_id_ucznia;
  SELECT VALUE(n) INTO v_nauczyciel FROM C##SZKOLA.nauczyciele n WHERE n.id = p_id_nauczyciela;

  INSERT INTO C##SZKOLA.wychowawca_ucznia (
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
/
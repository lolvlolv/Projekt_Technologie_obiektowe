CREATE OR REPLACE PROCEDURE dodaj_wychowawce_ucznia(
  p_id_ucznia IN NUMBER,
  p_id_nauczyciela IN NUMBER
) IS
  v_uczen uczen_type;
  v_nauczyciel nauczyciel_type;
BEGIN
  -- Pobierz ucznia
  SELECT VALUE(u) INTO v_uczen FROM uczniowie u WHERE u.id = p_id_ucznia;

  -- Pobierz nauczyciela
  SELECT VALUE(n) INTO v_nauczyciel FROM nauczyciele n WHERE n.id = p_id_nauczyciela;

  -- Wstaw do tabeli wychowawca_ucznia
  INSERT INTO wychowawca_ucznia (id_ucznia, imie_ucznia, nazwisko_ucznia, wychowawca)
  VALUES (p_id_ucznia, v_uczen.imie, v_uczen.nazwisko, v_nauczyciel);
END;
/
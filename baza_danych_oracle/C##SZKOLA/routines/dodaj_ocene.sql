-- procedura dodawania ocen
CREATE OR REPLACE PROCEDURE dodaj_ocene(
  p_id_ucznia       IN NUMBER,
  p_id_przedmiotu   IN NUMBER,
  p_ocena           IN NUMBER
) IS
  v_uczen_ref       REF uczen_type;
  v_przedmiot_ref   REF przedmiot_type;
BEGIN
  SELECT REF(u) INTO v_uczen_ref FROM uczniowie u WHERE u.id = p_id_ucznia;
  SELECT REF(p) INTO v_przedmiot_ref FROM przedmioty p WHERE p.przedmiot_id = p_id_przedmiotu;

  INSERT INTO oceny VALUES (
    ocena_type(v_uczen_ref, v_przedmiot_ref, p_ocena, SYSDATE)
  );
END;
/

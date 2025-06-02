
  -- Dodaj ocenę
  INSERT INTO oceny VALUES (
    ocena_type(
      v_uczen_ref,
      v_przedmiot_ref,
      5, -- ocena
      SYSDATE -- data wystawienia oceny
    )
  );

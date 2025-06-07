SELECT
    w.id_ucznia,
    uczen.pelne_nazwisko() AS uczen,
    DEREF(w.wychowawca).pelne_nazwisko() AS wychowawca
FROM wychowawca_ucznia w
JOIN uczniowie uczen ON w.id_ucznia = uczen.id;
SELECT
    u.id,
    u.pelne_nazwisko() AS pelne_nazwisko,
    u.adres.ulica,
    u.adres.miasto,
    u.adres.kod_poczt
FROM uczniowie u;
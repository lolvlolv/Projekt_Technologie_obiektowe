SELECT
    o.ocena,
    pr.nazwa AS przedmiot,
    o.data_wstawienia
FROM oceny o
JOIN przedmioty pr ON DEREF(o.przedmiot_ref).przedmiot_id = pr.przedmiot_id
WHERE DEREF(o.uczen_ref).id = 1;
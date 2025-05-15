create TYPE ocena_type AS OBJECT (
 uczen_ref   REF uczen_type,
 przedmiot_ref REF przedmiot_type,
 ocena       NUMBER,
 data_wstawienia DATE
)
/


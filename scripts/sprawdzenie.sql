-- PROCEDURY
-- przekazanie_aparatury(id aparatury, id pacjenta)

SELECT id_aparatury, nazwa, imie, nazwisko FROM specjalna_aparatura
LEFT OUTER JOIN pacjenci USING (id_pacjenta);

BEGIN
    przekazanie_aparatury(106,103);
    przekazanie_aparatury(103,103);
END;
/

SELECT id_aparatury, nazwa, imie, nazwisko FROM specjalna_aparatura
LEFT OUTER JOIN pacjenci USING (id_pacjenta);

-- zmiana_prowadzacego(id studenta, id lekarza)
SELECT id_lekarza, concat(concat(l.imie,' '), l.nazwisko) as opiekun,
count(s.id_studenta) as liczba_studentow
FROM studenci s
JOIN lekarze l USING(id_lekarza)
GROUP BY id_lekarza, concat(concat(l.imie,' '), l.nazwisko);

BEGIN
    zmiana_prowadzacego(102,101);
END;
/

SELECT id_lekarza, concat(concat(l.imie,' '), l.nazwisko) as opiekun,
count(s.id_studenta) as liczba_studentow
FROM studenci s
JOIN lekarze l USING(id_lekarza)
GROUP BY id_lekarza, concat(concat(l.imie,' '), l.nazwisko);

-- wypisz_ze_szpitala(id pacjenta);
SELECT * FROM pacjenci
JOIN historia_pobytow USING(id_pacjenta)
WHERE koniec_pobytu IS NULL;

-- blok wypisujacy pacjenta, ktory jest najdluzej w szpitalu
DECLARE 
    v_najdluzej_id  NUMBER;
BEGIN
    SELECT id_pacjenta INTO v_najdluzej_id
    FROM historia_pobytow
    WHERE koniec_pobytu IS NULL AND poczatek_pobytu = (
                            SELECT min(poczatek_pobytu)
                            FROM historia_pobytow 
                            WHERE koniec_pobytu IS NULL);
                            
    wypisz_ze_szpitala(v_najdluzej_id);
END;
/

SELECT * FROM pacjenci
JOIN historia_pobytow USING(id_pacjenta)
WHERE koniec_pobytu IS NULL;
--------------------------------------------------------------------------------
-- WYZWALACZE
-- sprzawdzenie wyzwalacza 
SELECT * FROM pacjenci 
JOIN historia_pobytow USING(id_pacjenta)
WHERE id_pacjenta = 101;

UPDATE HISTORIA_ZABIEGOW SET data_zabiegu = '44/05/16' WHERE id_historii_zabiegow = 110;

SELECT * FROM pacjenci 
JOIN historia_zabiegow USING(id_pacjenta)
WHERE id_pacjenta = 101;

UPDATE historia_zabiegow SET data_zabiegu = '18/05/16' WHERE id_historii_zabiegow = 110;

SELECT * FROM pacjenci 
JOIN historia_zabiegow USING(id_pacjenta)
WHERE id_pacjenta = 101;

--sprawdzenie dzialania wyzwalacza, ktory nie pozwala na przypisanie lekarza prowadzacego, jesli ma on wiecej niz 5 pacjentow 
INSERT INTO pacjenci VALUES('Jan', 'Kowalski', 12345678910, 113, 101);
INSERT INTO pacjenci VALUES('Adam', 'Nowak', 12345678911, 114, 101);
INSERT INTO pacjenci VALUES('Karolina', 'Leonczyk', 12345678912, 115, 101);

--wyswietlenie liczby wszytskich pracownikow szpitala
SELECT policz_wszystkich_pracownikow() FROM dual;

--wyswietlenie danych pacjentow wraz z liczba dni spedzonych w szpitalu
SELECT p.*, dni_w_szpitalu(id_pacjenta) AS dni_w_szpitalu
FROM pacjenci p;

--wyswietlenie oddzialow oraz liczby pielegniarek na nich pracujacych
SELECT id_oddzialu, o.nazwa, count(id_pielegniarki) AS liczba_pielegniarek
FROM oddzialy o 
INNER JOIN oddzialy_pielegniarki op USING(id_oddzialu)
GROUP BY id_oddzialu, o.nazwa
ORDER BY liczba_pielegniarek;

--wyswietlenie liczby pobytow pacjentow na danym oddziale, jesli bylo ich wiecej niz 1
SELECT id_oddzialu, o.nazwa, count(*) AS liczba_pobytow
FROM historia_pobytow hp
INNER JOIN sale s USING(id_sali)
INNER JOIN oddzialy o USING(id_oddzialu)
GROUP BY id_oddzialu, o.nazwa
HAVING count(*) > 1
ORDER BY count(*);


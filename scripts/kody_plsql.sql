-----------------------------------------------------------------------------------------------
-- PROCEDURY
-- Procedura przekazujca aparaturę pacjentowi
CREATE OR REPLACE PROCEDURE przekazanie_aparatury(a_id NUMBER, p_id NUMBER)
AS
    v_stary_pacjent_id NUMBER;
BEGIN
    SELECT ID_PACJENTA INTO v_stary_pacjent_id FROM SPECJALNA_APARATURA
    WHERE ID_APARATURY = a_id;
    
    IF v_stary_pacjent_id != p_id THEN
        UPDATE SPECJALNA_APARATURA SET ID_PACJENTA = p_id
        WHERE ID_APARATURY = a_id;
        dbms_output.put_line ('Przekazano aparature '|| a_id || ' pacjentowi '||p_id);
    ELSE dbms_output.put_line ('Aparatura jest juz przypisana do tego pacjenta.');
    END IF;
END;
/

--Procedura zmiany lekarza prowadzacego na takiego o mniejszej liczbie dtudentow
CREATE OR REPLACE PROCEDURE zmiana_prowadzacego(s_id NUMBER, l_id NUMBER)
AS
v_stary_lekarz_id NUMBER;
liczba_studentow NUMBER;
v_liczba_studentow NUMBER;
BEGIN
    SELECT ID_LEKARZA INTO v_stary_lekarz_id FROM STUDENCI
    WHERE ID_STUDENTA = s_id;
    
    SELECT COUNT(ID_LEKARZA) INTO v_liczba_studentow FROM STUDENCI;
    
    SELECT COUNT(ID_LEKARZA) INTO liczba_studentow FROM STUDENCI
    WHERE ID_LEKARZA = l_id;
    
    IF liczba_studentow < v_liczba_studentow THEN
        UPDATE STUDENCI SET ID_LEKARZA = l_id
        WHERE ID_STUDENTA = s_id;
        dbms_output.put_line ('Przekazano studenta '|| s_id || ' lekarzowi o mniejszej liczbie studentow o id: '||l_id);
    ELSE dbms_output.put_line ('Student jest już pod opieka lekarza o mniejszej liczbie studentow.');
    END IF;
END;
/

-- Procedura wypisujaca ze szpitala
CREATE OR REPLACE PROCEDURE wypisz_ze_szpitala(p_id NUMBER)
AS
    v_id_lekarza    NUMBER;
    v_max_poczatek  DATE;
BEGIN
 
    SELECT max(poczatek_pobytu) INTO v_max_poczatek FROM historia_pobytow
    WHERE id_pacjenta = p_id;
    
    SELECT id_lekarza INTO v_id_lekarza FROM pacjenci
    JOIN historia_pobytow USING(id_pacjenta)
    WHERE id_pacjenta = p_id AND poczatek_pobytu = v_max_poczatek;
   
    
    IF v_id_lekarza IS NOT NULL THEN
        UPDATE pacjenci SET id_lekarza = null
        WHERE id_pacjenta = p_id;
        
        UPDATE historia_pobytow SET koniec_pobytu = sysdate
        WHERE poczatek_pobytu = v_max_poczatek AND id_pacjenta = p_id;
        
        dbms_output.put_line('Pacjenta '||p_id||' zostal wypisany ze szpitala');
        
    ELSE dbms_output.put_line('Pacjent nie jest obecnie w szpitalu');
    END IF;

END;
/

-----------------------------------------------------------------------------------------------
-- WYZWALACZE
-- Wyzwalacz sprawdzajacy, czy zabieg jest zaplanowany na date w trakcie pobytu w szpitalu (z kursorem niejawnym)
CREATE OR REPLACE TRIGGER czy_zabieg_w_trakcie_pobytu
BEFORE INSERT OR UPDATE OF data_zabiegu ON HISTORIA_ZABIEGOW FOR EACH ROW
DECLARE
    v_poczatek DATE;
    v_koniec DATE;
BEGIN 
    FOR r_pobyt IN (
        SELECT poczatek_pobytu, koniec_pobytu FROM historia_pobytow
        WHERE :new.id_pacjenta = id_pacjenta )

    LOOP 
        IF :new.data_zabiegu < r_pobyt.poczatek_pobytu OR (r_pobyt.koniec_pobytu is not null AND :new.data_zabiegu > r_pobyt.koniec_pobytu)THEN
            dbms_output.put_line('Zabieg zaplanowany przed pobytem!');
            raise_application_error(-20002, 'Zabieg nie jest podczas pobytu!');
        ELSE
            EXIT;
        END IF;
    END LOOP;
    
END;
/

-- Wyzwalacz sorawdzajacy czy przy wprowadzaniu nowego pacjenta, lekarz mu przypisany nie ma wiecej niz 5 pacjentow
CREATE OR REPLACE TRIGGER czy_lekarz_ma_5_pacjentow
BEFORE INSERT OR UPDATE OF id_lekarza ON pacjenci FOR EACH ROW
DECLARE
    v_liczba_pacjentow NUMBER;
BEGIN 
    IF :new.id_lekarza IS NOT NULL THEN
        SELECT count(id_pacjenta) INTO v_liczba_pacjentow FROM pacjenci
        JOIN lekarze USING(id_lekarza)
        WHERE id_lekarza = :new.id_lekarza;
    
        IF v_liczba_pacjentow >= 5 THEN
            dbms_output.put_line('Lekarz ma już maksymalna liczbe pacjentow!');
            raise_application_error(-20003, 'Przekroczono liczbe dopuszczalnych pacjentow dla wybranego lekarza');
        END IF;
    END IF;
END;
/

-----------------------------------------------------------------------------------------------
-- KURSORY
-- Wyswietlanie oddzialow, na ktorych sa nie wiecej niz 3 sale (kursor + procedura?)
CREATE OR REPLACE PROCEDURE tylko_3_sal
IS
    CURSOR crr IS 
        SELECT e.nazwa, e.ID_ODDZIALU
        FROM ODDZIALY e
        WHERE 4 > (
            SELECT COUNT(ID_SALI) FROM SALE s
            WHERE s.ID_ODDZIALU = e.ID_ODDZIALU);
        
    v_name ODDZIALY.nazwa%type;
    v_id ODDZIALY.ID_ODDZIALU%type;
BEGIN
    dbms_output.put_line('Oddzialy, gdzie sa nie wiecej niz 3 sale: ');
    OPEN crr;
    LOOP 
        EXIT WHEN crr%NOTFOUND;
        FETCH crr INTO v_name, v_id;
        dbms_output.put_line( v_name || ', ');
    END LOOP;
    CLOSE crr;
END;
/

-- Wyswietlanie pacjentow, ktorzy sa w szpitalu po raz pierwszy
DECLARE  CURSOR kursor IS

    SELECT e.imie, e.nazwisko, e.id_pacjenta FROM pacjenci e 
    WHERE 2 > (SELECT COUNT(ID_POBYTU) FROM HISTORIA_POBYTOW s
                WHERE s.id_pacjenta = e.id_pacjenta);
                
    v_imie      pacjenci.imie%type;
    v_nazwisko  pacjenci.nazwisko%type;
    v_id        pacjenci.id_pacjenta%type;
    
BEGIN
    OPEN kursor;
    LOOP 
        EXIT WHEN kursor%NOTFOUND;
        FETCH kursor INTO v_imie, v_nazwisko, v_id;
        dbms_output.put_line('Pacjent, ktory jest w szpitalu pierwszy raz: ' || v_imie || ' ' || v_nazwisko);
    END LOOP;
    CLOSE kursor;
END;
/

-------------------------------------------------------------------------------------
--FUNKCJE
-- Funkcja zwracajaca liczbe wszystkich pracownikow szpitala
CREATE OR replace FUNCTION policz_wszystkich_pracownikow
RETURN NUMBER
AS
    v_lekarze NUMBER;
    v_pielegniarki NUMBER;
    v_studenci NUMBER;
    v_wszyscy NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_lekarze FROM lekarze;
    SELECT COUNT(*) INTO v_pielegniarki FROM pielegniarki;
    SELECT COUNT(*) INTO v_studenci FROM studenci;
    v_wszyscy := v_lekarze + v_pielegniarki + v_studenci;
RETURN v_wszyscy;
END;
/

-- Funkcja zwracajaca liczbe dni, ktora pacjent spedzil w szpitalu 
CREATE OR replace FUNCTION dni_w_szpitalu(p_id NUMBER)
RETURN NUMBER
AS
    v_dni NUMBER := 0;
BEGIN
    FOR r_pacjent IN (SELECT * FROM historia_pobytow WHERE id_pacjenta = p_id)
    LOOP
        IF r_pacjent.koniec_pobytu is not null THEN
        v_dni := v_dni + (r_pacjent.koniec_pobytu - r_pacjent.poczatek_pobytu);
        END IF;
    END LOOP;
    
RETURN v_dni;
END;
/

CREATE TABLE historia_pobytow (
    poczatek_pobytu  DATE NOT NULL,
    koniec_pobytu    DATE,
    id_pobytu        NUMBER (3) NOT NULL,
    id_sali          NUMBER (3) NOT NULL,
    id_pacjenta      NUMBER (3) NOT NULL
);

ALTER TABLE historia_pobytow ADD CONSTRAINT historia_pobytow_pk PRIMARY KEY ( id_pobytu );

CREATE TABLE historia_zabiegow (
    data_zabiegu          DATE NOT NULL,
    id_historii_zabiegow  NUMBER (3) NOT NULL,
    id_pacjenta           NUMBER (3) NOT NULL,
    id_zabiegu            NUMBER (3) NOT NULL,
    id_lekarza            NUMBER (3) NOT NULL
);

ALTER TABLE historia_zabiegow ADD CONSTRAINT historia_zabiegow_pk PRIMARY KEY ( id_historii_zabiegow );

CREATE TABLE lekarze (
    imie        VARCHAR2(20) NOT NULL,
    nazwisko    VARCHAR2(20) NOT NULL,
    id_lekarza  NUMBER (3) NOT NULL
);

ALTER TABLE lekarze ADD CONSTRAINT lekarz_pk PRIMARY KEY ( id_lekarza );

CREATE TABLE lekarze_specjalizacje (
    id_lekarza        NUMBER (3) NOT NULL,
    id_specjalizacji  NUMBER (3) NOT NULL
);

ALTER TABLE lekarze_specjalizacje ADD CONSTRAINT relation_5_pk PRIMARY KEY ( id_lekarza,
                                                                             id_specjalizacji );

CREATE TABLE oddzialy (
    nazwa        VARCHAR2(20) NOT NULL,
    id_oddzialu  NUMBER (3) NOT NULL
);

ALTER TABLE oddzialy ADD CONSTRAINT oddzial_pk PRIMARY KEY ( id_oddzialu );

CREATE TABLE oddzialy_pielegniarki (
    id_oddzialu      NUMBER (3) NOT NULL,
    id_pielegniarki  NUMBER (3) NOT NULL
);

ALTER TABLE oddzialy_pielegniarki ADD CONSTRAINT relation_12_pk PRIMARY KEY ( id_oddzialu,
                                                                              id_pielegniarki );

CREATE TABLE pacjenci (
    imie         VARCHAR2(20) NOT NULL,
    nazwisko     VARCHAR2(20) NOT NULL,
    pesel        NUMBER (11),
    id_pacjenta  NUMBER (3) NOT NULL,
    id_lekarza   NUMBER (3)
);

ALTER TABLE pacjenci ADD CONSTRAINT pacjent_pk PRIMARY KEY ( id_pacjenta );

CREATE TABLE pielegniarki (
    imie             VARCHAR2(20) NOT NULL,
    nazwisko         VARCHAR2(20),
    id_pielegniarki  NUMBER (3) NOT NULL
);

ALTER TABLE pielegniarki ADD CONSTRAINT pielegniarka_pk PRIMARY KEY ( id_pielegniarki );

CREATE TABLE sale (
    numer_sali   NUMBER NOT NULL,
    id_sali      NUMBER (3) NOT NULL,
    id_oddzialu  NUMBER (3) NOT NULL
);

ALTER TABLE sale ADD CONSTRAINT sala_pk PRIMARY KEY ( id_sali );

CREATE TABLE specjalizacje (
    nazwa             VARCHAR2(20) NOT NULL,
    id_specjalizacji  NUMBER (3) NOT NULL
);

ALTER TABLE specjalizacje ADD CONSTRAINT specjalizacja_pk PRIMARY KEY ( id_specjalizacji );

CREATE TABLE specjalna_aparatura (
    nazwa         VARCHAR2(20) NOT NULL,
    id_aparatury  NUMBER (3) NOT NULL,
    id_pacjenta   NUMBER (3)
);

ALTER TABLE specjalna_aparatura ADD CONSTRAINT specjalna_aparatura_pk PRIMARY KEY ( id_aparatury );

CREATE TABLE studenci (
    imie         VARCHAR2(20) NOT NULL,
    nazwisko     VARCHAR2(20) NOT NULL,
    id_studenta  NUMBER (3) NOT NULL,
    id_lekarza   NUMBER (3) NOT NULL
);

ALTER TABLE studenci ADD CONSTRAINT student_pk PRIMARY KEY ( id_studenta );

CREATE TABLE zabiegi (
    nazwa       VARCHAR2(50) NOT NULL,
    id_zabiegu  NUMBER (3) NOT NULL
);

ALTER TABLE zabiegi ADD CONSTRAINT zabiegi_pk PRIMARY KEY ( id_zabiegu );

ALTER TABLE historia_pobytow
    ADD CONSTRAINT historia_pobytow_pacjent_fkv1 FOREIGN KEY ( id_pacjenta )
        REFERENCES pacjenci ( id_pacjenta );

ALTER TABLE historia_pobytow
    ADD CONSTRAINT historia_pobytow_sala_fk FOREIGN KEY ( id_sali )
        REFERENCES sale ( id_sali );

ALTER TABLE historia_zabiegow
    ADD CONSTRAINT historia_zabiegow_lekarz_fk FOREIGN KEY ( id_lekarza )
        REFERENCES lekarze ( id_lekarza );

ALTER TABLE historia_zabiegow
    ADD CONSTRAINT historia_zabiegow_pacjent_fk FOREIGN KEY ( id_pacjenta )
        REFERENCES pacjenci ( id_pacjenta );

ALTER TABLE historia_zabiegow
    ADD CONSTRAINT historia_zabiegow_zabiegi_fk FOREIGN KEY ( id_zabiegu )
        REFERENCES zabiegi ( id_zabiegu );

ALTER TABLE pacjenci
    ADD CONSTRAINT pacjent_lekarz_fk FOREIGN KEY ( id_lekarza )
        REFERENCES lekarze ( id_lekarza );

ALTER TABLE oddzialy_pielegniarki
    ADD CONSTRAINT relation_12_oddzial_fk FOREIGN KEY ( id_oddzialu )
        REFERENCES oddzialy ( id_oddzialu );

ALTER TABLE oddzialy_pielegniarki
    ADD CONSTRAINT relation_12_pielegniarka_fk FOREIGN KEY ( id_pielegniarki )
        REFERENCES pielegniarki ( id_pielegniarki );

ALTER TABLE lekarze_specjalizacje
    ADD CONSTRAINT relation_5_lekarz_fk FOREIGN KEY ( id_lekarza )
        REFERENCES lekarze ( id_lekarza );

ALTER TABLE lekarze_specjalizacje
    ADD CONSTRAINT relation_5_specjalizacja_fk FOREIGN KEY ( id_specjalizacji )
        REFERENCES specjalizacje ( id_specjalizacji );

ALTER TABLE sale
    ADD CONSTRAINT sala_oddzial_fk FOREIGN KEY ( id_oddzialu )
        REFERENCES oddzialy ( id_oddzialu );

ALTER TABLE specjalna_aparatura
    ADD CONSTRAINT specjalna_aparatura_pacjent_fk FOREIGN KEY ( id_pacjenta )
        REFERENCES pacjenci ( id_pacjenta );

ALTER TABLE studenci
    ADD CONSTRAINT student_lekarz_fk FOREIGN KEY ( id_lekarza )
        REFERENCES lekarze ( id_lekarza );

commit;
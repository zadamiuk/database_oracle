INSERT INTO specjalizacje VALUES('Anestezjologia', 101);
INSERT INTO specjalizacje VALUES('Chirurgia', 102);
INSERT INTO specjalizacje VALUES('Dermatologia', 103);
INSERT INTO specjalizacje VALUES('Kardiologia', 104);
INSERT INTO specjalizacje VALUES('Neurologia', 105);
INSERT INTO specjalizacje VALUES('Okulistyka', 106);

INSERT INTO lekarze VALUES('Anna', 'Malinowska', 101);
INSERT INTO lekarze VALUES('Marek', 'Nowakowski', 102);
INSERT INTO lekarze VALUES('Jan', 'Limanowski', 103);
INSERT INTO lekarze VALUES('Wiktor', 'Pietrzak', 104);
INSERT INTO lekarze VALUES('Pawel', 'Kozlowski', 105);
INSERT INTO lekarze VALUES('Krzysztof', 'Rutkowski', 106);
INSERT INTO lekarze VALUES('Marcin', 'Mazur', 107);
INSERT INTO lekarze VALUES('Paulina', 'Kubiak', 108);
INSERT INTO lekarze VALUES('Sylwia', 'Piotrowska', 109);
INSERT INTO lekarze VALUES('Antonina', 'Krupa', 110);
INSERT INTO lekarze VALUES('Juliusz', 'Czerwinski', 111);
INSERT INTO lekarze VALUES('Igor', 'Kalinowski', 112);
INSERT INTO lekarze VALUES('Anita', 'Sokolowska', 113);
INSERT INTO lekarze VALUES('Aleksander', 'Michalak', 114);
INSERT INTO lekarze VALUES('Jerzy', 'Kucharski', 115);
INSERT INTO lekarze VALUES('Joanna', 'Sikorska', 116);
INSERT INTO lekarze VALUES('Andrzej', 'Baranowski', 117);
INSERT INTO lekarze VALUES('Eryk', 'Wozniak', 118);
INSERT INTO lekarze VALUES('Janusz', 'Marciniak', 119);
INSERT INTO lekarze VALUES('Krystian', 'Gajewski', 120);

INSERT INTO lekarze_specjalizacje VALUES(101, 101);
INSERT INTO lekarze_specjalizacje VALUES(102, 101);
INSERT INTO lekarze_specjalizacje VALUES(103, 101);
INSERT INTO lekarze_specjalizacje VALUES(104, 102);
INSERT INTO lekarze_specjalizacje VALUES(105, 102);
INSERT INTO lekarze_specjalizacje VALUES(106, 102);
INSERT INTO lekarze_specjalizacje VALUES(107, 103);
INSERT INTO lekarze_specjalizacje VALUES(108, 103);
INSERT INTO lekarze_specjalizacje VALUES(109, 103);
INSERT INTO lekarze_specjalizacje VALUES(110, 104);
INSERT INTO lekarze_specjalizacje VALUES(111, 104);
INSERT INTO lekarze_specjalizacje VALUES(112, 104);
INSERT INTO lekarze_specjalizacje VALUES(113, 104);
INSERT INTO lekarze_specjalizacje VALUES(114, 104);
INSERT INTO lekarze_specjalizacje VALUES(115, 105);
INSERT INTO lekarze_specjalizacje VALUES(116, 105);
INSERT INTO lekarze_specjalizacje VALUES(117, 105);
INSERT INTO lekarze_specjalizacje VALUES(118, 106);
INSERT INTO lekarze_specjalizacje VALUES(119, 106);
INSERT INTO lekarze_specjalizacje VALUES(120, 106);

INSERT INTO studenci VALUES('Filip', 'Krawczyk', 101, 101);
INSERT INTO studenci VALUES('Marek', 'Laskowski', 102, 101);
INSERT INTO studenci VALUES('Piotr', 'Kaminski', 103, 104);
INSERT INTO studenci VALUES('Robert', 'Sobczak', 104, 104);
INSERT INTO studenci VALUES('Marta', 'Wojciechowska', 105, 110);
INSERT INTO studenci VALUES('Michal', 'Jankowski', 106, 110);
INSERT INTO studenci VALUES('Magdalena', 'Wasilewska', 107, 110);
INSERT INTO studenci VALUES('Patrycja', 'Tomaszewska', 108, 118);
INSERT INTO studenci VALUES('Katarzyna', 'Walczak', 109, 118);

INSERT INTO pacjenci VALUES('Alicja', 'Kowalczyk', 45081205741, 101, 101);
INSERT INTO pacjenci VALUES('Aleksandra', 'Jaworska', 49032196788, 102, null);
INSERT INTO pacjenci VALUES('Nikola', 'Przybylska', 85031823445, 103, null);
INSERT INTO pacjenci VALUES('Dorota', 'Jakubowska', 56051202349, 104, null);
INSERT INTO pacjenci VALUES('Izabela', 'Kaminska', 61071587741, 105, null);
INSERT INTO pacjenci VALUES('Eliza', 'Kwiatkowska', 66111238752, 106, null);
INSERT INTO pacjenci VALUES('Dagmara', 'Mazurek', 54090316782, 107, null);
INSERT INTO pacjenci VALUES('Hubert', 'Sadowski', 58123079372, 108, null);
INSERT INTO pacjenci VALUES('Mateusz', 'Adamski', 47040702859, 109, 101);
INSERT INTO pacjenci VALUES('Jacek', 'Chmielewski', 52090307559, 110, 109);
INSERT INTO pacjenci VALUES('Mikolaj', 'Dabrowski', 55010203749, 111, 110);
INSERT INTO pacjenci VALUES('Kamil', 'Borkowski', 67070378925, 112, 111);


INSERT INTO oddzialy VALUES('Chirurgia', 101);
INSERT INTO oddzialy VALUES('Kardiologia', 102);
INSERT INTO oddzialy VALUES('Neurologia', 103);
INSERT INTO oddzialy VALUES('Okulistyka', 104);
INSERT INTO oddzialy VALUES('SOR', 105);
INSERT INTO oddzialy VALUES('OIOM', 106);

INSERT INTO pielegniarki VALUES('Anna', 'Nowak', 101);
INSERT INTO pielegniarki VALUES('Olga', 'Pietrzak', 102);
INSERT INTO pielegniarki VALUES('Laura', 'Sawicka', 103);
INSERT INTO pielegniarki VALUES('Agnieszka', 'Adamska', 104);
INSERT INTO pielegniarki VALUES('Roksana', 'Michalak', 105);
INSERT INTO pielegniarki VALUES('Wiktoria', 'Maciejewska', 106);
INSERT INTO pielegniarki VALUES('Weronika', 'Malinowska', 107);

INSERT INTO oddzialy_pielegniarki VALUES(101, 101);
INSERT INTO oddzialy_pielegniarki VALUES(101, 102);
INSERT INTO oddzialy_pielegniarki VALUES(102, 101);
INSERT INTO oddzialy_pielegniarki VALUES(102, 103);
INSERT INTO oddzialy_pielegniarki VALUES(103, 104);
INSERT INTO oddzialy_pielegniarki VALUES(104, 105);
INSERT INTO oddzialy_pielegniarki VALUES(105, 105);
INSERT INTO oddzialy_pielegniarki VALUES(106, 106);
INSERT INTO oddzialy_pielegniarki VALUES(106, 107);
INSERT INTO oddzialy_pielegniarki VALUES(106, 102);

INSERT INTO sale VALUES(1, 101, 101);
INSERT INTO sale VALUES(2, 102, 101);
INSERT INTO sale VALUES(3, 103, 101);
INSERT INTO sale VALUES(1, 104, 102);
INSERT INTO sale VALUES(2, 105, 102);
INSERT INTO sale VALUES(1, 106, 103);
INSERT INTO sale VALUES(2, 107, 103);
INSERT INTO sale VALUES(1, 108, 104);
INSERT INTO sale VALUES(2, 109, 104);
INSERT INTO sale VALUES(1, 110, 105);
INSERT INTO sale VALUES(2, 111, 105);
INSERT INTO sale VALUES(3, 112, 105);
INSERT INTO sale VALUES(4, 113, 105);
INSERT INTO sale VALUES(1, 114, 106);
INSERT INTO sale VALUES(2, 115, 106);
INSERT INTO sale VALUES(3, 116, 106);

INSERT INTO historia_pobytow VALUES('18/05/12', '18/05/18', 101, 101, 101);
INSERT INTO historia_pobytow VALUES('18/06/02', '18/06/03', 102, 102, 101);
INSERT INTO historia_pobytow VALUES('19/01/14', '19/01/18', 103, 103, 102);
INSERT INTO historia_pobytow VALUES('19/05/12', '19/05/18', 104, 104, 103);
INSERT INTO historia_pobytow VALUES('19/06/03', '19/06/13', 105, 104, 104);
INSERT INTO historia_pobytow VALUES('19/06/19', '19/06/27', 106, 105, 105);
INSERT INTO historia_pobytow VALUES('19/09/12', '19/09/18', 107, 106, 106);
INSERT INTO historia_pobytow VALUES('19/12/28', '20/01/08', 108, 107, 107);
INSERT INTO historia_pobytow VALUES('20/03/22', '20/03/28', 109, 108, 108);
INSERT INTO historia_pobytow VALUES('20/04/01', null, 110, 109, 109);
INSERT INTO historia_pobytow VALUES('20/10/21', null, 111, 110, 110);
INSERT INTO historia_pobytow VALUES('21/02/02', null, 112, 111, 111);
INSERT INTO historia_pobytow VALUES('21/04/17', null, 113, 112, 112);
INSERT INTO historia_pobytow VALUES('21/05/17', null, 114, 115, 101);

INSERT INTO zabiegi VALUES('Wyciecie guza mozgu', 101);
INSERT INTO zabiegi VALUES('Operacja kregoslupa', 102);
INSERT INTO zabiegi VALUES('Wyciecie woreczka zolciowego', 103);
INSERT INTO zabiegi VALUES('Przeszczep serca', 104);
INSERT INTO zabiegi VALUES('Kardiowersja', 105);
INSERT INTO zabiegi VALUES('Wszczepienie zastawki', 106);
INSERT INTO zabiegi VALUES('Wszczepienie rozrusznika serca', 107);
INSERT INTO zabiegi VALUES('Operacja zacmy', 108);
INSERT INTO zabiegi VALUES('Operacja jaskry', 109);
INSERT INTO zabiegi VALUES('Fotokoagulacja siatkowki', 110);

INSERT INTO historia_zabiegow VALUES('18/05/13', 101, 101, 101, 116);
INSERT INTO historia_zabiegow VALUES('19/01/15', 102, 102, 105, 111);
INSERT INTO historia_zabiegow VALUES('19/05/13', 103, 103, 105, 114);
INSERT INTO historia_zabiegow VALUES('19/06/05', 104, 104, 107, 113);
INSERT INTO historia_zabiegow VALUES('19/06/20', 105, 105, 106, 112);
INSERT INTO historia_zabiegow VALUES('19/09/12', 106, 106, 101, 115);
INSERT INTO historia_zabiegow VALUES('19/12/28', 107, 107, 102, 116);
INSERT INTO historia_zabiegow VALUES('20/03/22', 108, 108, 108, 118);
INSERT INTO historia_zabiegow VALUES('20/04/01', 109, 109, 110, 119);

INSERT INTO specjalna_aparatura VALUES('Respirator', 101, 101);
INSERT INTO specjalna_aparatura VALUES('Respirator', 102, 103);
INSERT INTO specjalna_aparatura VALUES('Respirator', 103, null);
INSERT INTO specjalna_aparatura VALUES('Respirator', 104, null);
INSERT INTO specjalna_aparatura VALUES('Respirator', 105, null);
INSERT INTO specjalna_aparatura VALUES('Kardiomonitor', 106, null);
INSERT INTO specjalna_aparatura VALUES('Kardiomonitor', 107, null);
INSERT INTO specjalna_aparatura VALUES('Kardiomonitor', 108, null);
INSERT INTO specjalna_aparatura VALUES('ECMO', 110, null);

commit;




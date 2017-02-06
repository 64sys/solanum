BEGIN TRANSACTION;
CREATE TABLE `zones` (
	`zoneidx`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`zonename`	TEXT NOT NULL UNIQUE,
	`zonedelay`	INTEGER NOT NULL
);
INSERT INTO `zones` VALUES (1,'Norte',0);
INSERT INTO `zones` VALUES (2,'Sur',180);
CREATE TABLE `soils` (
	`soilidx`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`soilname`	TEXT NOT NULL UNIQUE,
	`soildesc`	TEXT
);
INSERT INTO `soils` VALUES (1,'arenoso','alto nivel de drenaje');
INSERT INTO `soils` VALUES (2,'arcilloso','bajo nivel de drenaje');
CREATE TABLE `plots` (
	`plotidx`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`plotname`	TEXT NOT NULL,
	`plotdesc`	TEXT,
	`plotsoil`	INTEGER NOT NULL,
	`plotlx`	TEXT,
	`plotly`	TEXT,
	`plotgps`	TEXT,
	`plotzone`	INTEGER NOT NULL
);
INSERT INTO `plots` VALUES (1,'Solanum','Parcela de pruebas',2,'20','5','',0);
CREATE TABLE `plants` (
	`plantidx`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`plantname`	TEXT NOT NULL UNIQUE,
	`plantdesc`	TEXT,
	`plantseed`	TEXT NOT NULL,
	`plantmin`	INTEGER NOT NULL,
	`plantmax`	INTEGER NOT NULL
);
INSERT INTO `plants` VALUES (1,'Berenjena','Berenjena','12',180,180);
INSERT INTO `plants` VALUES (2,'Lechuga','Lechuga','123456789',90,90);
INSERT INTO `plants` VALUES (3,'Papa','Patata','1234',120,120);
INSERT INTO `plants` VALUES (4,'Morrón','Pimiento','123',150,150);
INSERT INTO `plants` VALUES (5,'Puerro','Puerro','123456',120,150);
INSERT INTO `plants` VALUES (6,'Tomate','Tomate','1234',150,150);
INSERT INTO `plants` VALUES (7,'Acelga','Acelga','23456789',0,0);
INSERT INTO `plants` VALUES (8,'Apio','Apio','2345',240,240);
INSERT INTO `plants` VALUES (9,'Zucchini','Calabacín','23',90,90);
INSERT INTO `plants` VALUES (10,'Escarola','Escarola','23456789',90,0);
INSERT INTO `plants` VALUES (11,'Pepino','Pepino','2345',90,120);
INSERT INTO `plants` VALUES (12,'Zanahoria','Zanahoria','23456789',90,120);
INSERT INTO `plants` VALUES (13,'Chauchas','Judías','3456',90,120);
INSERT INTO `plants` VALUES (14,'Melón','Melón','34',120,120);
INSERT INTO `plants` VALUES (15,'Sandía','Sandía','34',120,120);
INSERT INTO `plants` VALUES (16,'Repollo','Col','3456789A',150,150);
INSERT INTO `plants` VALUES (17,'Brócoli','Brócoli','4567',150,150);
INSERT INTO `plants` VALUES (18,'Coliflor','Coliflor','45678',150,180);
INSERT INTO `plants` VALUES (19,'Cebolla','Cebolla','01789AB',270,270);
INSERT INTO `plants` VALUES (20,'Espinaca','Espinaca','01789AB',90,90);
INSERT INTO `plants` VALUES (21,'Habas','Habas','89A',120,120);
INSERT INTO `plants` VALUES (22,'Ajo','Ajo','09AB',270,270);
INSERT INTO `plants` VALUES (23,'Arbejas','Guisantes','019AB',120,120);
INSERT INTO `plants` VALUES (24,'Rábano','Rábano','0123456789AB',30,60);
INSERT INTO `plants` VALUES (25,'Zapallo','Calabaza','',0,0);
INSERT INTO `plants` VALUES (26,'Ají','Ají','',0,0);
INSERT INTO `plants` VALUES (27,'Alcaucil','Alcaucil','',0,0);
INSERT INTO `plants` VALUES (28,'Batata','Batata','',0,0);
INSERT INTO `plants` VALUES (29,'Cebolla-roja','Cebolla-roja','',0,0);
INSERT INTO `plants` VALUES (30,'Champiñon','Champiñon','',0,0);
INSERT INTO `plants` VALUES (31,'Choclo','Choclo','',0,0);
INSERT INTO `plants` VALUES (32,'Esparrago','Esparrago','',0,0);
INSERT INTO `plants` VALUES (33,'Morrón-amarillo','Morrón-amarillo','123',150,150);
INSERT INTO `plants` VALUES (34,'Remolacha','Remolacha','',0,0);
INSERT INTO `plants` VALUES (35,'Repollo-rojo','Col-roja','3456789A',150,150);
INSERT INTO `plants` VALUES (36,'Albahaca','Albahaca','',0,0);
INSERT INTO `plants` VALUES (37,'Oregano','Oregano','',0,0);
INSERT INTO `plants` VALUES (38,'Tomillo','Tomillo','',0,0);
INSERT INTO `plants` VALUES (39,'Hinojo','Hinojo','',0,0);
INSERT INTO `plants` VALUES (40,'Frutillas','Fresas','',0,0);
INSERT INTO `plants` VALUES (41,'Quinoto','Quinoto','',0,0);
INSERT INTO `plants` VALUES (42,'Limón','Limón','',0,0);
INSERT INTO `plants` VALUES (43,'Naranja','Naranja','',0,0);
INSERT INTO `plants` VALUES (44,'Perejil','Perejil','',0,0);
INSERT INTO `plants` VALUES (45,'Calendula','Calendula','',0,0);
INSERT INTO `plants` VALUES (46,'Margarita','Margarita','',0,0);
INSERT INTO `plants` VALUES (47,'Menta','Menta','',0,0);
INSERT INTO `plants` VALUES (48,'Geranio','Geranio','',0,0);
INSERT INTO `plants` VALUES (49,'Borraja','Borraja','',0,0);
INSERT INTO `plants` VALUES (50,'Rúcula','Rúcula','',0,0);
CREATE TABLE `cycles` (
	`cycleidx`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`cyclename`	TEXT NOT NULL UNIQUE,
	`cycledesc`	TEXT
);
INSERT INTO `cycles` VALUES (1,'2017','Comienza en enero y termina en diciembre.');
CREATE TABLE `blocks` (
	`blockidx`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`blockplot`	INTEGER,
	`blockcycle`	INTEGER,
	`blockcode`	TEXT,
	`blockplant`	INTEGER,
	FOREIGN KEY(`blockplot`) REFERENCES `plots` ( `plotidx` ),
	FOREIGN KEY(`blockcycle`) REFERENCES `cycles` ( `cycleidx` ),
	FOREIGN KEY(`blockplant`) REFERENCES `plants` ( `plantidx` )
);
INSERT INTO `blocks` VALUES (459,1,1,'048',45);
INSERT INTO `blocks` VALUES (460,1,1,'045',6);
INSERT INTO `blocks` VALUES (461,1,1,'038',6);
INSERT INTO `blocks` VALUES (462,1,1,'032',6);
INSERT INTO `blocks` VALUES (463,1,1,'025',6);
INSERT INTO `blocks` VALUES (464,1,1,'018',6);
INSERT INTO `blocks` VALUES (465,1,1,'012',6);
INSERT INTO `blocks` VALUES (466,1,1,'005',6);
INSERT INTO `blocks` VALUES (467,1,1,'145',6);
INSERT INTO `blocks` VALUES (468,1,1,'138',6);
INSERT INTO `blocks` VALUES (469,1,1,'132',6);
INSERT INTO `blocks` VALUES (470,1,1,'125',6);
INSERT INTO `blocks` VALUES (471,1,1,'118',6);
INSERT INTO `blocks` VALUES (472,1,1,'112',6);
INSERT INTO `blocks` VALUES (473,1,1,'105',6);
INSERT INTO `blocks` VALUES (474,1,1,'205',6);
INSERT INTO `blocks` VALUES (475,1,1,'212',6);
INSERT INTO `blocks` VALUES (476,1,1,'218',6);
INSERT INTO `blocks` VALUES (477,1,1,'225',6);
INSERT INTO `blocks` VALUES (478,1,1,'232',6);
INSERT INTO `blocks` VALUES (479,1,1,'238',6);
INSERT INTO `blocks` VALUES (480,1,1,'245',6);
INSERT INTO `blocks` VALUES (481,1,1,'345',6);
INSERT INTO `blocks` VALUES (482,1,1,'338',6);
INSERT INTO `blocks` VALUES (483,1,1,'332',6);
INSERT INTO `blocks` VALUES (484,1,1,'325',6);
INSERT INTO `blocks` VALUES (485,1,1,'318',6);
INSERT INTO `blocks` VALUES (486,1,1,'312',6);
INSERT INTO `blocks` VALUES (487,1,1,'305',6);
INSERT INTO `blocks` VALUES (488,1,1,'405',6);
INSERT INTO `blocks` VALUES (489,1,1,'412',6);
INSERT INTO `blocks` VALUES (490,1,1,'418',6);
INSERT INTO `blocks` VALUES (491,1,1,'425',6);
INSERT INTO `blocks` VALUES (492,1,1,'432',6);
INSERT INTO `blocks` VALUES (493,1,1,'438',6);
INSERT INTO `blocks` VALUES (494,1,1,'445',6);
INSERT INTO `blocks` VALUES (495,1,1,'545',6);
INSERT INTO `blocks` VALUES (496,1,1,'538',6);
INSERT INTO `blocks` VALUES (497,1,1,'532',6);
INSERT INTO `blocks` VALUES (498,1,1,'525',6);
INSERT INTO `blocks` VALUES (499,1,1,'518',6);
INSERT INTO `blocks` VALUES (500,1,1,'512',6);
INSERT INTO `blocks` VALUES (501,1,1,'505',6);
INSERT INTO `blocks` VALUES (502,1,1,'148',45);
INSERT INTO `blocks` VALUES (503,1,1,'248',45);
INSERT INTO `blocks` VALUES (504,1,1,'348',45);
INSERT INTO `blocks` VALUES (505,1,1,'448',45);
INSERT INTO `blocks` VALUES (506,1,1,'548',45);
INSERT INTO `blocks` VALUES (507,1,1,'542',36);
INSERT INTO `blocks` VALUES (508,1,1,'535',36);
INSERT INTO `blocks` VALUES (509,1,1,'528',36);
INSERT INTO `blocks` VALUES (510,1,1,'522',36);
INSERT INTO `blocks` VALUES (511,1,1,'515',36);
INSERT INTO `blocks` VALUES (512,1,1,'508',36);
INSERT INTO `blocks` VALUES (513,1,1,'502',46);
INSERT INTO `blocks` VALUES (514,1,1,'402',46);
INSERT INTO `blocks` VALUES (515,1,1,'408',36);
INSERT INTO `blocks` VALUES (516,1,1,'415',36);
INSERT INTO `blocks` VALUES (517,1,1,'422',36);
INSERT INTO `blocks` VALUES (518,1,1,'428',36);
INSERT INTO `blocks` VALUES (519,1,1,'435',36);
INSERT INTO `blocks` VALUES (520,1,1,'442',36);
INSERT INTO `blocks` VALUES (521,1,1,'342',36);
INSERT INTO `blocks` VALUES (522,1,1,'335',36);
INSERT INTO `blocks` VALUES (523,1,1,'328',36);
INSERT INTO `blocks` VALUES (524,1,1,'322',36);
INSERT INTO `blocks` VALUES (525,1,1,'315',36);
INSERT INTO `blocks` VALUES (526,1,1,'308',36);
INSERT INTO `blocks` VALUES (527,1,1,'302',46);
INSERT INTO `blocks` VALUES (528,1,1,'202',46);
INSERT INTO `blocks` VALUES (529,1,1,'002',46);
INSERT INTO `blocks` VALUES (530,1,1,'008',36);
INSERT INTO `blocks` VALUES (531,1,1,'015',36);
INSERT INTO `blocks` VALUES (532,1,1,'022',36);
INSERT INTO `blocks` VALUES (533,1,1,'028',36);
INSERT INTO `blocks` VALUES (534,1,1,'035',36);
INSERT INTO `blocks` VALUES (535,1,1,'042',36);
INSERT INTO `blocks` VALUES (536,1,1,'142',36);
INSERT INTO `blocks` VALUES (537,1,1,'135',36);
INSERT INTO `blocks` VALUES (538,1,1,'128',36);
INSERT INTO `blocks` VALUES (539,1,1,'122',36);
INSERT INTO `blocks` VALUES (540,1,1,'115',36);
INSERT INTO `blocks` VALUES (541,1,1,'108',36);
INSERT INTO `blocks` VALUES (542,1,1,'102',46);
INSERT INTO `blocks` VALUES (543,1,1,'208',36);
INSERT INTO `blocks` VALUES (544,1,1,'215',36);
INSERT INTO `blocks` VALUES (545,1,1,'222',36);
INSERT INTO `blocks` VALUES (546,1,1,'228',36);
INSERT INTO `blocks` VALUES (547,1,1,'235',36);
INSERT INTO `blocks` VALUES (548,1,1,'242',36);
INSERT INTO `blocks` VALUES (549,1,1,'602',46);
INSERT INTO `blocks` VALUES (550,1,1,'608',36);
INSERT INTO `blocks` VALUES (551,1,1,'615',36);
INSERT INTO `blocks` VALUES (552,1,1,'622',36);
INSERT INTO `blocks` VALUES (553,1,1,'628',36);
INSERT INTO `blocks` VALUES (554,1,1,'635',36);
INSERT INTO `blocks` VALUES (555,1,1,'642',36);
INSERT INTO `blocks` VALUES (556,1,1,'648',45);
INSERT INTO `blocks` VALUES (557,1,1,'748',45);
INSERT INTO `blocks` VALUES (558,1,1,'742',36);
INSERT INTO `blocks` VALUES (559,1,1,'735',36);
INSERT INTO `blocks` VALUES (560,1,1,'728',36);
INSERT INTO `blocks` VALUES (561,1,1,'722',36);
INSERT INTO `blocks` VALUES (562,1,1,'715',36);
INSERT INTO `blocks` VALUES (563,1,1,'708',36);
INSERT INTO `blocks` VALUES (564,1,1,'702',46);
INSERT INTO `blocks` VALUES (565,1,1,'802',46);
INSERT INTO `blocks` VALUES (566,1,1,'808',36);
INSERT INTO `blocks` VALUES (567,1,1,'815',36);
INSERT INTO `blocks` VALUES (568,1,1,'822',36);
INSERT INTO `blocks` VALUES (569,1,1,'828',36);
INSERT INTO `blocks` VALUES (570,1,1,'835',36);
INSERT INTO `blocks` VALUES (571,1,1,'842',36);
INSERT INTO `blocks` VALUES (572,1,1,'848',45);
INSERT INTO `blocks` VALUES (573,1,1,'645',6);
INSERT INTO `blocks` VALUES (574,1,1,'745',6);
INSERT INTO `blocks` VALUES (575,1,1,'845',6);
INSERT INTO `blocks` VALUES (576,1,1,'838',6);
INSERT INTO `blocks` VALUES (577,1,1,'738',6);
INSERT INTO `blocks` VALUES (578,1,1,'638',6);
INSERT INTO `blocks` VALUES (579,1,1,'632',6);
INSERT INTO `blocks` VALUES (580,1,1,'732',6);
INSERT INTO `blocks` VALUES (581,1,1,'832',6);
INSERT INTO `blocks` VALUES (582,1,1,'825',6);
INSERT INTO `blocks` VALUES (583,1,1,'725',6);
INSERT INTO `blocks` VALUES (584,1,1,'625',6);
INSERT INTO `blocks` VALUES (585,1,1,'618',6);
INSERT INTO `blocks` VALUES (587,1,1,'818',6);
INSERT INTO `blocks` VALUES (588,1,1,'718',6);
INSERT INTO `blocks` VALUES (589,1,1,'712',6);
INSERT INTO `blocks` VALUES (590,1,1,'812',6);
INSERT INTO `blocks` VALUES (591,1,1,'805',6);
INSERT INTO `blocks` VALUES (592,1,1,'705',6);
INSERT INTO `blocks` VALUES (593,1,1,'605',6);
INSERT INTO `blocks` VALUES (594,1,1,'612',6);
INSERT INTO `blocks` VALUES (598,1,1,'945',6);
INSERT INTO `blocks` VALUES (599,1,1,'938',6);
INSERT INTO `blocks` VALUES (600,1,1,'932',6);
INSERT INTO `blocks` VALUES (601,1,1,'925',6);
INSERT INTO `blocks` VALUES (602,1,1,'918',6);
INSERT INTO `blocks` VALUES (603,1,1,'912',6);
INSERT INTO `blocks` VALUES (604,1,1,'905',6);
INSERT INTO `blocks` VALUES (605,1,1,'948',45);
INSERT INTO `blocks` VALUES (606,1,1,'942',36);
INSERT INTO `blocks` VALUES (607,1,1,'935',36);
INSERT INTO `blocks` VALUES (608,1,1,'928',36);
INSERT INTO `blocks` VALUES (609,1,1,'922',36);
INSERT INTO `blocks` VALUES (610,1,1,'915',36);
INSERT INTO `blocks` VALUES (611,1,1,'908',36);
INSERT INTO `blocks` VALUES (612,1,1,'902',46);
INSERT INTO `blocks` VALUES (616,1,1,'j44',31);
INSERT INTO `blocks` VALUES (617,1,1,'j37',31);
INSERT INTO `blocks` VALUES (618,1,1,'j31',31);
INSERT INTO `blocks` VALUES (619,1,1,'j24',31);
INSERT INTO `blocks` VALUES (620,1,1,'j17',31);
INSERT INTO `blocks` VALUES (621,1,1,'j11',31);
INSERT INTO `blocks` VALUES (622,1,1,'j04',31);
INSERT INTO `blocks` VALUES (623,1,1,'i05',31);
INSERT INTO `blocks` VALUES (624,1,1,'i12',31);
INSERT INTO `blocks` VALUES (625,1,1,'i18',31);
INSERT INTO `blocks` VALUES (626,1,1,'i25',31);
INSERT INTO `blocks` VALUES (627,1,1,'i32',31);
INSERT INTO `blocks` VALUES (628,1,1,'i38',31);
INSERT INTO `blocks` VALUES (629,1,1,'i45',31);
INSERT INTO `blocks` VALUES (630,1,1,'i43',31);
INSERT INTO `blocks` VALUES (631,1,1,'i36',31);
INSERT INTO `blocks` VALUES (632,1,1,'i30',31);
INSERT INTO `blocks` VALUES (633,1,1,'i23',31);
INSERT INTO `blocks` VALUES (634,1,1,'i16',31);
INSERT INTO `blocks` VALUES (635,1,1,'i10',31);
INSERT INTO `blocks` VALUES (636,1,1,'i03',31);
INSERT INTO `blocks` VALUES (637,1,1,'h44',31);
INSERT INTO `blocks` VALUES (638,1,1,'h37',31);
INSERT INTO `blocks` VALUES (639,1,1,'h31',31);
INSERT INTO `blocks` VALUES (640,1,1,'h24',31);
INSERT INTO `blocks` VALUES (641,1,1,'h17',31);
INSERT INTO `blocks` VALUES (642,1,1,'h11',31);
INSERT INTO `blocks` VALUES (643,1,1,'h04',31);
INSERT INTO `blocks` VALUES (670,1,1,'044',44);
INSERT INTO `blocks` VALUES (672,1,1,'037',44);
INSERT INTO `blocks` VALUES (674,1,1,'031',44);
INSERT INTO `blocks` VALUES (676,1,1,'024',44);
INSERT INTO `blocks` VALUES (677,1,1,'017',44);
INSERT INTO `blocks` VALUES (680,1,1,'011',44);
INSERT INTO `blocks` VALUES (682,1,1,'004',44);
INSERT INTO `blocks` VALUES (686,1,1,'144',44);
INSERT INTO `blocks` VALUES (688,1,1,'137',44);
INSERT INTO `blocks` VALUES (690,1,1,'131',44);
INSERT INTO `blocks` VALUES (692,1,1,'124',44);
INSERT INTO `blocks` VALUES (694,1,1,'117',44);
INSERT INTO `blocks` VALUES (697,1,1,'111',44);
INSERT INTO `blocks` VALUES (698,1,1,'104',44);
INSERT INTO `blocks` VALUES (700,1,1,'001',48);
INSERT INTO `blocks` VALUES (701,1,1,'007',8);
INSERT INTO `blocks` VALUES (702,1,1,'014',8);
INSERT INTO `blocks` VALUES (703,1,1,'021',8);
INSERT INTO `blocks` VALUES (704,1,1,'027',8);
INSERT INTO `blocks` VALUES (705,1,1,'034',8);
INSERT INTO `blocks` VALUES (706,1,1,'041',8);
INSERT INTO `blocks` VALUES (709,1,1,'141',8);
INSERT INTO `blocks` VALUES (710,1,1,'134',8);
INSERT INTO `blocks` VALUES (711,1,1,'127',8);
INSERT INTO `blocks` VALUES (712,1,1,'121',8);
INSERT INTO `blocks` VALUES (713,1,1,'114',8);
INSERT INTO `blocks` VALUES (714,1,1,'107',8);
INSERT INTO `blocks` VALUES (715,1,1,'101',48);
INSERT INTO `blocks` VALUES (716,1,1,'204',38);
INSERT INTO `blocks` VALUES (717,1,1,'211',38);
INSERT INTO `blocks` VALUES (718,1,1,'217',38);
INSERT INTO `blocks` VALUES (719,1,1,'224',38);
INSERT INTO `blocks` VALUES (720,1,1,'231',38);
INSERT INTO `blocks` VALUES (721,1,1,'237',38);
INSERT INTO `blocks` VALUES (722,1,1,'244',38);
INSERT INTO `blocks` VALUES (723,1,1,'444',32);
INSERT INTO `blocks` VALUES (724,1,1,'437',32);
INSERT INTO `blocks` VALUES (725,1,1,'431',32);
INSERT INTO `blocks` VALUES (726,1,1,'424',32);
INSERT INTO `blocks` VALUES (727,1,1,'417',32);
INSERT INTO `blocks` VALUES (728,1,1,'411',32);
INSERT INTO `blocks` VALUES (729,1,1,'404',32);
INSERT INTO `blocks` VALUES (730,1,1,'544',2);
INSERT INTO `blocks` VALUES (731,1,1,'537',2);
INSERT INTO `blocks` VALUES (732,1,1,'534',22);
INSERT INTO `blocks` VALUES (733,1,1,'531',2);
INSERT INTO `blocks` VALUES (734,1,1,'541',22);
INSERT INTO `blocks` VALUES (735,1,1,'527',22);
INSERT INTO `blocks` VALUES (736,1,1,'524',2);
INSERT INTO `blocks` VALUES (737,1,1,'521',22);
INSERT INTO `blocks` VALUES (738,1,1,'517',2);
INSERT INTO `blocks` VALUES (739,1,1,'514',22);
INSERT INTO `blocks` VALUES (740,1,1,'511',2);
INSERT INTO `blocks` VALUES (741,1,1,'507',22);
INSERT INTO `blocks` VALUES (742,1,1,'504',2);
INSERT INTO `blocks` VALUES (743,1,1,'644',2);
INSERT INTO `blocks` VALUES (744,1,1,'641',12);
INSERT INTO `blocks` VALUES (745,1,1,'637',2);
INSERT INTO `blocks` VALUES (746,1,1,'634',12);
INSERT INTO `blocks` VALUES (747,1,1,'631',2);
INSERT INTO `blocks` VALUES (748,1,1,'627',12);
INSERT INTO `blocks` VALUES (749,1,1,'624',2);
INSERT INTO `blocks` VALUES (750,1,1,'621',12);
INSERT INTO `blocks` VALUES (751,1,1,'617',2);
INSERT INTO `blocks` VALUES (752,1,1,'614',12);
INSERT INTO `blocks` VALUES (753,1,1,'611',2);
INSERT INTO `blocks` VALUES (754,1,1,'607',12);
INSERT INTO `blocks` VALUES (755,1,1,'604',2);
INSERT INTO `blocks` VALUES (756,1,1,'744',5);
INSERT INTO `blocks` VALUES (757,1,1,'741',12);
INSERT INTO `blocks` VALUES (758,1,1,'737',5);
INSERT INTO `blocks` VALUES (759,1,1,'734',12);
INSERT INTO `blocks` VALUES (760,1,1,'731',5);
INSERT INTO `blocks` VALUES (761,1,1,'727',12);
INSERT INTO `blocks` VALUES (762,1,1,'724',5);
INSERT INTO `blocks` VALUES (763,1,1,'721',12);
INSERT INTO `blocks` VALUES (764,1,1,'717',5);
INSERT INTO `blocks` VALUES (765,1,1,'714',12);
INSERT INTO `blocks` VALUES (766,1,1,'711',5);
INSERT INTO `blocks` VALUES (767,1,1,'704',5);
INSERT INTO `blocks` VALUES (768,1,1,'707',12);
INSERT INTO `blocks` VALUES (769,1,1,'844',2);
INSERT INTO `blocks` VALUES (770,1,1,'837',2);
INSERT INTO `blocks` VALUES (771,1,1,'831',2);
INSERT INTO `blocks` VALUES (772,1,1,'824',2);
INSERT INTO `blocks` VALUES (773,1,1,'817',2);
INSERT INTO `blocks` VALUES (774,1,1,'811',2);
INSERT INTO `blocks` VALUES (775,1,1,'804',2);
INSERT INTO `blocks` VALUES (776,1,1,'241',5);
INSERT INTO `blocks` VALUES (777,1,1,'234',5);
INSERT INTO `blocks` VALUES (778,1,1,'227',5);
INSERT INTO `blocks` VALUES (779,1,1,'221',5);
INSERT INTO `blocks` VALUES (780,1,1,'214',5);
INSERT INTO `blocks` VALUES (781,1,1,'207',5);
INSERT INTO `blocks` VALUES (783,1,1,'201',48);
INSERT INTO `blocks` VALUES (784,1,1,'247',48);
INSERT INTO `blocks` VALUES (785,1,1,'147',48);
INSERT INTO `blocks` VALUES (786,1,1,'047',48);
INSERT INTO `blocks` VALUES (791,1,1,'314',47);
INSERT INTO `blocks` VALUES (792,1,1,'307',47);
INSERT INTO `blocks` VALUES (793,1,1,'341',47);
INSERT INTO `blocks` VALUES (794,1,1,'334',47);
INSERT INTO `blocks` VALUES (795,1,1,'321',47);
INSERT INTO `blocks` VALUES (796,1,1,'301',48);
INSERT INTO `blocks` VALUES (797,1,1,'347',48);
INSERT INTO `blocks` VALUES (798,1,1,'447',48);
INSERT INTO `blocks` VALUES (799,1,1,'547',48);
INSERT INTO `blocks` VALUES (800,1,1,'647',48);
INSERT INTO `blocks` VALUES (801,1,1,'747',48);
INSERT INTO `blocks` VALUES (802,1,1,'847',48);
INSERT INTO `blocks` VALUES (803,1,1,'947',48);
INSERT INTO `blocks` VALUES (804,1,1,'601',48);
INSERT INTO `blocks` VALUES (805,1,1,'701',48);
INSERT INTO `blocks` VALUES (806,1,1,'801',48);
INSERT INTO `blocks` VALUES (807,1,1,'901',48);
INSERT INTO `blocks` VALUES (808,1,1,'501',48);
INSERT INTO `blocks` VALUES (809,1,1,'401',48);
INSERT INTO `blocks` VALUES (810,1,1,'841',12);
INSERT INTO `blocks` VALUES (811,1,1,'834',12);
INSERT INTO `blocks` VALUES (812,1,1,'827',12);
INSERT INTO `blocks` VALUES (813,1,1,'821',12);
INSERT INTO `blocks` VALUES (814,1,1,'814',12);
INSERT INTO `blocks` VALUES (815,1,1,'807',12);
INSERT INTO `blocks` VALUES (816,1,1,'941',12);
INSERT INTO `blocks` VALUES (817,1,1,'934',12);
INSERT INTO `blocks` VALUES (818,1,1,'927',12);
INSERT INTO `blocks` VALUES (819,1,1,'921',12);
INSERT INTO `blocks` VALUES (820,1,1,'914',12);
INSERT INTO `blocks` VALUES (821,1,1,'907',12);
INSERT INTO `blocks` VALUES (822,1,1,'j47',48);
INSERT INTO `blocks` VALUES (823,1,1,'i48',48);
INSERT INTO `blocks` VALUES (824,1,1,'i46',48);
INSERT INTO `blocks` VALUES (825,1,1,'h47',48);
INSERT INTO `blocks` VALUES (826,1,1,'j01',48);
INSERT INTO `blocks` VALUES (827,1,1,'i02',48);
INSERT INTO `blocks` VALUES (828,1,1,'i00',48);
INSERT INTO `blocks` VALUES (829,1,1,'h01',48);
INSERT INTO `blocks` VALUES (830,1,1,'h41',3);
INSERT INTO `blocks` VALUES (831,1,1,'h34',3);
INSERT INTO `blocks` VALUES (832,1,1,'h27',3);
INSERT INTO `blocks` VALUES (833,1,1,'h21',3);
INSERT INTO `blocks` VALUES (834,1,1,'h14',3);
INSERT INTO `blocks` VALUES (835,1,1,'h07',3);
INSERT INTO `blocks` VALUES (836,1,1,'i40',3);
INSERT INTO `blocks` VALUES (837,1,1,'i33',3);
INSERT INTO `blocks` VALUES (838,1,1,'i26',3);
INSERT INTO `blocks` VALUES (839,1,1,'i20',3);
INSERT INTO `blocks` VALUES (840,1,1,'i13',3);
INSERT INTO `blocks` VALUES (841,1,1,'i06',3);
INSERT INTO `blocks` VALUES (842,1,1,'i42',3);
INSERT INTO `blocks` VALUES (843,1,1,'i35',3);
INSERT INTO `blocks` VALUES (844,1,1,'i28',3);
INSERT INTO `blocks` VALUES (845,1,1,'i22',3);
INSERT INTO `blocks` VALUES (846,1,1,'i15',3);
INSERT INTO `blocks` VALUES (847,1,1,'i08',3);
INSERT INTO `blocks` VALUES (848,1,1,'j41',3);
INSERT INTO `blocks` VALUES (849,1,1,'j34',3);
INSERT INTO `blocks` VALUES (850,1,1,'j27',3);
INSERT INTO `blocks` VALUES (851,1,1,'j21',3);
INSERT INTO `blocks` VALUES (852,1,1,'j14',3);
INSERT INTO `blocks` VALUES (853,1,1,'j07',3);
INSERT INTO `blocks` VALUES (854,1,1,'944',5);
INSERT INTO `blocks` VALUES (855,1,1,'937',5);
INSERT INTO `blocks` VALUES (856,1,1,'931',5);
INSERT INTO `blocks` VALUES (857,1,1,'924',5);
INSERT INTO `blocks` VALUES (858,1,1,'917',5);
INSERT INTO `blocks` VALUES (859,1,1,'911',5);
INSERT INTO `blocks` VALUES (860,1,1,'904',5);
INSERT INTO `blocks` VALUES (861,1,1,'441',5);
INSERT INTO `blocks` VALUES (862,1,1,'434',5);
INSERT INTO `blocks` VALUES (863,1,1,'427',5);
INSERT INTO `blocks` VALUES (864,1,1,'421',5);
INSERT INTO `blocks` VALUES (865,1,1,'414',5);
INSERT INTO `blocks` VALUES (866,1,1,'407',5);
INSERT INTO `blocks` VALUES (867,1,1,'344',5);
INSERT INTO `blocks` VALUES (868,1,1,'337',5);
INSERT INTO `blocks` VALUES (869,1,1,'331',5);
INSERT INTO `blocks` VALUES (870,1,1,'324',5);
INSERT INTO `blocks` VALUES (871,1,1,'317',5);
INSERT INTO `blocks` VALUES (872,1,1,'311',5);
INSERT INTO `blocks` VALUES (873,1,1,'304',5);
INSERT INTO `blocks` VALUES (874,1,1,'327',47);
INSERT INTO `blocks` VALUES (875,1,1,'g45',25);
INSERT INTO `blocks` VALUES (876,1,1,'g38',25);
INSERT INTO `blocks` VALUES (877,1,1,'g32',25);
INSERT INTO `blocks` VALUES (878,1,1,'g25',25);
INSERT INTO `blocks` VALUES (879,1,1,'g18',25);
INSERT INTO `blocks` VALUES (880,1,1,'g12',25);
INSERT INTO `blocks` VALUES (881,1,1,'g05',25);
INSERT INTO `blocks` VALUES (882,1,1,'g48',9);
INSERT INTO `blocks` VALUES (883,1,1,'g42',9);
INSERT INTO `blocks` VALUES (884,1,1,'g35',9);
INSERT INTO `blocks` VALUES (885,1,1,'g28',9);
INSERT INTO `blocks` VALUES (886,1,1,'g22',9);
INSERT INTO `blocks` VALUES (887,1,1,'g15',9);
INSERT INTO `blocks` VALUES (888,1,1,'g08',9);
INSERT INTO `blocks` VALUES (889,1,1,'g02',9);
INSERT INTO `blocks` VALUES (890,1,1,'c45',1);
INSERT INTO `blocks` VALUES (891,1,1,'c38',1);
INSERT INTO `blocks` VALUES (892,1,1,'c32',1);
INSERT INTO `blocks` VALUES (893,1,1,'c25',1);
INSERT INTO `blocks` VALUES (894,1,1,'c18',1);
INSERT INTO `blocks` VALUES (895,1,1,'c12',1);
INSERT INTO `blocks` VALUES (896,1,1,'c05',1);
INSERT INTO `blocks` VALUES (897,1,1,'c43',1);
INSERT INTO `blocks` VALUES (898,1,1,'c36',1);
INSERT INTO `blocks` VALUES (899,1,1,'c30',1);
INSERT INTO `blocks` VALUES (900,1,1,'c23',1);
INSERT INTO `blocks` VALUES (901,1,1,'c16',1);
INSERT INTO `blocks` VALUES (903,1,1,'c10',1);
INSERT INTO `blocks` VALUES (904,1,1,'c03',1);
INSERT INTO `blocks` VALUES (905,1,1,'d44',1);
INSERT INTO `blocks` VALUES (906,1,1,'d37',1);
INSERT INTO `blocks` VALUES (907,1,1,'d31',1);
INSERT INTO `blocks` VALUES (908,1,1,'d24',1);
INSERT INTO `blocks` VALUES (909,1,1,'d17',1);
INSERT INTO `blocks` VALUES (910,1,1,'d11',1);
INSERT INTO `blocks` VALUES (911,1,1,'d04',1);
INSERT INTO `blocks` VALUES (912,1,1,'d47',13);
INSERT INTO `blocks` VALUES (913,1,1,'d41',13);
INSERT INTO `blocks` VALUES (914,1,1,'d34',13);
INSERT INTO `blocks` VALUES (915,1,1,'d27',13);
INSERT INTO `blocks` VALUES (916,1,1,'d21',13);
INSERT INTO `blocks` VALUES (917,1,1,'d14',13);
INSERT INTO `blocks` VALUES (918,1,1,'d07',13);
INSERT INTO `blocks` VALUES (919,1,1,'d01',13);
INSERT INTO `blocks` VALUES (920,1,1,'c48',13);
INSERT INTO `blocks` VALUES (921,1,1,'c42',13);
INSERT INTO `blocks` VALUES (922,1,1,'c35',13);
INSERT INTO `blocks` VALUES (923,1,1,'c28',13);
INSERT INTO `blocks` VALUES (924,1,1,'c22',13);
INSERT INTO `blocks` VALUES (925,1,1,'c15',13);
INSERT INTO `blocks` VALUES (926,1,1,'c08',13);
INSERT INTO `blocks` VALUES (927,1,1,'c02',13);
INSERT INTO `blocks` VALUES (928,1,1,'c46',13);
INSERT INTO `blocks` VALUES (929,1,1,'c40',13);
INSERT INTO `blocks` VALUES (930,1,1,'c33',13);
INSERT INTO `blocks` VALUES (931,1,1,'c26',13);
INSERT INTO `blocks` VALUES (932,1,1,'c20',13);
INSERT INTO `blocks` VALUES (933,1,1,'c13',13);
INSERT INTO `blocks` VALUES (934,1,1,'c06',13);
INSERT INTO `blocks` VALUES (935,1,1,'c00',13);
INSERT INTO `blocks` VALUES (936,1,1,'b47',24);
INSERT INTO `blocks` VALUES (937,1,1,'b44',24);
INSERT INTO `blocks` VALUES (938,1,1,'b41',24);
INSERT INTO `blocks` VALUES (939,1,1,'b37',24);
INSERT INTO `blocks` VALUES (940,1,1,'b34',24);
INSERT INTO `blocks` VALUES (941,1,1,'b31',24);
INSERT INTO `blocks` VALUES (942,1,1,'b27',24);
INSERT INTO `blocks` VALUES (943,1,1,'b24',24);
INSERT INTO `blocks` VALUES (944,1,1,'b21',24);
INSERT INTO `blocks` VALUES (945,1,1,'b17',24);
INSERT INTO `blocks` VALUES (946,1,1,'b14',24);
INSERT INTO `blocks` VALUES (947,1,1,'b11',24);
INSERT INTO `blocks` VALUES (948,1,1,'b07',24);
INSERT INTO `blocks` VALUES (949,1,1,'b04',24);
INSERT INTO `blocks` VALUES (950,1,1,'b01',24);
INSERT INTO `blocks` VALUES (951,1,1,'e43',11);
INSERT INTO `blocks` VALUES (952,1,1,'e36',11);
INSERT INTO `blocks` VALUES (953,1,1,'e30',11);
INSERT INTO `blocks` VALUES (954,1,1,'e23',11);
INSERT INTO `blocks` VALUES (955,1,1,'e16',11);
INSERT INTO `blocks` VALUES (956,1,1,'e10',11);
INSERT INTO `blocks` VALUES (957,1,1,'e03',11);
CREATE UNIQUE INDEX "zones_idx" on zones (zonename ASC);
CREATE UNIQUE INDEX "soils_idx" on soils (soilname ASC);
CREATE UNIQUE INDEX "plots_idx" on plots (plotname ASC);
CREATE UNIQUE INDEX "plants_idx" on plants (plantname ASC);
CREATE UNIQUE INDEX "cycles_idx" on cycles (cyclename ASC);
CREATE VIEW "view_plants_qty" AS
SELECT
blockplot AS blockplotidx,
plotname AS blockplot,
blockcycle AS blockcycleidx,
cyclename AS blockcycle,
blockplant AS blockplantidx,
plantname AS blockplant,
count(blockplant) as blockplantqty

FROM blocks

LEFT JOIN plots ON blockplot=plotidx
LEFT JOIN cycles ON blockcycle=cycleidx
LEFT JOIN plants ON blockplant=plantidx

GROUP BY blockplot,blockplot,blockplant
ORDER BY blockplot,blockplot,blockplant;
CREATE VIEW "view_blocks" AS
SELECT
blockidx,
blockplot AS blockplotidx,
plotname AS blockplot,
plotlx AS blockplotx,
plotly AS blockploty,
blockcycle AS blockcycleidx,
cyclename AS blockcycle,
plotname || '-' || cyclename AS blockplotcycle,
blockcode,
blockplant AS blockplantidx,
plantname AS blockplant

FROM blocks

LEFT JOIN plots ON blockplot=plotidx
LEFT JOIN cycles ON blockcycle=cycleidx
LEFT JOIN plants ON blockplant=plantidx

ORDER BY blockplotcycle ASC;
COMMIT;

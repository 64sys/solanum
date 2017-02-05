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
CREATE UNIQUE INDEX "zones_idx" on zones (zonename ASC);
CREATE UNIQUE INDEX "soils_idx" on soils (soilname ASC);
CREATE UNIQUE INDEX "plots_idx" on plots (plotname ASC);
CREATE UNIQUE INDEX "plants_idx" on plants (plantname ASC);
CREATE UNIQUE INDEX "cycles_idx" on cycles (cyclename ASC);
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

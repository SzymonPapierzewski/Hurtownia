use Source;

INSERT INTO Klient
VALUES (1,'Kowalski', 'Mariusz', 90081678765, 'mariusz@pudelek.com', CONVERT(Datetime,'2018-01-12 12:15:12'),0),
	   (2,'Nadziałek', 'Kleofas', 92011278425, 'niedziałek@karakan.isi.pl', CONVERT(Datetime,'2018-01-14 13:30:44'),0),
	   (3,'Zapominalski', 'Jakub', 86786567652, 'nudziarz1991@onet.eu', CONVERT(Datetime,'2018-02-11 12:10:24'),0),
	   (4,'Kędzior', 'Tomasz', 94501673765, 'kadzior@pudelek.com', CONVERT(Datetime,'2018-02-14 13:10:53'),0),
	   (5,'Andrzejowski', 'Marek', 78765654254, 'andrzejowski@gmail.com', CONVERT(Datetime,'2018-02-17 13:11:24'),0);
INSERT INTO Film
VALUES (1,22,'Roman Polański','20130122','Pianista',12,10,CONVERT(Datetime,'2017-06-22 13:14:32'),0),
	   (2,45,'Shawn Connery','19930214','The Rock',20,18,CONVERT(Datetime,'2017-09-11 15:12:02'),0),
	   (3,18,'George Lucas','19871221','Star Wars ep. IV',20,11,CONVERT(Datetime,'2017-10-17 14:10:02'),0),
	   (4,25,'Mel Gibson','20050102','Patriot',17,10,CONVERT(Datetime,'2017-11-12 15:10:02'),0);
INSERT INTO Zamowienie
VALUES (1,1,2,CONVERT(Datetime,'2018-04-12 13:10:02'),CONVERT(Datetime,'2018-04-12 13:11:00'),0),
       (2,1,4,CONVERT(Datetime,'2018-04-12 14:10:02'),CONVERT(Datetime,'2018-04-12 14:11:02'),0),
       (3,2,1,CONVERT(Datetime,'2018-04-12 15:10:02'),CONVERT(Datetime,'2018-04-12 15:11:02'),0),
	   (4,3,1,CONVERT(Datetime,'2018-04-14 15:12:42'),CONVERT(Datetime,'2018-04-14 15:13:42'),0),
	   (5,3,3,CONVERT(Datetime,'2018-04-14 15:45:12'),CONVERT(Datetime,'2018-04-14 15:46:10'),0),
	   (6,2,5,CONVERT(Datetime,'2018-04-15 13:10:42'),CONVERT(Datetime,'2018-04-15 13:11:40'),0),
	   (7,4,5,CONVERT(Datetime,'2018-04-15 14:11:12'),CONVERT(Datetime,'2018-04-15 14:12:12'),0),
	   (8,4,3,CONVERT(Datetime,'2018-04-15 15:13:01'),CONVERT(Datetime,'2018-04-15 15:14:01'),0);
INSERT INTO Zgoda
VALUES (1,CONVERT(Datetime,'2018-01-12 12:15:12'),0),
		(2,CONVERT(Datetime,'2018-01-14 13:30:44'),0),
		(3,CONVERT(Datetime,'2018-02-11 12:10:24'),0),
       	(4,CONVERT(Datetime,'2018-02-14 13:10:53'),0),
		(5,CONVERT(Datetime,'2018-02-17 13:11:24'),0);
INSERT INTO Zgoda_klienta
VALUES (1,1,1,CONVERT(Datetime,'2018-01-12 12:15:12'),CONVERT(Datetime,'2018-01-12 12:15:13'),0),
		(2,2,2,CONVERT(Datetime,'2018-01-14 13:30:44'),CONVERT(Datetime,'2018-01-14 13:30:45'),0),
		(3,3,3,CONVERT(Datetime,'2018-02-11 12:10:24'),CONVERT(Datetime,'2018-02-11 12:10:25'),0),
		(4,4,4,CONVERT(Datetime,'2018-02-14 13:10:53'),CONVERT(Datetime,'2018-02-14 13:10:54'),0),
		(5,5,5,CONVERT(Datetime,'2018-02-17 13:11:24'),CONVERT(Datetime,'2018-02-17 13:11:25'),0);
INSERT INTO Wypozyczenie
VALUES (1,2,1,CONVERT(Datetime,'2018-04-13 11:10:02'),CONVERT(Datetime,'2018-04-17 11:10:02'),CONVERT(Datetime,'2018-04-18 11:10:02'),CONVERT(Datetime,'2018-04-13 11:11:02'),0),
		(2,4,1,CONVERT(Datetime,'2018-04-13 16:10:44'),CONVERT(Datetime,'2018-04-19 11:10:44'),CONVERT(Datetime,'2018-04-19 16:10:44'),CONVERT(Datetime,'2018-04-13 16:11:44'),0),
		(3,1,2,CONVERT(Datetime,'2018-04-14 12:10:01'),CONVERT(Datetime,'2018-04-20 14:10:01'),CONVERT(Datetime,'2018-04-19 12:10:01'),CONVERT(Datetime,'2018-04-14 12:11:01'),0),
		(4,1,3,CONVERT(Datetime,'2018-04-14 20:12:42'),CONVERT(Datetime,'2018-04-18 20:12:42'),CONVERT(Datetime,'2018-04-17 11:12:42'),CONVERT(Datetime,'2018-04-14 20:13:42'),0),
		(5,3,3,CONVERT(Datetime,'2018-04-15 10:41:11'),CONVERT(Datetime,'2018-04-17 11:42:12'),CONVERT(Datetime,'2018-04-18 10:41:11'),CONVERT(Datetime,'2018-04-15 10:42:11'),0),
		(6,5,2,CONVERT(Datetime,'2018-04-15 17:15:42'),CONVERT(Datetime,'2018-04-16 19:12:11'),CONVERT(Datetime,'2018-04-18 17:15:42'),CONVERT(Datetime,'2018-04-15 17:16:42'),0),
		(7,5,4,CONVERT(Datetime,'2018-04-17 19:12:12'),CONVERT(Datetime,'2018-04-20 12:13:10'),CONVERT(Datetime,'2018-04-20 19:12:12'),CONVERT(Datetime,'2018-04-17 19:13:12'),0),
		(8,3,4,CONVERT(Datetime,'2018-04-15 16:25:23'),CONVERT(Datetime,'2018-04-25 11:22:23'),CONVERT(Datetime,'2018-04-20 16:25:23'),CONVERT(Datetime,'2018-04-15 16:26:23'),0);
INSERT INTO Dostawa
VALUES (1,1,12,CONVERT(Datetime,'2017-06-22 13:13:02'),CONVERT(Datetime,'2017-06-22 13:13:32'),0),
		(2,2,20,CONVERT(Datetime,'2017-09-11 15:11:02'),CONVERT(Datetime,'2017-09-11 15:12:02'),0),
		(3,3,20,CONVERT(Datetime,'2017-10-16 21:10:02'),CONVERT(Datetime,'2017-10-17 14:10:02'),0),
		(4,4,17,CONVERT(Datetime,'2017-11-12 15:05:02'),CONVERT(Datetime,'2017-11-12 15:10:02'),0);
INSERT INTO Reklama
VALUES (1,CONVERT(Datetime,'2018-01-01 15:10:02'),0),
		(2,CONVERT(Datetime,'2018-01-01 15:10:10'),0),
		(3,CONVERT(Datetime,'2018-01-01 17:10:15'),0);
INSERT INTO Przeslanie_reklamy
VALUES (1,1,2,CONVERT(Datetime,'2018-02-12 12:10:15'),CONVERT(Datetime,'2018-02-12 12:12:15'),0),
		(2,2,1,CONVERT(Datetime,'2018-03-12 15:10:15'),CONVERT(Datetime,'2018-03-12 15:16:15'),0),
		(3,1,1,CONVERT(Datetime,'2018-04-12 16:10:15'),CONVERT(Datetime,'2018-04-12 17:10:15'),0),
		(4,1,3,CONVERT(Datetime,'2018-04-13 17:10:15'),CONVERT(Datetime,'2018-04-13 17:15:15'),0);



	 
	 

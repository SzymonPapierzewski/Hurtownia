use ProjektHurtownia

/*-------------------*/
/*      Klient       */
/*-------------------*/
select id_klienta,Nazwisko,Imie,pesel,mail,delete_klient into tmp_SOURCE_Klient from STAGE_SOURCE_Klient where 1 = 2;

DECLARE @LoopCounter INT , @MaxCounter INT
SELECT @LoopCounter = min(id_klienta) , @MaxCounter = max(id_klienta) 
FROM STAGE_SOURCE_Klient
 
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if (select count(*) from META_id_translator where id_w_zrodle = @LoopCounter and nazwa_zrodla = 'SOURCE' and nazwa_tabeli = 'Klient') = 0
		insert into META_id_translator values (next value  for dbo.seq_META_id_translator,'SOURCE','Klient',@LoopCounter,next value for dbo.seq_Klient);

	insert into tmp_SOURCE_Klient (id_klienta,Nazwisko,Imie,pesel,mail,delete_klient)
	select distinct(
			select distinct m.id_w_hurtowni  
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Klient'
				and m.id_w_zrodle = @LoopCounter
			),
			stg.Nazwisko,
			stg.Imie,
			stg.pesel,
			stg.mail,
			stg.delete_klient
	from dbo.STAGE_SOURCE_Klient stg
	where stg.id_klienta = @LoopCounter and stg.data_wprowadzenia_rekordu_klient > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');

   SELECT @LoopCounter  = min(id_klienta) FROM STAGE_SOURCE_Klient
   WHERE id_klienta > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','tmp_SOURCE_Klient');
/*-------------------*/
/*      Film         */
/*-------------------*/
select id_filmu,cena,Rezyser,Rok_wydania,Tytul,ilosc_egzemplarzy,Stan,delete_film into tmp_SOURCE_Film from STAGE_SOURCE_Film where 1 = 2;

SELECT @LoopCounter = min(id_filmu) , @MaxCounter = max(id_filmu) 
FROM STAGE_SOURCE_Film
 
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if (select count(*) from META_id_translator where id_w_zrodle = @LoopCounter and nazwa_zrodla = 'SOURCE' and nazwa_tabeli = 'Film') = 0
		insert into META_id_translator values (next value  for dbo.seq_META_id_translator,'SOURCE','Film',@LoopCounter,next value for dbo.seq_Film);

	insert into tmp_SOURCE_Film (id_filmu,cena,Rezyser,Rok_wydania,Tytul,ilosc_egzemplarzy,Stan,delete_film)
	select distinct(
			select distinct m.id_w_hurtowni  
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Film'
				and m.id_w_zrodle = @LoopCounter
			),
			stg.cena,
			stg.Rezyser,
			stg.Rok_wydania,
			stg.Tytul,
			stg.ilosc_egzemplarzy,
			stg.Stan,
			stg.delete_film
	from dbo.STAGE_SOURCE_Film stg
	where stg.id_filmu = @LoopCounter and stg.data_wprowadzenia_rekordu_film > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');

   SELECT @LoopCounter  = min(id_filmu) FROM STAGE_SOURCE_Film
   WHERE id_filmu > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','tmp_SOURCE_Film');
/*-------------------*/
/*    Zamowienie     */
/*-------------------*/
select id_zamowienia,id_filmu,id_klienta,data_zamowienia,delete_zamowienie into tmp_SOURCE_Zamowienie from STAGE_SOURCE_Zamowienie where 1 = 2;

SELECT @LoopCounter = min(id_zamowienia) , @MaxCounter = max(id_zamowienia) 
FROM STAGE_SOURCE_Zamowienie
 
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if (select count(*) from META_id_translator where id_w_zrodle = @LoopCounter and nazwa_zrodla = 'SOURCE' and nazwa_tabeli = 'Zamowienie') = 0
		insert into META_id_translator values (next value  for dbo.seq_META_id_translator,'SOURCE','Zamowienie',@LoopCounter,next value for dbo.seq_Zamowienie);

	insert into tmp_SOURCE_Zamowienie (id_zamowienia,id_filmu,id_klienta,data_zamowienia,delete_zamowienie)
	select distinct(
			select distinct m.id_w_hurtowni  
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Zamowienie'
				and m.id_w_zrodle = @LoopCounter
			),
			stg.id_filmu,
			stg.id_klienta,
			stg.data_zamowienia,
			stg.delete_zamowienie
	from dbo.STAGE_SOURCE_Zamowienie stg
	where stg.id_zamowienia = @LoopCounter and stg.data_wprowadzenia_rekordu_zamowienie > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');

   SELECT @LoopCounter  = min(id_zamowienia) FROM STAGE_SOURCE_Zamowienie
   WHERE id_zamowienia > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','tmp_SOURCE_Zamowienie');
/*-------------------*/
/*       Zgoda       */
/*-------------------*/
select id_zgody,delete_zgoda into tmp_SOURCE_Zgoda from STAGE_SOURCE_Zgoda where 1 = 2;

SELECT @LoopCounter = min(id_zgody) , @MaxCounter = max(id_zgody) 
FROM STAGE_SOURCE_Zgoda
 
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if (select count(*) from META_id_translator where id_w_zrodle = @LoopCounter and nazwa_zrodla = 'SOURCE' and nazwa_tabeli = 'Zgoda') = 0
		insert into META_id_translator values (next value  for dbo.seq_META_id_translator,'SOURCE','Zgoda',@LoopCounter,next value for dbo.seq_Zgoda);

	insert into tmp_SOURCE_Zgoda (id_zgody,delete_zgoda)
	select distinct(
			select distinct m.id_w_hurtowni  
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Zgoda'
				and m.id_w_zrodle = @LoopCounter
			),
			stg.delete_zgoda
	from dbo.STAGE_SOURCE_Zgoda stg
	where stg.id_zgody = @LoopCounter and stg.data_wprowadzenia_rekordu_zgoda > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');

   SELECT @LoopCounter  = min(id_zgody) FROM STAGE_SOURCE_Zgoda
   WHERE id_zgody > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','tmp_SOURCE_Zgoda');
/*-------------------*/
/*   Zgoda_klienta   */
/*-------------------*/
select id_zgody_klienta,id_klienta,id_zgody,data_zgody,delete_zgoda_klienta into tmp_SOURCE_Zgoda_klienta from STAGE_SOURCE_Zgoda_klienta where 1 = 2;

SELECT @LoopCounter = min(id_zgody_klienta) , @MaxCounter = max(id_zgody_klienta) 
FROM STAGE_SOURCE_Zgoda_klienta
 
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if (select count(*) from META_id_translator where id_w_zrodle = @LoopCounter and nazwa_zrodla = 'SOURCE' and nazwa_tabeli = 'Zgoda_klienta') = 0
		insert into META_id_translator values (next value  for dbo.seq_META_id_translator,'SOURCE','Zgoda_klienta',@LoopCounter,next value for dbo.seq_Zgoda_klienta);

	insert into tmp_SOURCE_Zgoda_klienta (id_zgody_klienta,id_klienta,id_zgody,data_zgody,delete_zgoda_klienta)
	select distinct(
			select distinct m.id_w_hurtowni  
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Zgoda_klienta'
				and m.id_w_zrodle = @LoopCounter
			),
			(
			select distinct m.id_w_hurtowni 
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Klient'
				and m.id_w_zrodle = stg.id_klienta
			),
			(
			select distinct m.id_w_hurtowni 
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Zgoda'
				and m.id_w_zrodle = stg.id_zgody
			),
			stg.data_zgody,
			stg.delete_zgoda_klienta
	from dbo.STAGE_SOURCE_Zgoda_klienta stg
	where stg.id_zgody_klienta = @LoopCounter and stg.data_wprowadzenia_rekordu_zgoda_klienta > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');

   SELECT @LoopCounter  = min(id_zgody_klienta) FROM STAGE_SOURCE_Zgoda_klienta
   WHERE id_zgody_klienta > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','tmp_SOURCE_Zgoda_klienta');
/*-------------------*/
/*    Wypozyczenie   */
/*-------------------*/
select id_wypozyczenia,id_klienta,id_filmu,data_wypozyczenia,data_oddania,termin_oddania,delete_wypozyczenie into tmp_SOURCE_Wypozyczenie from STAGE_SOURCE_Wypozyczenie where 1 = 2;

SELECT @LoopCounter = min(id_wypozyczenia) , @MaxCounter = max(id_wypozyczenia) 
FROM STAGE_SOURCE_Wypozyczenie
 
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if (select count(*) from META_id_translator where id_w_zrodle = @LoopCounter and nazwa_zrodla = 'SOURCE' and nazwa_tabeli = 'Wypozyczenie') = 0
		insert into META_id_translator values (next value  for dbo.seq_META_id_translator,'SOURCE','Wypozyczenie',@LoopCounter,next value for dbo.seq_Wypozyczenie);

	insert into tmp_SOURCE_Wypozyczenie (id_wypozyczenia,id_klienta,id_filmu,data_wypozyczenia,data_oddania,termin_oddania,delete_wypozyczenie)
	select distinct(
			select distinct m.id_w_hurtowni 
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Wypozyczenie'
				and m.id_w_zrodle = @LoopCounter
			),
			(
			select distinct m.id_w_hurtowni 
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Klient'
				and m.id_w_zrodle = stg.id_klienta
			),
			(
			select distinct m.id_w_hurtowni 
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Film'
				and m.id_w_zrodle = stg.id_filmu
			),
			stg.data_wypozyczenia,
			stg.data_oddania,
			stg.termin_oddania,
			stg.delete_wypozyczenie
	from dbo.STAGE_SOURCE_Wypozyczenie stg
	where stg.id_wypozyczenia = @LoopCounter and stg.data_wprowadzenia_rekordu_wypozyczenie > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');

   SELECT @LoopCounter  = min(id_wypozyczenia) FROM STAGE_SOURCE_Wypozyczenie
   WHERE id_wypozyczenia > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','tmp_SOURCE_Wypozyczenie');
/*-------------------*/
/*      Dostawa      */
/*-------------------*/
select id_dostawy,id_filmu,ilosc_dostarczonych_egzemplarzy,data_dostawy,delete_dostawa into tmp_SOURCE_Dostawa from STAGE_SOURCE_Dostawa where 1 = 2;

SELECT @LoopCounter = min(id_dostawy) , @MaxCounter = max(id_dostawy) 
FROM STAGE_SOURCE_Dostawa
 
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if (select count(*) from META_id_translator where id_w_zrodle = @LoopCounter and nazwa_zrodla = 'SOURCE' and nazwa_tabeli = 'Dostawa') = 0
		insert into META_id_translator values (next value  for dbo.seq_META_id_translator,'SOURCE','Dostawa',@LoopCounter,next value for dbo.seq_Dostawa);

	insert into tmp_SOURCE_Dostawa (id_dostawy,id_filmu,ilosc_dostarczonych_egzemplarzy,data_dostawy,delete_dostawa)
	select distinct(
			select distinct m.id_w_hurtowni  
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Dostawa'
				and m.id_w_zrodle = @LoopCounter
			),
			(
			select distinct m.id_w_hurtowni 
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Film'
				and m.id_w_zrodle = stg.id_filmu
			),
			stg.ilosc_dostarczonych_egzemplarzy,
			stg.data_dostawy,
			stg.delete_dostawa
	from dbo.STAGE_SOURCE_Dostawa stg
	where stg.id_dostawy = @LoopCounter and stg.data_wprowadzenia_rekordu_dostawa > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');

   SELECT @LoopCounter  = min(id_dostawy) FROM STAGE_SOURCE_Dostawa
   WHERE id_dostawy > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','tmp_SOURCE_Dostawa');
/*-------------------*/
/*      Reklama      */
/*-------------------*/
select id_reklamy,delete_reklama into tmp_SOURCE_Reklama from STAGE_SOURCE_Reklama where 1 = 2;

SELECT @LoopCounter = min(id_reklamy) , @MaxCounter = max(id_reklamy) 
FROM STAGE_SOURCE_Reklama
 
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if (select count(*) from META_id_translator where id_w_zrodle = @LoopCounter and nazwa_zrodla = 'SOURCE' and nazwa_tabeli = 'Reklama') = 0
		insert into META_id_translator values (next value  for dbo.seq_META_id_translator,'SOURCE','Reklama',@LoopCounter,next value for dbo.seq_Reklama);

	insert into tmp_SOURCE_Reklama (id_reklamy,delete_reklama)
	select distinct(
			select distinct m.id_w_hurtowni  
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Reklama'
				and m.id_w_zrodle = @LoopCounter
			),
			stg.delete_reklama
	from dbo.STAGE_SOURCE_Reklama stg
	where stg.id_reklamy = @LoopCounter and stg.data_wprowadzenia_rekordu_reklama > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');

   SELECT @LoopCounter  = min(id_reklamy) FROM STAGE_SOURCE_Reklama
   WHERE id_reklamy > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','tmp_SOURCE_Reklama');
/*-------------------*/
/* Przeslanie_reklamy*/
/*-------------------*/
select id_przeslania_reklamy,id_klienta,id_reklamy,data_wyslania_reklamy,delete_przeslanie_reklamy into tmp_SOURCE_Przeslanie_reklamy from STAGE_SOURCE_Przeslanie_reklamy where 1 = 2;

SELECT @LoopCounter = min(id_przeslania_reklamy) , @MaxCounter = max(id_przeslania_reklamy) 
FROM STAGE_SOURCE_Przeslanie_reklamy
 
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if (select count(*) from META_id_translator where id_w_zrodle = @LoopCounter and nazwa_zrodla = 'SOURCE' and nazwa_tabeli = 'Przeslanie_reklamy') = 0
		insert into META_id_translator values (next value  for dbo.seq_META_id_translator,'SOURCE','Przeslanie_reklamy',@LoopCounter,next value for dbo.seq_Przeslanie_reklamy);

	insert into tmp_SOURCE_Przeslanie_reklamy (id_przeslania_reklamy,id_reklamy,id_klienta,data_wyslania_reklamy,delete_przeslanie_reklamy)
	select distinct(
			select distinct m.id_w_hurtowni  
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Przeslanie_reklamy'
				and m.id_w_zrodle = @LoopCounter
			),
			(
			select distinct m.id_w_hurtowni 
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Reklama'
				and m.id_w_zrodle = stg.id_reklamy
			),
			(
			select distinct m.id_w_hurtowni 
			from META_id_translator m
			where m.nazwa_zrodla = 'SOURCE'
				and m.nazwa_tabeli = 'Klient'
				and m.id_w_zrodle = stg.id_klienta
			),
			stg.data_wyslania_reklamy,
			stg.delete_przeslanie_reklamy
	from dbo.STAGE_SOURCE_Przeslanie_reklamy stg
	where stg.id_przeslania_reklamy = @LoopCounter and stg.data_wprowadzenia_rekordu_przeslanie_reklamy > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');

   SELECT @LoopCounter  = min(id_przeslania_reklamy) FROM STAGE_SOURCE_Przeslanie_reklamy
   WHERE id_przeslania_reklamy > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','tmp_SOURCE_Przeslanie_reklamy');
insert into ProjektHurtownia.dbo.META_data_importu values(next value for ProjektHurtownia.dbo.seq_META_data_importu,GETDATE(),'SOURCE')
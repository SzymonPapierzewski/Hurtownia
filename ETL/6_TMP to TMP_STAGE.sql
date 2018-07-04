use ProjektHurtownia

DECLARE @LoopCounter INT , @MaxCounter INT, @Id_w_pliku INT

/*-------------------*/
/*      Klient       */
/*-------------------*/
select * into tmp_STAGE_Klient from tmp_SOURCE_Klient

SELECT @LoopCounter = min(id_klienta) , @MaxCounter = max(id_klienta) 
FROM tmp_FLAT_Klient

WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select Nazwisko from tmp_FLAT_Klient where id_klienta = @LoopCounter) IS NULL OR
		(select Imie from tmp_FLAT_Klient where id_klienta = @LoopCounter) IS NULL OR
		(select pesel from tmp_FLAT_Klient where id_klienta = @LoopCounter) IS NULL OR
		(select mail from tmp_FLAT_Klient where id_klienta = @LoopCounter) IS NULL OR
		(select delete_klient from tmp_FLAT_Klient where id_klienta = @LoopCounter) IS NULL
	)
		insert into ERROR_Klient select * from tmp_FLAT_Klient where id_klienta = @LoopCounter
	ELSE
		insert into tmp_STAGE_Klient select * from tmp_FLAT_Klient where id_klienta = @LoopCounter
		
	SELECT @LoopCounter  = min(id_klienta) FROM tmp_FLAT_Klient
	WHERE id_klienta > @LoopCounter
END

SELECT @LoopCounter = min(id_klienta), @MaxCounter = max(id_klienta)
from tmp_STAGE_Klient

WHILE (@LoopCounter IS NOT NULL and @LoopCounter <= @MaxCounter)
BEGIN
	SELECT @Id_w_pliku = 
		(SELECT id_w_zrodle from META_id_translator where id_w_hurtowni = @LoopCounter and nazwa_zrodla = 'FLAT' and nazwa_tabeli = 'Klient')
	
	insert into H_Klient (id_klienta,Nazwisko,Imie,pesel,mail,data_wprowadzenia_rekordu_klient,delete_klient,HISTORYZACJA_BLEDOW)
	select usuwany.id_klienta,
		   usuwany.Nazwisko,
		   usuwany.Imie,
		   usuwany.pesel,
		   usuwany.mail,
		   GETDATE(),
		   usuwany.delete_klient,
		   'TAK'
	from ERROR_Klient usuwany
	where usuwany.id_klienta = @Id_w_pliku		

	delete from ERROR_Klient where id_klienta = @Id_w_pliku
	
	SELECT @LoopCounter = min(id_klienta) FROM tmp_STAGE_Klient
	WHERE id_klienta > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','tmp_STAGE_Klient');
/*-------------------*/
/*      Film         */
/*-------------------*/
select * into tmp_STAGE_Film from tmp_SOURCE_Film

SELECT @LoopCounter = min(id_filmu) , @MaxCounter = max(id_filmu) 
FROM tmp_FLAT_Film

WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select cena from tmp_FLAT_Film where id_filmu = @LoopCounter) IS NULL OR
		(select Rezyser from tmp_FLAT_Film where id_filmu = @LoopCounter) IS NULL OR
		(select Rok_wydania from tmp_FLAT_Film where id_filmu = @LoopCounter) IS NULL OR
		(select Tytul from tmp_FLAT_Film where id_filmu = @LoopCounter) IS NULL OR
		(select ilosc_egzemplarzy from tmp_FLAT_Film where id_filmu = @LoopCounter) IS NULL OR
		(select Stan from tmp_FLAT_Film where id_filmu = @LoopCounter) IS NULL OR
		(select delete_film from tmp_FLAT_Film where id_filmu = @LoopCounter) IS NULL
	)
		insert into ERROR_Film select * from tmp_FLAT_Film where id_filmu = @LoopCounter
	ELSE
		insert into tmp_STAGE_Film select * from tmp_FLAT_Film where id_filmu = @LoopCounter
		
	SELECT @LoopCounter  = min(id_filmu) FROM tmp_FLAT_Film
	WHERE id_filmu > @LoopCounter
END

SELECT @LoopCounter = min(id_filmu), @MaxCounter = max(id_filmu)
from tmp_STAGE_Film

WHILE (@LoopCounter IS NOT NULL and @LoopCounter <= @MaxCounter)
BEGIN
	SELECT @Id_w_pliku = 
		(SELECT id_w_zrodle from META_id_translator where id_w_hurtowni = @LoopCounter and nazwa_zrodla = 'FLAT' and nazwa_tabeli = 'Film')
	
	insert into H_Film (id_filmu,cena,Rezyser,Rok_wydania,Tytul,ilosc_egzemplarzy,Stan,data_wprowadzenia_rekordu_film,delete_film,HISTORYZACJA_BLEDOW)
	select usuwany.id_filmu,
		   usuwany.cena,
		   usuwany.Rezyser,
		   usuwany.Rok_wydania,
		   usuwany.Tytul,
		   usuwany.ilosc_egzemplarzy,
		   usuwany.Stan,
		   GETDATE(),
		   usuwany.delete_film,
		   'TAK'
	from ERROR_Film usuwany
	where usuwany.id_filmu = @Id_w_pliku		

	delete from ERROR_Film where id_filmu = @Id_w_pliku
	
	SELECT @LoopCounter = min(id_filmu) FROM tmp_STAGE_Film
	WHERE id_filmu > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','tmp_STAGE_Film');
/*-------------------*/
/*    Zamowienie     */
/*-------------------*/
select * into tmp_STAGE_Zamowienie from tmp_SOURCE_Zamowienie

SELECT @LoopCounter = min(id_zamowienia) , @MaxCounter = max(id_zamowienia) 
FROM tmp_FLAT_Zamowienie

WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select id_filmu from tmp_FLAT_Zamowienie where id_zamowienia = @LoopCounter) IS NULL OR
		(select id_klienta from tmp_FLAT_Zamowienie where id_zamowienia = @LoopCounter) IS NULL OR
		(select data_zamowienia from tmp_FLAT_Zamowienie where id_zamowienia = @LoopCounter) IS NULL OR
		(select delete_zamowienie from tmp_FLAT_Zamowienie where id_zamowienia = @LoopCounter) IS NULL
	)
		insert into ERROR_Zamowienie select * from tmp_FLAT_Zamowienie where id_zamowienia = @LoopCounter
	ELSE
		insert into tmp_STAGE_Zamowienie select * from tmp_FLAT_Zamowienie where id_zamowienia = @LoopCounter
		
	SELECT @LoopCounter  = min(id_zamowienia) FROM tmp_FLAT_Zamowienie
	WHERE id_zamowienia > @LoopCounter
END

SELECT @LoopCounter = min(id_zamowienia), @MaxCounter = max(id_zamowienia)
from tmp_STAGE_Zamowienie

WHILE (@LoopCounter IS NOT NULL and @LoopCounter <= @MaxCounter)
BEGIN
	SELECT @Id_w_pliku = 
		(SELECT id_w_zrodle from META_id_translator where id_w_hurtowni = @LoopCounter and nazwa_zrodla = 'FLAT' and nazwa_tabeli = 'Zamowienie')
	
	insert into H_Zamowienie (id_zamowienia,id_klienta,data_zamowienia,data_wprowadzenia_rekordu_zamowienie,delete_zamowienie,HISTORYZACJA_BLEDOW)
	select usuwany.id_zamowienia,
		   usuwany.id_klienta,
		   usuwany.data_zamowienia,
		   GETDATE(),
		   usuwany.delete_zamowienie,
		   'TAK'
	from ERROR_Zamowienie usuwany
	where usuwany.id_zamowienia = @Id_w_pliku		

	delete from ERROR_Zamowienie where id_zamowienia = @Id_w_pliku
	
	SELECT @LoopCounter = min(id_zamowienia) FROM tmp_STAGE_Zamowienie
	WHERE id_zamowienia > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','tmp_STAGE_Zamowienie');
/*-------------------*/
/*       Zgoda       */
/*-------------------*/
select * into tmp_STAGE_Zgoda from tmp_SOURCE_Zgoda

SELECT @LoopCounter = min(id_zamowienia) , @MaxCounter = max(id_zamowienia) 
FROM tmp_FLAT_Zamowienie

WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select delete_zgoda from tmp_FLAT_Zgoda where id_zgody = @LoopCounter) IS NULL
	)
		insert into ERROR_Zgoda select * from tmp_FLAT_Zgoda where id_zgody = @LoopCounter
	ELSE
		insert into tmp_STAGE_Zgoda select * from tmp_FLAT_Zgoda where id_zgody = @LoopCounter
		
	SELECT @LoopCounter  = min(id_zgody) FROM tmp_FLAT_Zgoda
	WHERE id_zgody > @LoopCounter
END

SELECT @LoopCounter = min(id_zgody), @MaxCounter = max(id_zgody)
from tmp_STAGE_Zgoda

WHILE (@LoopCounter IS NOT NULL and @LoopCounter <= @MaxCounter)
BEGIN
	SELECT @Id_w_pliku = 
		(SELECT id_w_zrodle from META_id_translator where id_w_hurtowni = @LoopCounter and nazwa_zrodla = 'FLAT' and nazwa_tabeli = 'Zgoda')
	
	insert into H_Zgoda (id_zgody,data_wprowadzenia_rekordu_zgoda,delete_zgoda,HISTORYZACJA_BLEDOW)
	select usuwany.id_zgody,
		   GETDATE(),
		   usuwany.delete_zgoda,
		   'TAK'
	from ERROR_Zgoda usuwany
	where usuwany.id_zgody = @Id_w_pliku		

	delete from ERROR_Zgoda where id_zgody = @Id_w_pliku
	
	SELECT @LoopCounter = min(id_zgody) FROM tmp_STAGE_Zgoda
	WHERE id_zgody > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','tmp_STAGE_Zgoda');
/*-------------------*/
/*   Zgoda_klienta   */
/*-------------------*/
select * into tmp_STAGE_Zgoda_klienta from tmp_SOURCE_Zgoda_klienta

SELECT @LoopCounter = min(id_zgody_klienta) , @MaxCounter = max(id_zgody_klienta) 
FROM tmp_FLAT_Zgoda_klienta

WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select id_klienta from tmp_FLAT_Zgoda_klienta where id_zgody_klienta = @LoopCounter) IS NULL OR
		(select id_zgody from tmp_FLAT_Zgoda_klienta where id_zgody_klienta = @LoopCounter) IS NULL OR
		(select data_zgody from tmp_FLAT_Zgoda_klienta where id_zgody_klienta = @LoopCounter) IS NULL OR
		(select delete_zgoda_klienta from tmp_FLAT_Zgoda_klienta where id_zgody_klienta = @LoopCounter) IS NULL
	)
		insert into ERROR_Zgoda_klienta select * from tmp_FLAT_Zgoda_klienta where id_zgody_klienta = @LoopCounter
	ELSE
		insert into tmp_STAGE_Zgoda_klienta select * from tmp_FLAT_Zgoda_klienta where id_zgody_klienta = @LoopCounter
		
	SELECT @LoopCounter  = min(id_zgody_klienta) FROM tmp_FLAT_Zgoda_klienta
	WHERE id_zgody_klienta > @LoopCounter
END

SELECT @LoopCounter = min(id_zgody_klienta), @MaxCounter = max(id_zgody_klienta)
from tmp_STAGE_Zgoda_klienta

WHILE (@LoopCounter IS NOT NULL and @LoopCounter <= @MaxCounter)
BEGIN
	SELECT @Id_w_pliku = 
		(SELECT id_w_zrodle from META_id_translator where id_w_hurtowni = @LoopCounter and nazwa_zrodla = 'FLAT' and nazwa_tabeli = 'Zgoda_klienta')
	
	insert into H_Zgoda_klienta (id_zgody_klienta,id_klienta,id_zgody,data_zgody,data_wprowadzenia_rekordu_zgoda_klienta,delete_zgoda_klienta,HISTORYZACJA_BLEDOW)
	select usuwany.id_zgody_klienta,
		   usuwany.id_klienta,
		   usuwany.id_zgody,
		   usuwany.data_zgody,
		   GETDATE(),
		   usuwany.delete_zgoda_klienta,
		   'TAK'
	from ERROR_Zgoda_klienta usuwany
	where usuwany.id_zgody_klienta = @Id_w_pliku		

	delete from ERROR_Zgoda_klienta where id_zgody_klienta = @Id_w_pliku
	
	SELECT @LoopCounter = min(id_zgody_klienta) FROM tmp_STAGE_Zgoda_klienta
	WHERE id_zgody_klienta > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','tmp_STAGE_Zgoda_klienta');
/*-------------------*/
/*    Wypozyczenie   */
/*-------------------*/
select * into tmp_STAGE_Wypozyczenie from tmp_SOURCE_Wypozyczenie

SELECT @LoopCounter = min(id_wypozyczenia) , @MaxCounter = max(id_wypozyczenia) 
FROM tmp_FLAT_Wypozyczenie

WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select id_klienta from tmp_FLAT_Wypozyczenie where id_wypozyczenia = @LoopCounter) IS NULL OR
		(select id_filmu from tmp_FLAT_Wypozyczenie where id_wypozyczenia = @LoopCounter) IS NULL OR
		(select data_wypozyczenia from tmp_FLAT_Wypozyczenie where id_wypozyczenia = @LoopCounter) IS NULL OR
		(select data_oddania from tmp_FLAT_Wypozyczenie where id_wypozyczenia = @LoopCounter) IS NULL OR
		(select termin_oddania from tmp_FLAT_Wypozyczenie where id_wypozyczenia = @LoopCounter) IS NULL OR
		(select delete_wypozyczenie from tmp_FLAT_Wypozyczenie where id_wypozyczenia = @LoopCounter) IS NULL
	)
		insert into ERROR_Wypozyczenie select * from tmp_FLAT_Wypozyczenie where id_wypozyczenia = @LoopCounter
	ELSE
		insert into tmp_STAGE_Wypozyczenie select * from tmp_FLAT_Wypozyczenie where id_wypozyczenia = @LoopCounter
		
	SELECT @LoopCounter  = min(id_wypozyczenia) FROM tmp_FLAT_Wypozyczenie
	WHERE id_wypozyczenia > @LoopCounter
END

SELECT @LoopCounter = min(id_wypozyczenia), @MaxCounter = max(id_wypozyczenia)
from tmp_STAGE_Wypozyczenie

WHILE (@LoopCounter IS NOT NULL and @LoopCounter <= @MaxCounter)
BEGIN
	SELECT @Id_w_pliku = 
		(SELECT id_w_zrodle from META_id_translator where id_w_hurtowni = @LoopCounter and nazwa_zrodla = 'FLAT' and nazwa_tabeli = 'Wypozyczenie')
	
	insert into H_Wypozyczenie (id_wypozyczenia,id_klienta,id_filmu,data_wypozyczenia,data_oddania,termin_oddania,data_wprowadzenia_rekordu_wypozyczenie,delete_wypozyczenie,HISTORYZACJA_BLEDOW)
	select usuwany.id_wypozyczenia,
		   usuwany.id_klienta,
		   usuwany.id_filmu,
		   usuwany.data_wypozyczenia,
		   usuwany.data_oddania,
		   usuwany.termin_oddania,
		   GETDATE(),
		   usuwany.delete_wypozyczenie,
		   'TAK'
	from ERROR_Wypozyczenie usuwany
	where usuwany.id_wypozyczenia = @Id_w_pliku		

	delete from ERROR_Wypozyczenie where id_wypozyczenia = @Id_w_pliku
	
	SELECT @LoopCounter = min(id_wypozyczenia) FROM tmp_STAGE_Wypozyczenie
	WHERE id_wypozyczenia > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','tmp_STAGE_Wypozyczenie');
/*-------------------*/
/*      Dostawa      */
/*-------------------*/
select * into tmp_STAGE_Dostawa from tmp_SOURCE_Dostawa

SELECT @LoopCounter = min(id_dostawy) , @MaxCounter = max(id_dostawy) 
FROM tmp_FLAT_Dostawa

WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select id_filmu from tmp_FLAT_Dostawa where id_dostawy = @LoopCounter) IS NULL OR
		(select ilosc_dostarczonych_egzemplarzy from tmp_FLAT_Dostawa where id_dostawy = @LoopCounter) IS NULL OR
		(select data_dostawy from tmp_FLAT_Dostawa where id_dostawy = @LoopCounter) IS NULL OR
		(select delete_dostawa from tmp_FLAT_Dostawa where id_dostawy = @LoopCounter) IS NULL
	)
		insert into ERROR_Dostawa select * from tmp_FLAT_Dostawa where id_dostawy = @LoopCounter
	ELSE
		insert into tmp_STAGE_Dostawa select * from tmp_FLAT_Dostawa where id_dostawy = @LoopCounter
		
	SELECT @LoopCounter  = min(id_dostawy) FROM tmp_FLAT_Dostawa
	WHERE id_dostawy > @LoopCounter
END

SELECT @LoopCounter = min(id_dostawy), @MaxCounter = max(id_dostawy)
from tmp_STAGE_Dostawa

WHILE (@LoopCounter IS NOT NULL and @LoopCounter <= @MaxCounter)
BEGIN
	SELECT @Id_w_pliku = 
		(SELECT id_w_zrodle from META_id_translator where id_w_hurtowni = @LoopCounter and nazwa_zrodla = 'FLAT' and nazwa_tabeli = 'Dostawa')
	
	insert into H_Dostawa (id_dostawy,id_filmu,ilosc_dostarczonych_egzemplarzy,data_dostawy,data_wprowadzenia_rekordu_dostawa,delete_dostawa,HISTORYZACJA_BLEDOW)
	select usuwany.id_dostawy,
		   usuwany.id_filmu,
		   usuwany.ilosc_dostarczonych_egzemplarzy,
		   usuwany.data_dostawy,
		   GETDATE(),
		   usuwany.delete_dostawa,
		   'TAK'
	from ERROR_Dostawa usuwany
	where usuwany.id_dostawy = @Id_w_pliku		

	delete from ERROR_Dostawa where id_dostawy = @Id_w_pliku
	
	SELECT @LoopCounter = min(id_dostawy) FROM tmp_STAGE_Dostawa
	WHERE id_dostawy > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','tmp_STAGE_Dostawa');
/*-------------------*/
/*      Reklama      */
/*-------------------*/
select * into tmp_STAGE_Reklama from tmp_SOURCE_Reklama

SELECT @LoopCounter = min(id_reklamy) , @MaxCounter = max(id_reklamy) 
FROM tmp_FLAT_Reklama

WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select delete_reklama from tmp_FLAT_Reklama where id_reklamy = @LoopCounter) IS NULL
	)
		insert into ERROR_Reklama select * from tmp_FLAT_Reklama where id_reklamy = @LoopCounter
	ELSE
		insert into tmp_STAGE_Reklama select * from tmp_FLAT_Reklama where id_reklamy = @LoopCounter
		
	SELECT @LoopCounter  = min(id_reklamy) FROM tmp_FLAT_Reklama
	WHERE id_reklamy > @LoopCounter
END

SELECT @LoopCounter = min(id_reklamy), @MaxCounter = max(id_reklamy)
from tmp_STAGE_Reklama

WHILE (@LoopCounter IS NOT NULL and @LoopCounter <= @MaxCounter)
BEGIN
	SELECT @Id_w_pliku = 
		(SELECT id_w_zrodle from META_id_translator where id_w_hurtowni = @LoopCounter and nazwa_zrodla = 'FLAT' and nazwa_tabeli = 'Reklama')
	
	insert into H_Reklama (id_reklamy,data_wprowadzenia_rekordu_reklama,delete_reklama,HISTORYZACJA_BLEDOW)
	select usuwany.id_reklamy,
		   GETDATE(),
		   usuwany.delete_reklama,
		   'TAK'
	from ERROR_Reklama usuwany
	where usuwany.id_reklamy = @Id_w_pliku		

	delete from ERROR_Reklama where id_reklamy = @Id_w_pliku
	
	SELECT @LoopCounter = min(id_reklamy) FROM tmp_STAGE_Reklama
	WHERE id_reklamy > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','tmp_STAGE_Reklama');
/*-------------------*/
/* Przeslanie_reklamy*/
/*-------------------*/
select * into tmp_STAGE_Przeslanie_reklamy from tmp_SOURCE_Przeslanie_reklamy

SELECT @LoopCounter = min(id_przeslania_reklamy) , @MaxCounter = max(id_przeslania_reklamy) 
FROM tmp_FLAT_Przeslanie_reklamy

WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select id_klienta from tmp_FLAT_Przeslanie_reklamy where id_przeslania_reklamy = @LoopCounter) IS NULL OR
		(select id_reklamy from tmp_FLAT_Przeslanie_reklamy where id_przeslania_reklamy = @LoopCounter) IS NULL OR
		(select data_wyslania_reklamy from tmp_FLAT_Przeslanie_reklamy where id_przeslania_reklamy = @LoopCounter) IS NULL OR
		(select delete_przeslanie_reklamy from tmp_FLAT_Przeslanie_reklamy where id_przeslania_reklamy = @LoopCounter) IS NULL
	)
		insert into ERROR_Przeslanie_reklamy select * from tmp_FLAT_Przeslanie_reklamy where id_przeslania_reklamy = @LoopCounter
	ELSE
		insert into tmp_STAGE_Przeslanie_reklamy select * from tmp_FLAT_Przeslanie_reklamy where id_przeslania_reklamy = @LoopCounter
		
	SELECT @LoopCounter  = min(id_przeslania_reklamy) FROM tmp_FLAT_Przeslanie_reklamy
	WHERE id_przeslania_reklamy > @LoopCounter
END

SELECT @LoopCounter = min(id_przeslania_reklamy), @MaxCounter = max(id_przeslania_reklamy)
from tmp_STAGE_Przeslanie_reklamy

WHILE (@LoopCounter IS NOT NULL and @LoopCounter <= @MaxCounter)
BEGIN
	SELECT @Id_w_pliku = 
		(SELECT id_w_zrodle from META_id_translator where id_w_hurtowni = @LoopCounter and nazwa_zrodla = 'FLAT' and nazwa_tabeli = 'Przeslanie_reklamy')
	
	insert into H_Przeslanie_reklamy (id_przeslania_reklamy,id_klienta,id_reklamy,data_wyslania_reklamy,data_wprowadzenia_rekordu_przeslanie_reklamy,delete_przeslanie_reklamy,HISTORYZACJA_BLEDOW)
	select usuwany.id_przeslania_reklamy,
		   usuwany.id_klienta,
		   usuwany.id_reklamy,
		   usuwany.data_wyslania_reklamy,
		   GETDATE(),
		   usuwany.delete_przeslanie_reklamy,
		   'TAK'
	from ERROR_Przeslanie_reklamy usuwany
	where usuwany.id_przeslania_reklamy = @Id_w_pliku		

	delete from ERROR_Przeslanie_reklamy where id_przeslania_reklamy = @Id_w_pliku
	
	SELECT @LoopCounter = min(id_przeslania_reklamy) FROM tmp_STAGE_Przeslanie_reklamy
	WHERE id_przeslania_reklamy > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','tmp_STAGE_Przeslanie_reklamy');
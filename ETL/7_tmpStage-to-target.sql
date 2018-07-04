use ProjektHurtownia

DECLARE @LoopCounter INT , @MaxCounter INT, @Id_w_pliku INT
/*-------------------*/
/*      Klient       */
/*-------------------*/
merge Klient as cel
using tmp_STAGE_Klient as zrodlo
on (cel.id_klienta = zrodlo.id_klienta)
when matched then
update set cel.Nazwisko = zrodlo.Nazwisko,
cel.Imie = zrodlo.Imie,
cel.pesel = zrodlo.pesel,
cel.mail = zrodlo.mail,
cel.delete_klient = zrodlo.delete_klient
when not matched then
insert (id_klienta,Nazwisko,Imie,pesel,mail,delete_klient)
values(zrodlo.id_klienta,zrodlo.Nazwisko,zrodlo.Imie,zrodlo.pesel,zrodlo.mail,zrodlo.delete_klient);

SELECT @LoopCounter = min(id_klienta) , @MaxCounter = max(id_klienta) FROM Klient
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select delete_klient from Klient where id_klienta = @LoopCounter) = 1)
	insert into H_Klient (id_klienta,Nazwisko,Imie,pesel,mail,data_wprowadzenia_rekordu_klient,delete_klient,HISTORYZACJA_BLEDOW)
	select usuwany.id_klienta,
		   usuwany.Nazwisko,
		   usuwany.Imie,
		   usuwany.pesel,
		   usuwany.mail,
		   GETDATE(),
		   usuwany.delete_klient,
		   'NIE'
	from Klient usuwany
	where usuwany.id_klienta = @LoopCounter		
	
	if ((select delete_klient from Klient where id_klienta = @LoopCounter) = 1)
	delete from Klient where id_klienta = @LoopCounter 
	
	SELECT @LoopCounter = min(id_klienta) FROM Klient
	WHERE id_klienta > @LoopCounter
END
	
insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','Klient');
/*-------------------*/
/*      Film         */
/*-------------------*/
merge Film as cel
using tmp_STAGE_Film as zrodlo
on (cel.id_filmu = zrodlo.id_filmu)
when matched then
update set cel.cena = zrodlo.cena,
cel.Rezyser = zrodlo.Rezyser,
cel.Rok_wydania = zrodlo.Rok_wydania,
cel.Tytul = zrodlo.Tytul,
cel.ilosc_egzemplarzy = zrodlo.ilosc_egzemplarzy,
cel.Stan = zrodlo.Stan,
cel.delete_film = zrodlo.delete_film
when not matched then
insert (id_filmu,cena,Rezyser,Rok_wydania,Tytul,ilosc_egzemplarzy,Stan,delete_film)
values(zrodlo.id_filmu,zrodlo.cena,zrodlo.Rezyser,zrodlo.Rok_wydania,zrodlo.Tytul,zrodlo.ilosc_egzemplarzy,zrodlo.Stan,zrodlo.delete_film);

SELECT @LoopCounter = min(id_filmu) , @MaxCounter = max(id_filmu) FROM Film
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select delete_film from Film where id_filmu = @LoopCounter) = 1)
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
		   'NIE'
	from Film usuwany
	where usuwany.id_filmu = @LoopCounter		

	if ((select delete_film from Film where id_filmu = @LoopCounter) = 1)
	delete from Film where id_filmu = @LoopCounter
	
	SELECT @LoopCounter = min(id_filmu) FROM Film
	WHERE id_filmu > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','Film');
/*-------------------*/
/*    Zamowienie     */
/*-------------------*/
merge Zamowienie as cel
using tmp_STAGE_Zamowienie as zrodlo
on (cel.id_zamowienia = zrodlo.id_zamowienia)
when matched then
update set cel.id_filmu = zrodlo.id_filmu,
cel.id_klienta = zrodlo.id_klienta,
cel.data_zamowienia = zrodlo.data_zamowienia,
cel.delete_zamowienie = zrodlo.delete_zamowienie
when not matched then
insert (id_zamowienia,id_filmu,id_klienta,data_zamowienia,delete_zamowienie)
values(zrodlo.id_zamowienia,zrodlo.id_filmu,zrodlo.id_klienta,zrodlo.data_zamowienia,zrodlo.delete_zamowienie);

SELECT @LoopCounter = min(id_zamowienia) , @MaxCounter = max(id_zamowienia) FROM Zamowienie
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select delete_zamowienie from Zamowienie where id_zamowienia = @LoopCounter) = 1)
	insert into H_Zamowienie (id_zamowienia,id_klienta,data_zamowienia,data_wprowadzenia_rekordu_zamowienie,delete_zamowienie,HISTORYZACJA_BLEDOW)
	select usuwany.id_zamowienia,
		   usuwany.id_klienta,
		   usuwany.data_zamowienia,
		   GETDATE(),
		   usuwany.delete_zamowienie,
		   'NIE'
	from Zamowienie usuwany
	where usuwany.id_zamowienia = @LoopCounter		
	
	if ((select delete_Zamowienie from Zamowienie where id_zamowienia = @LoopCounter) = 1)
	delete from Zamowienie where id_zamowienia = @LoopCounter
	
	SELECT @LoopCounter = min(id_zamowienia) FROM Zamowienie
	WHERE id_zamowienia > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','Zamowienie');
/*-------------------*/
/*       Zgoda       */
/*-------------------*/
merge Zgoda as cel
using tmp_STAGE_Zgoda as zrodlo
on (cel.id_zgody = zrodlo.id_zgody)
when matched then
update set cel.delete_zgoda = zrodlo.delete_zgoda
when not matched then
insert (id_zgody,delete_zgoda)
values(zrodlo.id_zgody,zrodlo.delete_zgoda);

SELECT @LoopCounter = min(id_zgody) , @MaxCounter = max(id_zgody) FROM Zgoda
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select delete_zgoda from Zgoda where id_zgody = @LoopCounter) = 1)
	insert into H_Zgoda (id_zgody,data_wprowadzenia_rekordu_zgoda,delete_zgoda,HISTORYZACJA_BLEDOW)
	select usuwany.id_zgody,
		   GETDATE(),
		   usuwany.delete_zgoda,
		   'NIE'
	from Zgoda usuwany
	where usuwany.id_zgody = @LoopCounter		
	
	if ((select delete_zgoda from Zgoda where id_zgody = @LoopCounter) = 1)
	delete from Zgoda where id_zgody = @LoopCounter
	
	SELECT @LoopCounter = min(id_zgody) FROM Zgoda
	WHERE id_zgody > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','Zgoda');
/*-------------------*/
/*   Zgoda_klienta   */
/*-------------------*/
merge Zgoda_klienta as cel
using tmp_STAGE_Zgoda_klienta as zrodlo
on (cel.id_zgody_klienta = zrodlo.id_zgody_klienta)
when matched then
update set cel.id_klienta = zrodlo.id_klienta,
cel.id_zgody = zrodlo.id_zgody,
cel.data_zgody = zrodlo.data_zgody,
cel.delete_zgoda_klienta = zrodlo.delete_zgoda_klienta
when not matched then
insert (id_zgody_klienta,id_klienta,id_zgody,data_zgody,delete_zgoda_klienta)
values(zrodlo.id_zgody_klienta,zrodlo.id_klienta,zrodlo.id_zgody,zrodlo.data_zgody,zrodlo.delete_zgoda_klienta);

SELECT @LoopCounter = min(id_zgody_klienta) , @MaxCounter = max(id_zgody_klienta) FROM Zgoda_klienta
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select delete_zgoda_klienta from Zgoda_klienta where id_zgody_klienta = @LoopCounter) = 1)
	insert into H_Zgoda_klienta (id_zgody_klienta,id_klienta,id_zgody,data_zgody,data_wprowadzenia_rekordu_zgoda_klienta,delete_zgoda_klienta,HISTORYZACJA_BLEDOW)
	select usuwany.id_zgody_klienta,
		   usuwany.id_klienta,
		   usuwany.id_zgody,
		   usuwany.data_zgody,
		   GETDATE(),
		   usuwany.delete_zgoda_klienta,
		   'NIE'
	from Zgoda_klienta usuwany
	where usuwany.id_zgody_klienta = @LoopCounter		

	if ((select delete_zgoda_klienta from Zgoda_klienta where id_zgody_klienta = @LoopCounter) = 1)
	delete from Zgoda_klienta where id_zgody_klienta = @LoopCounter
	
	SELECT @LoopCounter = min(id_zgody_klienta) FROM Zgoda_klienta
	WHERE id_zgody_klienta > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','Zgoda_klienta');
/*-------------------*/
/*    Wypozyczenie   */
/*-------------------*/
merge Wypozyczenie as cel
using tmp_STAGE_Wypozyczenie as zrodlo
on (cel.id_wypozyczenia = zrodlo.id_wypozyczenia)
when matched then
update set cel.id_klienta = zrodlo.id_klienta,
cel.id_filmu = zrodlo.id_filmu,
cel.data_wypozyczenia = zrodlo.data_wypozyczenia,
cel.data_oddania = zrodlo.data_oddania,
cel.termin_oddania = zrodlo.termin_oddania,
cel.delete_wypozyczenie = zrodlo.delete_wypozyczenie
when not matched then
insert (id_wypozyczenia,id_klienta,id_filmu,data_wypozyczenia,data_oddania,termin_oddania,delete_wypozyczenie)
values(zrodlo.id_wypozyczenia,zrodlo.id_klienta,zrodlo.id_filmu,zrodlo.data_wypozyczenia,zrodlo.data_oddania,zrodlo.termin_oddania,zrodlo.delete_wypozyczenie);

SELECT @LoopCounter = min(id_wypozyczenia) , @MaxCounter = max(id_wypozyczenia) FROM Wypozyczenie
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select delete_wypozyczenie from Wypozyczenie where id_wypozyczenia = @LoopCounter) = 1)
	insert into H_Wypozyczenie (id_wypozyczenia,id_klienta,id_filmu,data_wypozyczenia,data_oddania,termin_oddania,data_wprowadzenia_rekordu_wypozyczenie,delete_wypozyczenie,HISTORYZACJA_BLEDOW)
	select usuwany.id_wypozyczenia,
		   usuwany.id_klienta,
		   usuwany.id_filmu,
		   usuwany.data_wypozyczenia,
		   usuwany.data_oddania,
		   usuwany.termin_oddania,
		   GETDATE(),
		   usuwany.delete_wypozyczenie,
		   'NIE'
	from Wypozyczenie usuwany
	where usuwany.id_wypozyczenia = @LoopCounter		

	if ((select delete_wypozyczenie from Wypozyczenie where id_wypozyczenia = @LoopCounter) = 1)
	delete from Wypozyczenie where id_wypozyczenia = @LoopCounter
	
	SELECT @LoopCounter = min(id_wypozyczenia) FROM Wypozyczenie
	WHERE id_wypozyczenia > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','Wypozyczenie');
/*-------------------*/
/*      Dostawa      */
/*-------------------*/
merge Dostawa as cel
using tmp_STAGE_Dostawa as zrodlo
on (cel.id_dostawy = zrodlo.id_dostawy)
when matched then
update set cel.id_filmu = zrodlo.id_filmu,
cel.ilosc_dostarczonych_egzemplarzy = zrodlo.ilosc_dostarczonych_egzemplarzy,
cel.data_dostawy = zrodlo.data_dostawy,
cel.delete_dostawa = zrodlo.delete_dostawa
when not matched then
insert (id_dostawy,id_filmu,ilosc_dostarczonych_egzemplarzy,data_dostawy,delete_dostawa)
values(zrodlo.id_dostawy,zrodlo.id_filmu,zrodlo.ilosc_dostarczonych_egzemplarzy,zrodlo.data_dostawy,zrodlo.delete_dostawa);

SELECT @LoopCounter = min(id_dostawy) , @MaxCounter = max(id_dostawy) FROM Dostawa
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select delete_dostawa from Dostawa where id_dostawy = @LoopCounter) = 1)
	insert into H_Dostawa (id_dostawy,id_filmu,ilosc_dostarczonych_egzemplarzy,data_dostawy,data_wprowadzenia_rekordu_dostawa,delete_dostawa,HISTORYZACJA_BLEDOW)
	select usuwany.id_dostawy,
		   usuwany.id_filmu,
		   usuwany.ilosc_dostarczonych_egzemplarzy,
		   usuwany.data_dostawy,
		   GETDATE(),
		   usuwany.delete_dostawa,
		   'NIE'
	from Dostawa usuwany
	where usuwany.id_dostawy = @LoopCounter		

	if ((select delete_dostawa from Dostawa where id_dostawy = @LoopCounter) = 1)
	delete from Dostawa where id_dostawy = @LoopCounter
	
	SELECT @LoopCounter = min(id_dostawy) FROM Dostawa
	WHERE id_dostawy > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','Dostawa');
/*-------------------*/
/*      Reklama      */
/*-------------------*/
merge Reklama as cel
using tmp_STAGE_Reklama as zrodlo
on (cel.id_reklamy = zrodlo.id_reklamy)
when matched then
update set cel.delete_reklama = zrodlo.delete_reklama
when not matched then
insert (id_reklamy,delete_reklama)
values(zrodlo.id_reklamy,zrodlo.delete_reklama);

SELECT @LoopCounter = min(id_reklamy) , @MaxCounter = max(id_reklamy) FROM Reklama
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select delete_reklama from Reklama where id_reklamy = @LoopCounter) = 1)
	insert into H_Reklama (id_reklamy,data_wprowadzenia_rekordu_reklama,delete_reklama,HISTORYZACJA_BLEDOW)
	select usuwany.id_reklamy,
		   GETDATE(),
		   usuwany.delete_reklama,
		   'NIE'
	from Reklama usuwany
	where usuwany.id_reklamy = @LoopCounter		

	if ((select delete_reklama from Reklama where id_reklamy = @LoopCounter) = 1) 
	delete from Reklama where id_reklamy = @LoopCounter
	
	SELECT @LoopCounter = min(id_reklamy) FROM Reklama
	WHERE id_reklamy > @LoopCounter
END

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','Reklama');
/*-------------------*/
/* Przeslanie_reklamy*/
/*-------------------*/
merge Przeslanie_reklamy as cel
using tmp_STAGE_Przeslanie_reklamy as zrodlo
on (cel.id_przeslania_reklamy = zrodlo.id_przeslania_reklamy)
when matched then
update set cel.id_reklamy = zrodlo.id_reklamy,
cel.id_klienta = zrodlo.id_klienta,
cel.data_wyslania_reklamy = zrodlo.data_wyslania_reklamy,
cel.delete_przeslanie_reklamy = zrodlo.delete_przeslanie_reklamy
when not matched then
insert (id_przeslania_reklamy,id_reklamy,id_klienta,data_wyslania_reklamy,delete_przeslanie_reklamy)
values(zrodlo.id_przeslania_reklamy,zrodlo.id_reklamy,zrodlo.id_klienta,zrodlo.data_wyslania_reklamy,zrodlo.delete_przeslanie_reklamy);

SELECT @LoopCounter = min(id_przeslania_reklamy) , @MaxCounter = max(id_przeslania_reklamy) FROM Przeslanie_reklamy
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
BEGIN
	if ((select delete_przeslanie_reklamy from Przeslanie_reklamy where id_przeslania_reklamy = @LoopCounter) = 1)
	insert into H_Przeslanie_reklamy (id_przeslania_reklamy,id_klienta,id_reklamy,data_wyslania_reklamy,data_wprowadzenia_rekordu_przeslanie_reklamy,delete_przeslanie_reklamy,HISTORYZACJA_BLEDOW)
	select usuwany.id_przeslania_reklamy,
		   usuwany.id_klienta,
		   usuwany.id_reklamy,
		   usuwany.data_wyslania_reklamy,
		   GETDATE(),
		   usuwany.delete_przeslanie_reklamy,
		   'NIE'
	from Przeslanie_reklamy usuwany
	where usuwany.id_przeslania_reklamy = @LoopCounter		

	if ((select delete_przeslanie_reklamy from Przeslanie_reklamy where id_przeslania_reklamy = @LoopCounter) = 1)
	delete from Przeslanie_reklamy where id_przeslania_reklamy = @LoopCounter
	
	SELECT @LoopCounter = min(id_przeslania_reklamy) FROM Przeslanie_reklamy
	WHERE id_przeslania_reklamy > @LoopCounter
end;

insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT&SOURCE','Przeslanie_reklamy');

drop table dbo.tmp_FLAT_Dostawa;
drop table dbo.tmp_FLAT_Film;
drop table dbo.tmp_FLAT_Klient;
drop table dbo.tmp_FLAT_Przeslanie_reklamy;
drop table dbo.tmp_FLAT_Reklama;
drop table dbo.tmp_FLAT_Wypozyczenie;
drop table dbo.tmp_FLAT_Zamowienie;
drop table dbo.tmp_FLAT_Zgoda;
drop table dbo.tmp_FLAT_Zgoda_klienta;

drop table dbo.tmp_SOURCE_Dostawa;
drop table dbo.tmp_SOURCE_Film;
drop table dbo.tmp_SOURCE_Klient;
drop table dbo.tmp_SOURCE_Przeslanie_reklamy;
drop table dbo.tmp_SOURCE_Reklama;
drop table dbo.tmp_SOURCE_Wypozyczenie;
drop table dbo.tmp_SOURCE_Zamowienie;
drop table dbo.tmp_SOURCE_Zgoda;
drop table dbo.tmp_SOURCE_Zgoda_klienta;

drop table dbo.tmp_STAGE_Dostawa
drop table dbo.tmp_STAGE_Film
drop table dbo.tmp_STAGE_Klient
drop table dbo.tmp_STAGE_Przeslanie_reklamy
drop table dbo.tmp_STAGE_Reklama
drop table dbo.tmp_STAGE_Wypozyczenie
drop table dbo.tmp_STAGE_Zamowienie
drop table dbo.tmp_STAGE_Zgoda
drop table dbo.tmp_STAGE_Zgoda_klienta
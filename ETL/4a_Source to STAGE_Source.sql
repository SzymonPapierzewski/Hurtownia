use ProjektHurtownia

	insert into dbo.STAGE_SOURCE_Dostawa
	select *
	from Source.dbo.Dostawa
	WHERE Source.dbo.Dostawa.data_wprowadzenia_rekordu_dostawa > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');
	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','STAGE_SOURCE_Dostawa');


	insert into dbo.STAGE_SOURCE_Film
	select *
	from Source.dbo.Film
	WHERE Source.dbo.Film.data_wprowadzenia_rekordu_film > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');
	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','STAGE_SOURCE_Film');

	insert into dbo.STAGE_SOURCE_Klient
	select *
	from Source.dbo.Klient
	WHERE Source.dbo.Klient.data_wprowadzenia_rekordu_klient > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');
	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','STAGE_SOURCE_Klient');

	insert into dbo.STAGE_SOURCE_Przeslanie_reklamy
	select *
	from Source.dbo.Przeslanie_reklamy
	WHERE Source.dbo.Przeslanie_reklamy.data_wprowadzenia_rekordu_przeslanie_reklamy > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');
	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','STAGE_SOURCE_Przeslanie_reklamy');

	insert into dbo.STAGE_SOURCE_Reklama
	select *
	from Source.dbo.Reklama
	WHERE Source.dbo.Reklama.data_wprowadzenia_rekordu_reklama > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');
	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','STAGE_SOURCE_Reklama');

	insert into dbo.STAGE_SOURCE_Wypozyczenie
	select *
	from Source.dbo.Wypozyczenie
	WHERE Source.dbo.Wypozyczenie.data_wprowadzenia_rekordu_wypozyczenie > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');
	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','STAGE_SOURCE_Wypozyczenie');

	insert into dbo.STAGE_SOURCE_Zamowienie
	select *
	from Source.dbo.Zamowienie
	WHERE Source.dbo.Zamowienie.data_wprowadzenia_rekordu_zamowienie > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');
	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','STAGE_SOURCE_Zamowienie');

	insert into dbo.STAGE_SOURCE_Zgoda
	select *
	from Source.dbo.Zgoda
	WHERE Source.dbo.Zgoda.data_wprowadzenia_rekordu_zgoda > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');
	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','STAGE_SOURCE_Zgoda');

	insert into dbo.STAGE_SOURCE_Zgoda_klienta
	select *
	from Source.dbo.Zgoda_klienta
	WHERE Source.dbo.Zgoda_klienta.data_wprowadzenia_rekordu_zgoda_klienta > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'SOURCE');
	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'SOURCE','STAGE_SOURCE_Zgoda_klienta');
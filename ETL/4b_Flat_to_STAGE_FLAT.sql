use ProjektHurtownia

/*-------------------*/
/*      Klient       */
/*-------------------*/
select * into tmp from dbo.STAGE_FLAT_Klient where 1 = 2;
BULK INSERT tmp
    FROM 'C:\Users\Szymon Papierzewski\Desktop\Oddajemy\Hurtownia\pliki\Klient.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

	insert into dbo.STAGE_FLAT_Klient
	select *
	from tmp
	WHERE tmp.data_wprowadzenia_rekordu_klient > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'FLAT');
	drop table tmp;
	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT','STAGE_FLAT_Klient');

/*-------------------*/
/*      Film         */
/*-------------------*/
select * into tmp from dbo.STAGE_FLAT_Film where 1 = 2;
BULK INSERT tmp
    FROM 'C:\Users\Szymon Papierzewski\Desktop\Oddajemy\Hurtownia\pliki\Film.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

	insert into dbo.STAGE_FLAT_Film
	select *
	from tmp
	WHERE tmp.data_wprowadzenia_rekordu_film > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'FLAT');
																	drop table tmp;

	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT','STAGE_FLAT_Film');

/*-------------------*/
/*    Zamowienie     */
/*-------------------*/
select * into tmp from dbo.STAGE_FLAT_Zamowienie where 1 = 2;
BULK INSERT dbo.STAGE_FLAT_Zamowienie
    FROM 'C:\Users\Szymon Papierzewski\Desktop\Oddajemy\Hurtownia\pliki\Zamowienie.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

	insert into dbo.STAGE_FLAT_Zamowienie
	select *
	from tmp
	WHERE tmp.data_wprowadzenia_rekordu_zamowienie > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'FLAT');
																	drop table tmp;

	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT','STAGE_FLAT_Zamowienie');

/*-------------------*/
/*       Zgoda       */
/*-------------------*/
select * into tmp from dbo.STAGE_FLAT_Zgoda where 1 = 2;
BULK INSERT dbo.STAGE_FLAT_Zgoda
    FROM 'C:\Users\Szymon Papierzewski\Desktop\Oddajemy\Hurtownia\pliki\Zgoda.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

	insert into dbo.STAGE_FLAT_Zgoda
	select *
	from tmp
	WHERE tmp.data_wprowadzenia_rekordu_zgoda > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'FLAT');
																	drop table tmp;

	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT','STAGE_FLAT_Zgoda');

/*-------------------*/
/*   Zgoda_klienta   */
/*-------------------*/
select * into tmp from dbo.STAGE_FLAT_Zgoda_klienta where 1 = 2;
BULK INSERT dbo.STAGE_FLAT_Zgoda_klienta
    FROM 'C:\Users\Szymon Papierzewski\Desktop\Oddajemy\Hurtownia\pliki\Zgoda_klienta.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

	insert into dbo.STAGE_FLAT_Zgoda_klienta
	select *
	from tmp
	WHERE tmp.data_wprowadzenia_rekordu_zgoda_klienta > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'FLAT');
																	drop table tmp;

	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT','STAGE_FLAT_Zgoda_klienta');

/*-------------------*/
/*    Wypozyczenie   */
/*-------------------*/
select * into tmp from dbo.STAGE_FLAT_Wypozyczenie where 1 = 2;
BULK INSERT dbo.STAGE_FLAT_Wypozyczenie
    FROM 'C:\Users\Szymon Papierzewski\Desktop\Oddajemy\Hurtownia\pliki\Wypozyczenie.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

	insert into dbo.STAGE_FLAT_Wypozyczenie
	select *
	from tmp
	WHERE tmp.data_wprowadzenia_rekordu_wypozyczenie > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'FLAT');
																	drop table tmp;

	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT','STAGE_FLAT_Wypozyczenie');
/*-------------------*/
/*      Dostawa      */
/*-------------------*/
select * into tmp from dbo.STAGE_FLAT_Dostawa where 1 = 2;
BULK INSERT dbo.STAGE_FLAT_Dostawa
    FROM 'C:\Users\Szymon Papierzewski\Desktop\Oddajemy\Hurtownia\pliki\Dostawa.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

	insert into dbo.STAGE_FLAT_Dostawa
	select *
	from tmp
	WHERE tmp.data_wprowadzenia_rekordu_dostawa > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'FLAT');
																	drop table tmp;

	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT','STAGE_FLAT_Dostawa');

/*-------------------*/
/*      Reklama      */
/*-------------------*/
select * into tmp from dbo.STAGE_FLAT_Reklama where 1 = 2;
BULK INSERT dbo.STAGE_FLAT_Reklama
    FROM 'C:\Users\Szymon Papierzewski\Desktop\Oddajemy\Hurtownia\pliki\Reklama.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

	insert into dbo.STAGE_FLAT_Reklama
	select *
	from tmp
	WHERE tmp.data_wprowadzenia_rekordu_reklama > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'FLAT');
																	drop table tmp;

	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT','STAGE_FLAT_Reklama');

/*-------------------*/
/* Przeslanie_reklamy*/
/*-------------------*/
select * into tmp from dbo.STAGE_FLAT_Przeslanie_reklamy where 1 = 2;
BULK INSERT dbo.STAGE_FLAT_Przeslanie_reklamy
    FROM 'C:\Users\Szymon Papierzewski\Desktop\Oddajemy\Hurtownia\pliki\Przeslanie_reklamy.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

	insert into dbo.STAGE_FLAT_Przeslanie_reklamy
	select *
	from tmp
	WHERE tmp.data_wprowadzenia_rekordu_przeslanie_reklamy > (
																	SELECT MAX(data_importu) 
																	from dbo.META_data_importu 
																	where dbo.META_data_importu.zrodlo_importu = 'FLAT');
																	drop table tmp;


	insert into META_load_log values(next value for seq_META_load_log, GETDATE(),'FLAT','STAGE_FLAT_Przeslanie_reklamy');
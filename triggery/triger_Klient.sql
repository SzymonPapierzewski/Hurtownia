SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.tr_Klient_update
   ON  dbo.Klient
   AFTER update
AS 
BEGIN
	SET NOCOUNT ON;
	
	declare @LoopCounter int, @MaxCounter int
	select @LoopCounter = min(d.id_klienta),@MaxCounter = max(d.id_klienta) from deleted d

	WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
	begin
		insert into H_Klient(id_klienta,Nazwisko,Imie,pesel,mail,data_wprowadzenia_rekordu_klient,delete_klient,HISTORYZACJA_BLEDOW)
		select distinct
			d.id_klienta,
			d.Nazwisko,
			d.Imie,
			d.pesel,
			d.mail,
			GETDATE(),
			d.delete_klient,
			'NIE'
		from deleted d
		where d.id_klienta = @LoopCounter


	select @LoopCounter = min(d.id_klienta) from deleted d 
	where d.id_klienta > @LoopCounter
	end;

END
GO

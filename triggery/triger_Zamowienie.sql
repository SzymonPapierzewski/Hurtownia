SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.tr_Zamowienie_update
   ON  dbo.Zamowienie
   AFTER update
AS 
BEGIN
	SET NOCOUNT ON;
	
	declare @LoopCounter int, @MaxCounter int
	select @LoopCounter = min(d.id_zamowienia),@MaxCounter = max(d.id_zamowienia) from deleted d

	WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
	begin
		insert into H_Zamowienie(id_zamowienia,id_filmu,id_klienta,data_zamowienia,data_wprowadzenia_rekordu_zamowienie,delete_zamowienie,HISTORYZACJA_BLEDOW)
		select distinct
			d.id_zamowienia,
			d.id_filmu,
			d.id_klienta,
			d.data_zamowienia,
			GETDATE(),
			d.delete_zamowienie,
			'NIE'
		from deleted d
		where d.id_zamowienia = @LoopCounter


	select @LoopCounter = min(d.id_zamowienia) from deleted d 
	where d.id_zamowienia > @LoopCounter
	end;

END
GO

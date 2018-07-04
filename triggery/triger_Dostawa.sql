SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.tr_Dostawa_update
   ON  dbo.Dostawa
   AFTER update
AS 
BEGIN
	SET NOCOUNT ON;
	
	declare @LoopCounter int, @MaxCounter int
	select @LoopCounter = min(d.id_dostawy),@MaxCounter = max(d.id_dostawy) from deleted d

	WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
	begin
		insert into H_Dostawa(id_dostawy,id_filmu,ilosc_dostarczonych_egzemplarzy,data_dostawy,data_wprowadzenia_rekordu_dostawa,delete_dostawa,HISTORYZACJA_BLEDOW)
		select distinct
			d.id_dostawy,
			d.id_filmu,
			d.ilosc_dostarczonych_egzemplarzy,
			d.data_dostawy,
			GETDATE(),
			d.delete_dostawa,
			'NIE'
		from deleted d
		where d.id_dostawy = @LoopCounter


	select @LoopCounter = min(d.id_dostawy) from deleted d 
	where d.id_dostawy > @LoopCounter
	end;

END
GO

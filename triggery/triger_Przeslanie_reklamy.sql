SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.tr_Przeslanie_reklamy_update
   ON  dbo.Przeslanie_reklamy
   AFTER update
AS 
BEGIN
	SET NOCOUNT ON;
	
	declare @LoopCounter int, @MaxCounter int
	select @LoopCounter = min(d.id_przeslania_reklamy),@MaxCounter = max(d.id_przeslania_reklamy) from deleted d

	WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
	begin
		insert into H_Przeslanie_reklamy(id_przeslania_reklamy,id_klienta,id_reklamy,data_wyslania_reklamy,data_wprowadzenia_rekordu_przeslanie_reklamy,delete_przeslanie_reklamy,HISTORYZACJA_BLEDOW)
		select distinct
			d.id_przeslania_reklamy,
			d.id_klienta,
			d.id_reklamy,
			d.data_wyslania_reklamy,
			GETDATE(),
			d.delete_przeslanie_reklamy,
			'NIE'
		from deleted d
		where d.id_przeslania_reklamy = @LoopCounter


	select @LoopCounter = min(d.id_przeslania_reklamy) from deleted d 
	where d.id_przeslania_reklamy > @LoopCounter
	end;

END
GO

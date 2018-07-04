SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.tr_Wypozyczenie_update
   ON  dbo.Wypozyczenie
   AFTER update
AS 
BEGIN
	SET NOCOUNT ON;
	
	declare @LoopCounter int, @MaxCounter int
	select @LoopCounter = min(d.id_wypozyczenia),@MaxCounter = max(d.id_wypozyczenia) from deleted d

	WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
	begin
		insert into H_Wypozyczenie(id_wypozyczenia,id_klienta,id_filmu,data_wypozyczenia,data_oddania,data_wprowadzenia_rekordu_wypozyczenie,delete_wypozyczenie,HISTORYZACJA_BLEDOW)
		select distinct
			d.id_wypozyczenia,
			d.id_klienta,
			d.id_filmu,
			d.data_wypozyczenia,
			d.data_oddania,
			GETDATE(),
			d.delete_wypozyczenie,
			'NIE'
		from deleted d
		where d.id_wypozyczenia = @LoopCounter


	select @LoopCounter = min(d.id_wypozyczenia) from deleted d 
	where d.id_wypozyczenia > @LoopCounter
	end;

END
GO

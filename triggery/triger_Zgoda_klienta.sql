SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.tr_Zgoda_klienta_update
   ON  dbo.Zgoda_klienta
   AFTER update
AS 
BEGIN
	SET NOCOUNT ON;
	
	declare @LoopCounter int, @MaxCounter int
	select @LoopCounter = min(d.id_zgody_klienta),@MaxCounter = max(d.id_zgody_klienta) from deleted d

	WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
	begin
		insert into H_Zgoda_klienta(id_zgody_klienta,id_klienta,id_zgody,data_zgody,data_wprowadzenia_rekordu_zgoda_klienta,delete_zgoda_klienta,HISTORYZACJA_BLEDOW)
		select distinct
			d.id_zgody_klienta,
			d.id_klienta,
			d.id_zgody,
			d.data_zgody,
			GETDATE(),
			d.delete_zgoda_klienta,
			'NIE'
		from deleted d
		where d.id_zgody_klienta = @LoopCounter


	select @LoopCounter = min(d.id_zgody_klienta) from deleted d 
	where d.id_zgody_klienta > @LoopCounter
	end;

END
GO

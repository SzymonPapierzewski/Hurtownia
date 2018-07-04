SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.tr_Zgoda_update
   ON  dbo.Zgoda
   AFTER update
AS 
BEGIN
	SET NOCOUNT ON;
	
	declare @LoopCounter int, @MaxCounter int
	select @LoopCounter = min(d.id_zgody),@MaxCounter = max(d.id_zgody) from deleted d

	WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
	begin
		insert into H_Zgoda(id_zgody,data_wprowadzenia_rekordu_zgoda,delete_zgoda,HISTORYZACJA_BLEDOW)
		select distinct
			d.id_zgody,
			GETDATE(),
			d.delete_zgoda,
			'NIE'
		from deleted d
		where d.id_zgody = @LoopCounter


	select @LoopCounter = min(d.id_zgody) from deleted d 
	where d.id_zgody > @LoopCounter
	end;

END
GO

-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.tr_Reklama_update
   ON  dbo.Reklama
   AFTER update
AS 
BEGIN
	SET NOCOUNT ON;
	
	declare @LoopCounter int, @MaxCounter int
	select @LoopCounter = min(d.id_reklamy),@MaxCounter = max(d.id_reklamy) from deleted d

	WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
	begin
		insert into H_Reklama(id_reklamy,data_wprowadzenia_rekordu_reklama,delete_reklama,HISTORYZACJA_BLEDOW)
		select distinct
			d.id_reklamy,
			GETDATE(),
			d.delete_reklama,
			'NIE'
		from deleted d
		where d.id_reklamy = @LoopCounter


	select @LoopCounter = min(d.id_reklamy) from deleted d 
	where d.id_reklamy > @LoopCounter
	end;

END
GO

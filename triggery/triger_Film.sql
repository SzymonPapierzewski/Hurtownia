SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.tr_Film_update
   ON  dbo.Film
   AFTER update
AS 
BEGIN
	SET NOCOUNT ON;
	
	declare @LoopCounter int, @MaxCounter int
	select @LoopCounter = min(d.id_filmu),@MaxCounter = max(d.id_filmu) from deleted d

	WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxCounter)
	begin
		insert into H_Film(id_filmu,cena,Rezyser,Rok_wydania,Tytul,ilosc_egzemplarzy,Stan,data_wprowadzenia_rekordu_film,delete_film,HISTORYZACJA_BLEDOW)
		select distinct
			d.id_filmu,
			d.cena,
			d.Rezyser,
			d.Rok_wydania,
			d.Tytul,
			d.ilosc_egzemplarzy,
			d.Stan,
			GETDATE(),
			d.delete_film,
			'NIE'
		from deleted d
		where d.id_filmu = @LoopCounter

	select @LoopCounter = min(d.id_filmu) from deleted d 
	where d.id_filmu > @LoopCounter
	end;

END
GO

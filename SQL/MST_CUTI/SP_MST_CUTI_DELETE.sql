	create procedure [dbo].[SP_MST_CUTI_DELETE]
	(
		@p_ID		int
	) 
	as
	begin
		delete	MST_CUTI
		where	ID	= @p_ID
	end

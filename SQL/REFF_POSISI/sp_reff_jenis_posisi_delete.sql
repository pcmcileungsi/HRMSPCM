create procedure [dbo].[sp_reff_jenis_posisi_delete]
	(
		@p_id		TINYINT
	) 
	as
	begin
		delete	reff_posisi
		where	id	= @p_id
	end

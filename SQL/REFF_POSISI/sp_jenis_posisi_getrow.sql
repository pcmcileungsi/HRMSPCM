create procedure [dbo].[sp_reff_jenis_posisi_getrow]
	(
	  @p_id		tinyint
	) 
	as
	begin
		select	*
		from	reff_posisi
		where	id	= @p_id
	end
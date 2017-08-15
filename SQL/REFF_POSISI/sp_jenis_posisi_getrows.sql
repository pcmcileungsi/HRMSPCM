create procedure [dbo].[sp_reff_jenis_posisi_getrows]
	(
	  @p_keywords	nvarchar(50)
	) 
	as
	begin
		select	*
		from	reff_posisi
		where	deskripsi	LIKE '%' + @p_keywords + '%'
		ORDER BY deskripsi
	end
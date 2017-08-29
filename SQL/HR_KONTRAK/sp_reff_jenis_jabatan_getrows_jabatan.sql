GO

/****** Object:  StoredProcedure [dbo].[sp_reff_jenis_jabatan_getrows_jabatan]    Script Date: 08/18/2017 20:52:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

alter procedure [dbo].[sp_reff_jenis_jabatan_getrows_jabatan]
	(
	  @p_keywords	nvarchar(50)
	) 
	as
	begin
		select	 b.Kode,
		         a.DESKRIPSI
		from	reff_jenis_jabatan a
		inner join mst_jabatan b on a.kode = b.kode_jabatan 
		where	a.deskripsi	LIKE '%' + @p_keywords + '%'
		ORDER BY a.deskripsi
	end
GO


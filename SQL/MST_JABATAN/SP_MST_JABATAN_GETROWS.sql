USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_JABATAN_GETROWS]    Script Date: 08/08/2017 21:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_MST_JABATAN_GETROWS]
	(
	  @p_keywords	nvarchar(5)
	) 
	as
	begin
		select	a.ID,
				a.KODE,
				b.DESKRIPSI	as JABATAN									
		from	MST_JABATAN a
		inner join REFF_JENIS_jabatan b on a.kode_jabatan = b.kode
		inner join MST_unit_kerja c on a.kode_unit_kerja = c.kode
		where	c.KODE	= @p_keywords 			
		ORDER BY a.ID
	end
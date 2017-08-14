USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_GAPOK_GETROWS]    Script Date: 08/08/2017 21:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_MST_GAPOK_GETROWS]
	(
	  @p_keywords	nvarchar(5),
	  @p_tahun	nvarchar(4)
	) 
	as
	begin
		select	a.ID,
				a.KODE,
				a.NOMINAL,
				b.DESKRIPSI as DESKRIPSI_PENDIDIKAN,
				c.DESKRIPSI as DESKRIPSI_GOLONGAN							
		from	MST_GAPOK a
		inner join REFF_JENJANG_PENDIDIKAN b on a.kode_jenjang_pendidikan = b.kode
		inner join REFF_JENIS_GOLONGAN c on a.kode_jenis_golongan = c.kode		
		where	c.DESKRIPSI like '%' + @p_keywords + '%' and
		        a.TAHUN = @p_tahun			
		ORDER BY a.ID
	end
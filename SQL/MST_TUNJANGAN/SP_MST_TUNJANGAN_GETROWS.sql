USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_TUNJANGAN_GETROWS]    Script Date: 08/08/2017 22:23:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MST_TUNJANGAN_GETROWS]
	(
	  @p_keywords	nvarchar(5)
	) 
	as
	begin
		select	a.ID,
				a.KODE,
				a.KODE_JENIS_TUNJANGAN,
				b.DESKRIPSI,
                a.NOMINAL,
                CASE WHEN a.STATUS = 1 THEN 'AKTIF' else 'TIDAK AKTIF' END STATUS               			
		from	MST_TUNJANGAN a
		INNER JOIN REFF_JENIS_TUNJANGAN b on a.KODE_JENIS_TUNJANGAN = b.KODE
		where	TAHUN	= @p_keywords 	
		ORDER BY [ID]
	end
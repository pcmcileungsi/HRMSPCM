USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_POSISI_GETROWS]    Script Date: 08/08/2017 21:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_MST_POSISI_GETROWS] 
	(
	  @p_keywords	nvarchar(5)
	) 
	as
	begin
		select	a.ID,
		        a.KODE,
				a.KODE_UNIT_KERJA,
				c.NAMA as DESC_UNIT_KERJA,
				a.KODE_POSISI,
				b.deskripsi as DESC_POSISI,
				--a.IS_SHIFT,
				--a.IS_CUTI
				case when a.IS_SHIFT = '1' then 'True' else 'False' end as IS_SHIFT,
				case when a.IS_CUTI = '1' then 'True' else 'False' end as IS_CUTI 	
		from	MST_POSISI a
		INNER JOIN reff_posisi b on a.KODE_POSISI = b.kode
		inner join mst_unit_kerja c on a.KODE_UNIT_KERJA = c.KODE
		where	c.NAMA	 like '%' + @p_keywords + '%' or b.deskripsi like '%' + @p_keywords + '%'			
		ORDER BY [ID]
	end
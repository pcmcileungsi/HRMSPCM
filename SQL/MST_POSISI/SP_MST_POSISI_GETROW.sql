USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_POSISI_GETROW]    Script Date: 08/08/2017 21:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MST_POSISI_GETROW]
	(
	  @p_ID		int
	) 
	as
	begin
		select	a.ID,
		        a.KODE,
				a.KODE_UNIT_KERJA,
				c.NAMA as DESC_UNIT_KERJA,
				a.KODE_POSISI,
				b.deskripsi as DESC_POSISI,
				a.IS_SHIFT,
				a.IS_CUTI	
		from	MST_POSISI a
		INNER JOIN reff_posisi b on a.KODE_POSISI = b.kode
		inner join mst_unit_kerja c on a.KODE_UNIT_KERJA = c.KODE		
		where	a.ID	= @p_ID
	end
USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_JABATAN_GETROW]    Script Date: 08/08/2017 21:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MST_JABATAN_GETROW]
	(
	  @p_ID		int
	) 
	as
	begin
		select	a.*,b.DESKRIPSI,c.NAMA
		from	MST_JABATAN a
		inner join REFF_JENIS_jabatan b on a.kode_jabatan = b.kode
		inner join MST_unit_kerja c on a.kode_unit_kerja = c.kode
		where	a.ID	= @p_ID
	end
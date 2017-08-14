USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_GAPOK_GETROW]    Script Date: 08/08/2017 21:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_MST_GAPOK_GETROW]
	(
	  @p_ID		int
	) 
	as
	begin
		select	a.*,		        
		        b.DESKRIPSI as DESKRIPSI_PENDIDIKAN,
		        c.DESKRIPSI as DESKRIPSI_GOLONGAN
		from	MST_GAPOK a
		inner join REFF_JENJANG_PENDIDIKAN b on a.kode_jenjang_pendidikan = b.kode
		inner join REFF_JENIS_GOLONGAN c on a.kode_jenis_golongan = c.kode
		where	a.ID	= @p_ID
	end
USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_TUNJANGAN_GETROW]    Script Date: 08/08/2017 22:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MST_TUNJANGAN_GETROW]
	(
	  @p_ID		int
	) 
	as
	begin
		select	a.*,B.DESKRIPSI
		from	MST_TUNJANGAN a		
		inner join REFF_JENIS_TUNJANGAN b on a.KODE_JENIS_TUNJANGAN = b.KODE
		where	a.ID	= @p_ID
	end
USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_UNIT_KERJA_GETROW]    Script Date: 08/08/2017 22:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_MST_UNIT_KERJA_GETROW]
	(
	  @p_ID		int
	) 
	as
	begin
		select	a.*, b.nama as nama_majelis
		from	mst_unit_kerja a
		inner join MST_MAJELIS b on a.kode_majelis = b.kode
		where	a.ID	= @p_ID
	end
USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[sp_ls_tblbranch_delete]    Script Date: 08/07/2017 20:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[SP_MST_UNIT_KERJA_DELETE]
	(
		@p_ID		int
	) 
	as
	begin
		delete	mst_unit_kerja
		where	ID	= @p_ID
	end

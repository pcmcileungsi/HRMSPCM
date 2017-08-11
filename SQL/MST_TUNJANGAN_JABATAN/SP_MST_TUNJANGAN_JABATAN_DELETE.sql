USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_TUNJANGAN_JABATAN_DELETE]    Script Date: 08/07/2017 20:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[SP_MST_TUNJANGAN_JABATAN_DELETE]
	(
		@p_ID		int
	) 
	as
	begin
		delete	MST_TUNJANGAN_JABATAN
		where	ID	= @p_ID
	end

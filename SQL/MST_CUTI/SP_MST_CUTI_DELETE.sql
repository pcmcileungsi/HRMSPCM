USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_CUTI_DELETE]    Script Date: 08/08/2017 21:02:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[SP_MST_CUTI_DELETE]
	(
		@p_ID		int
	) 
	as
	begin
		delete	MST_CUTI
		where	ID	= @p_ID
	end
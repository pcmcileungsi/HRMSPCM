USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_HR_KONTRAK_DELETE]    Script Date: 08/16/2017 20:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[SP_HR_KONTRAK_DELETE]
	(
		@p_ID		int
	) 
	as
	begin
		delete	HR_KONTRAK
		where	ID	= @p_ID
	end

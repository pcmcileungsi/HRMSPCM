USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_UNIT_KERJA_GETROW]    Script Date: 08/08/2017 21:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MST_MAJELIS_GETROW]
	(
	  @p_ID		int
	) 
	as
	begin
		select	*
		from	MST_MAJELIS
		where	ID	= @p_ID
	end
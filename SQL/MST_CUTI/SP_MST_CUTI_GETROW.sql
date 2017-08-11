USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_CUTI_GETROW]    Script Date: 08/08/2017 21:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_MST_CUTI_GETROW]
	(
	  @p_ID		int
	) 
	as
	begin
		select	a.*
		from	MST_CUTI a
	    where	a.ID	= @p_ID
	end
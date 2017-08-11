USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_GAPOK_GETROWS]    Script Date: 08/08/2017 21:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MST_GAPOK_GETROWS]
	(
	  @p_keywords	nvarchar(5)
	) 
	as
	begin
		select	ID,
				KODE,
				NOMINAL							
		from	MST_GAPOK
		where	[KODE]	 like '%' + @p_keywords + '%'			
		ORDER BY [ID]
	end
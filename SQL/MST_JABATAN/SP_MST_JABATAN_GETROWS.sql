USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_JABATAN_GETROWS]    Script Date: 08/08/2017 21:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MST_JABATAN_GETROWS]
	(
	  @p_keywords	nvarchar(5)
	) 
	as
	begin
		select	ID,
				KODE										
		from	MST_JABATAN
		where	[KODE]	 like '%' + @p_keywords + '%'			
		ORDER BY [ID]
	end
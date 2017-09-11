USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_SHIFT_GETROWS_KODE]    Script Date: 08/08/2017 22:23:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MST_SHIFT_GETROWS_KODE]
	(
	  @p_keywords	nvarchar(5)
	) 
	as
	begin
		select DISTINCT KODE           			
		from	REFF_JENIS_SHIFT	
        ORDER BY KODE DESC		
	end
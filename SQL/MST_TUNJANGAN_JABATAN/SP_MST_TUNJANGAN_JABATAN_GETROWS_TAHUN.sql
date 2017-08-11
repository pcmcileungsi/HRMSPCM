USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_TUNJANGAN_JABATAN_GETROWS_TAHUN]    Script Date: 08/08/2017 22:23:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MST_TUNJANGAN_JABATAN_GETROWS_TAHUN]
	(
	  @p_keywords	nvarchar(5)
	) 
	as
	begin
		select DISTINCT TAHUN           			
		from	MST_TUNJANGAN_JABATAN	
        ORDER BY TAHUN DESC		
	end
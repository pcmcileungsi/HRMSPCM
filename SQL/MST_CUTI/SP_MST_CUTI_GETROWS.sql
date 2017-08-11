USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_CUTI_GETROWS]    Script Date: 08/08/2017 21:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_MST_CUTI_GETROWS]
	(
	  @p_keywords	nvarchar(5)
	) 
	as
	begin
		select	ID,
				KODE,
				NAMA,
				JML_HARI							
		from	MST_CUTI
		where	[NAMA]	 like '%' + @p_keywords + '%'			
		ORDER BY [ID]
	end
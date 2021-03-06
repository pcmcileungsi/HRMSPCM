USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_UNIT_KERJA_GETROWS]    Script Date: 08/08/2017 21:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_MST_MAJELIS_GETROWS]
	(
	  @p_keywords	nvarchar(5)
	) 
	as
	begin
		select	ID,
				KODE,
				NAMA,
				ALAMAT				
		from	MST_MAJELIS
		where	NAMA	 like '%' + @p_keywords + '%'			
		ORDER BY [ID]
	end
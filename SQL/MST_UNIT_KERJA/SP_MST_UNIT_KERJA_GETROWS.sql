USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_UNIT_KERJA_GETROWS]    Script Date: 08/08/2017 22:23:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_MST_UNIT_KERJA_GETROWS]
	(
	  @p_keywords	nvarchar(5),
	  @p_majelis    nvarchar(10)
	) 
	as
	begin
		select	ID,
				KODE,
				NAMA				
		from	mst_unit_kerja
		where	[NAMA]	 like '%' + @p_keywords + '%'	and
		        [KODE_MAJELIS] like '%' + @p_majelis + '%'	
		ORDER BY [ID]
	end
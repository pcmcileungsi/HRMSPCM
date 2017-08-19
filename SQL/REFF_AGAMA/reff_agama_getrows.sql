USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_agama_getrows]    Script Date: 08/18/2017 20:42:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_reff_agama_getrows]
	(
	  @p_keywords	nvarchar(50)
	) 
	as
	begin
		select	*
		from	reff_agama
		where	deskripsi	LIKE '%' + @p_keywords + '%'
		ORDER BY deskripsi
	end
GO



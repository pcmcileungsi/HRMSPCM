/****** Object:  StoredProcedure [dbo].[SP_REFF_MASAKERJA_GETROWS]    Script Date: 08/18/2017 20:52:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_REFF_MASAKERJA_GETROWS]
	(
	  @p_keywords	nvarchar(50)
	) 
	as
	begin
		select	*
		from	REFF_MASA_KERJA
		where	deskripsi	LIKE '%' + @p_keywords + '%'
		ORDER BY KODE
	end
GO


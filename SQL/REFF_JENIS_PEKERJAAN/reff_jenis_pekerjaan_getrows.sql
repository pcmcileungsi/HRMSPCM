USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_jenis_pekerjaan_getrows]    Script Date: 08/19/2017 10:15:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_reff_jenis_pekerjaan_getrows]
	(
	  @p_keywords	nvarchar(50)
	) 
	as
	begin
		select	*
		from	reff_jenis_pekerjaan
		where	deskripsi	LIKE '%' + @p_keywords + '%'
		ORDER BY deskripsi
	end
GO


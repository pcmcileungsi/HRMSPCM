USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_jenis_tunjangan_getrows]    Script Date: 08/19/2017 10:25:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_reff_jenis_tunjangan_getrows]
	(
	  @p_keywords	nvarchar(50)
	) 
	as
	begin
		select	*
		from	reff_jenis_tunjangan
		where	deskripsi	LIKE '%' + @p_keywords + '%'
		ORDER BY deskripsi
	end
GO


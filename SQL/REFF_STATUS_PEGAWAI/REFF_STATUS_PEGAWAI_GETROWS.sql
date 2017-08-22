/****** Object:  StoredProcedure [dbo].SP_REFF_STATUS_PEGAWAI_GETROWS    Script Date: 08/18/2017 20:52:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_REFF_STATUS_PEGAWAI_GETROWS]
	(
	  @p_keywords	nvarchar(50)
	) 
	as
	begin
		select	*
		from	REFF_STATUS_PEGAWAI
		where	deskripsi	LIKE '%' + @p_keywords + '%'
		ORDER BY deskripsi
	end
GO


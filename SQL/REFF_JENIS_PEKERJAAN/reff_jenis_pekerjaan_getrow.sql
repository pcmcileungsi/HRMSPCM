USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_jenis_pekerjaan_getrow]    Script Date: 08/18/2017 20:54:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[sp_reff_jenis_pekerjaan_getrow]
	(
	  @p_id		tinyint
	) 
	as
	begin
		select	*
		from	reff_jenis_pekerjaan
		where	id	= @p_id
	end
GO


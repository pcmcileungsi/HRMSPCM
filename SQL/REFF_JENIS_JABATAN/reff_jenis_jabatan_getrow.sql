USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_jenis_jabatan_getrow]    Script Date: 08/18/2017 20:52:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_reff_jenis_jabatan_getrow]
	(
	  @p_id		tinyint
	) 
	as
	begin
		select	*
		from	reff_jenis_jabatan
		where	id	= @p_id
	end
GO


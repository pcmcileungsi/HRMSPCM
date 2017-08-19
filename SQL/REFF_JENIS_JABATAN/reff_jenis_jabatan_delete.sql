USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_jenis_jabatan_delete]    Script Date: 08/18/2017 20:51:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_reff_jenis_jabatan_delete]
	(
		@p_id		TINYINT
	) 
	as
	begin
		delete	reff_jenis_jabatan
		where	id	= @p_id
	end

GO


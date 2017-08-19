USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_jenis_tunjangan_delete]    Script Date: 08/19/2017 10:24:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_reff_jenis_tunjangan_delete]
	(
		@p_id		TINYINT
	) 
	as
	begin
		delete	reff_jenis_tunjangan
		where	id	= @p_id
	end

GO


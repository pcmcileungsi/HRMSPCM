USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_agama_delete]    Script Date: 08/18/2017 20:39:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_reff_agama_delete]
	(
		@p_id		TINYINT
	) 
	as
	begin
		delete	reff_agama
		where	id	= @p_id
	end

GO



USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_hub_keluarga_delete]    Script Date: 08/18/2017 20:43:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_reff_hub_keluarga_delete]
	(
		@p_id		TINYINT
	) 
	as
	begin
		delete	reff_hub_keluarga
		where	id	= @p_id
	end

GO



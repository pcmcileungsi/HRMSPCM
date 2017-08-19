USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_hub_keluarga_getrow]    Script Date: 08/18/2017 20:44:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_reff_hub_keluarga_getrow]
	(
	  @p_id		tinyint
	) 
	as
	begin
		select	*
		from	reff_hub_keluarga
		where	id	= @p_id
	end
GO



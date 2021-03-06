USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_SHIFT_UPDATE]    Script Date: 08/08/2017 21:14:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[SP_MST_SHIFT_UPDATE]
	(
		     @p_ID		int 
			,@p_KODE			nvarchar(5)
			,@p_DESKRIPSI			Nvarchar(100)
			,@p_START_TIME		varchar(5)
			,@p_END_TIME		varchar(5)	
			,@p_cre_date			datetime
			,@p_cre_by				nvarchar(15)
			,@p_cre_ip_address		nvarchar(15)
			,@p_mod_date			datetime
			,@p_mod_by				nvarchar(15)
			,@p_mod_ip_address		nvarchar(15)
	) as
	begin
		update	REFF_JENIS_SHIFT
		set		KODE			= @p_KODE,
				DESKRIPSI			= @p_DESKRIPSI,
				START_TIME		    = @p_START_TIME,
				END_TIME			= @p_END_TIME,							
				mod_date			= @p_mod_date,
				mod_by				= @p_mod_by,
				mod_ip_address		= @p_mod_ip_address
		where	ID		= @p_ID
	end
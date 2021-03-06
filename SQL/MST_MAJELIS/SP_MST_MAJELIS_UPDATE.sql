USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_UNIT_KERJA_UPDATE]    Script Date: 08/08/2017 21:14:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[SP_MST_MAJELIS_UPDATE]
	(
		 @p_ID		int 
		,@p_KODE			nvarchar(5)
		,@p_NAMA			nvarchar(100)
		,@p_ALAMAT		nvarchar(200)
		,@p_TELP		nvarchar(20)
		,@p_FAX			nvarchar(20)
		,@p_EMAIL			nvarchar(100)
		,@p_KA_UNIT			nvarchar(100)
		,@p_GROUP			nvarchar(1)		
		,@p_mod_date			datetime
		,@p_mod_by				nvarchar(15)
		,@p_mod_ip_address		nvarchar(15)
	) as
	begin
		update	MST_MAJELIS
		set		KODE			= @p_KODE,
				NAMA			= @p_NAMA,
				ALAMAT		    = @p_ALAMAT,
				TELP			= @p_TELP,
				EMAIL			= @p_EMAIL,
				KA_UNIT			= @p_KA_UNIT,
				[GROUP]			= @p_GROUP,				
				mod_date			= @p_mod_date,
				mod_by				= @p_mod_by,
				mod_ip_address		= @p_mod_ip_address
		where	ID		= @p_ID
	end
USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_GAPOK_UPDATE]    Script Date: 08/07/2017 20:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[SP_MST_GAPOK_UPDATE]
	(
		 @p_ID		int 
		,@p_KODE			nvarchar(10)
		,@p_KODE_JENJANG_PENDIDIKAN			nvarchar(5)
		,@p_KODE_JENIS_GOLONGAN		nvarchar(5)
		,@p_NOMINAL		[numeric](18, 2)
		,@p_TAHUN			nvarchar(4)
		,@p_STATUS			nvarchar(1)	
		,@p_cre_date			datetime
		,@p_cre_by				nvarchar(15)
		,@p_cre_ip_address		nvarchar(15)
		,@p_mod_date			datetime
		,@p_mod_by				nvarchar(15)
		,@p_mod_ip_address		nvarchar(15)
	) as
	begin
		update	MST_GAPOK
		set		KODE			= @p_KODE,
				KODE_JENJANG_PENDIDIKAN			= @p_KODE_JENJANG_PENDIDIKAN,
				KODE_JENIS_GOLONGAN		    = @p_KODE_JENIS_GOLONGAN,
				NOMINAL			= @p_NOMINAL,
				TAHUN			= @p_TAHUN,
				STATUS			= @p_STATUS,				
				mod_date			= @p_mod_date,
				mod_by				= @p_mod_by,
				mod_ip_address		= @p_mod_ip_address
		where	ID		= @p_ID
	end
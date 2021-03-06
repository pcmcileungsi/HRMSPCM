USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_POSISI_UPDATE]    Script Date: 08/08/2017 21:14:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[SP_MST_POSISI_UPDATE]
	(
		     @p_ID		int 
			,@p_KODE			nvarchar(10)
			,@p_KODE_UNIT_KERJA			nvarchar(5)
			,@p_KODE_POSISI		nvarchar(5)
			,@p_IS_SHIFT		nvarchar(1)
			,@p_IS_CUTI		nvarchar(1)
			,@p_cre_date			datetime
			,@p_cre_by				nvarchar(15)
			,@p_cre_ip_address		nvarchar(15)
			,@p_mod_date			datetime
			,@p_mod_by				nvarchar(15)
			,@p_mod_ip_address		nvarchar(15)
	) as
	begin
		update	MST_POSISI
		set		KODE			    = @p_KODE,
				KODE_UNIT_KERJA		= @p_KODE_UNIT_KERJA,
				KODE_POSISI		    = @p_KODE_POSISI,
				IS_SHIFT			= @p_IS_SHIFT,
				IS_CUTI			    = @p_IS_CUTI,						
				mod_date			= @p_mod_date,
				mod_by				= @p_mod_by,
				mod_ip_address		= @p_mod_ip_address
		where	ID		= @p_ID
	end
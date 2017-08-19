USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_jenis_pekerjaan_update]    Script Date: 08/19/2017 10:23:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_reff_jenis_pekerjaan_update]
	(
		@p_id		int
		,@p_kode				nvarchar(5)
		,@p_deskripsi			[varchar](50)
		,@p_cre_date			datetime
		,@p_cre_by				nvarchar(15)
		,@p_cre_ip_address		nvarchar(15)
		,@p_mod_date			datetime
		,@p_mod_by				nvarchar(15)
		,@p_mod_ip_address		nvarchar(15)
	) as
	begin
		update	reff_jenis_pekerjaan
		set		kode				= @p_kode,
				deskripsi			= @p_deskripsi,
				mod_date			= @p_mod_date,
				mod_by				= @p_mod_by,
				mod_ip_address		= @p_mod_ip_address
		where	id		= @p_id
	end
GO


USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_jenis_golongan_update]    Script Date: 08/18/2017 20:49:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_reff_jenis_golongan_update]
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
		update	reff_jenis_golongan
		set		kode				= @p_kode,
				deskripsi			= @p_deskripsi,
				mod_date			= @p_mod_date,
				mod_by				= @p_mod_by,
				mod_ip_address		= @p_mod_ip_address
		where	id		= @p_id
	end
GO



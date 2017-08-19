USE [MHRMS]
GO

/****** Object:  StoredProcedure [dbo].[sp_reff_jenis_pekerjaan_insert]    Script Date: 08/19/2017 10:23:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_reff_jenis_pekerjaan_insert]
	(
		@p_id		int output
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

		insert into reff_jenis_pekerjaan
		(
			kode,
			deskripsi,
			cre_date,
			cre_by,
			cre_ip_address,
			mod_date,
			mod_by,
			mod_ip_address
		)
		values
		(
			@p_kode,
			@p_deskripsi,
			@p_cre_date,
			@p_cre_by,
			@p_cre_ip_address,
			@p_mod_date,
			@p_mod_by,
			@p_mod_ip_address
		)
		set @p_id =  @@identity
	end
GO


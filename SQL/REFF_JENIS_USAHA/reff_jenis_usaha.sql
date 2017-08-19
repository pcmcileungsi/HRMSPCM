USE [MHRMS]
--DELETE
create procedure [dbo].[sp_reff_jenis_usaha_delete]
	(
		@p_id		TINYINT
	) 
	as
	begin
		delete	reff_jenis_usaha
		where	id	= @p_id
	end
--GETROW
create procedure [dbo].[sp_reff_jenis_usaha_getrow]
	(
	  @p_id		tinyint
	) 
	as
	begin
		select	*
		from	reff_jenis_usaha
		where	id	= @p_id
	end
--GETROWS
Create procedure [dbo].[sp_reff_jenis_usaha_getrows]
	(
	  @p_keywords	nvarchar(50)
	) 
	as
	begin
		select	*
		from	reff_jenis_usaha
		where	deskripsi	LIKE '%' + @p_keywords + '%'
		ORDER BY deskripsi
	end
--INSERT
CREATE procedure [dbo].[sp_reff_jenis_usaha_insert]
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

		insert into reff_jenis_usaha
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

--UPDATE
CREATE procedure [dbo].[sp_reff_jenis_usaha_update]
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
		update	reff_jenis_usaha
		set		kode				= @p_kode,
				deskripsi			= @p_deskripsi,
				mod_date			= @p_mod_date,
				mod_by				= @p_mod_by,
				mod_ip_address		= @p_mod_ip_address
		where	id		= @p_id
	end








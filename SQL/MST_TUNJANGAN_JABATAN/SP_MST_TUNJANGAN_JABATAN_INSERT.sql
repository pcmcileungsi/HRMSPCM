USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_TUNJANGAN_JABATAN_INSERT]    Script Date: 08/07/2017 20:54:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MST_TUNJANGAN_JABATAN_INSERT]
(
	 @p_ID		int output
	,@p_KODE			nvarchar(10)
	,@p_KODE_JENIS_TUNJANGAN			nvarchar(5)
	,@p_KODE_MASTER_JABATAN			nvarchar(5)
	,@p_NOMINAL		numeric(18, 2)
	,@p_TAHUN		nvarchar(4)		
	,@p_STATUS		nvarchar(1)
	,@p_cre_date			datetime
	,@p_cre_by				nvarchar(15)
	,@p_cre_ip_address		nvarchar(15)
	,@p_mod_date			datetime
	,@p_mod_by				nvarchar(15)
	,@p_mod_ip_address		nvarchar(15)
) as
begin

	insert into MST_TUNJANGAN_JABATAN
	(
		KODE,
		KODE_JENIS_TUNJANGAN,
		KODE_MASTER_JABATAN,
		NOMINAL,
		TAHUN,
        STATUS,		
		cre_date,
		cre_by,
		cre_ip_address,
		mod_date,
		mod_by,
		mod_ip_address
	)
	values
	(
		@p_KODE,
		@p_KODE_JENIS_TUNJANGAN,
		@p_KODE_MASTER_JABATAN,
		@p_NOMINAL,
		@p_TAHUN,
        @p_STATUS,			
		@p_cre_date,
		@p_cre_by,
		@p_cre_ip_address,
		@p_mod_date,
		@p_mod_by,
		@p_mod_ip_address
	)
	set @p_ID =  @@identity
end

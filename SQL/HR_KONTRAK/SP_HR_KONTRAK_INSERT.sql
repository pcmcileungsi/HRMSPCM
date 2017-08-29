USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_HR_KONTRAK_INSERT]    Script Date: 08/16/2017 20:45:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_HR_KONTRAK_INSERT]
(
	 @p_ID		int output
	,@p_KODE			varchar(20)
	,@p_DESKRIPSI			varchar(100)
	,@p_DOKUMEN_PATH		varchar(150)
	,@p_DOKUMEN_NAME		varchar(50)
	,@p_KODE_UNIT_KERJA		nvarchar(5)
	,@p_KODE_POSISI			nvarchar(5)
	,@p_KODE_MST_JABATAN		nvarchar(10)
	,@p_KODE_PEGAWAI		varchar(20)
	,@p_STATUS_PEGAWAI			varchar(1)
	,@p_TANGGAL_MULAI_KONTRAK  datetime
	,@p_TANGGAL_AKHIR_KONTRAK datetime	
	,@p_cre_date			datetime
	,@p_cre_by				nvarchar(15)
	,@p_cre_ip_address		nvarchar(15)
	,@p_mod_date			datetime
	,@p_mod_by				nvarchar(15)
	,@p_mod_ip_address		nvarchar(15)
) as
begin

	insert into HR_KONTRAK
	(
	    [KODE]
       ,[DESKRIPSI]
       ,[DOKUMEN_PATH]
       ,[DOKUMEN_NAME]
       ,[KODE_UNIT_KERJA]
       ,[KODE_POSISI]
       ,[KODE_MST_JABATAN]
       ,[KODE_PEGAWAI]
       ,[STATUS_PEGAWAI]
       ,[TANGGAL_MULAI_KONTRAK]
       ,[TANGGAL_AKHIR_KONTRAK]	  
       ,[CRE_DATE]
       ,[CRE_BY]
       ,[CRE_IP_ADDRESS]
       ,[MOD_DATE]
       ,[MOD_BY]
       ,[MOD_IP_ADDRESS]
	)
	values
	(
		@p_KODE,
		@p_DESKRIPSI,
		@p_DOKUMEN_PATH,
		@p_DOKUMEN_NAME,
		@p_KODE_UNIT_KERJA,
		@p_KODE_POSISI,
		@p_KODE_MST_JABATAN,
		@p_KODE_PEGAWAI,
	    case when @p_STATUS_PEGAWAI = '1' then 1 else 0 end,
		@p_TANGGAL_MULAI_KONTRAK,
		@p_TANGGAL_AKHIR_KONTRAK,		
		@p_cre_date,
		@p_cre_by,
		@p_cre_ip_address,
		@p_mod_date,
		@p_mod_by,
		@p_mod_ip_address
	)
	set @p_ID =  @@identity
end

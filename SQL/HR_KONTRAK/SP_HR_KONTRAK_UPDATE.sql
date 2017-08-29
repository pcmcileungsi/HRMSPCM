USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_HR_KONTRAK_UPDATE]    Script Date: 08/16/2017 20:56:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[SP_HR_KONTRAK_UPDATE]
	(
		 @p_ID		int 
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
		update	HR_KONTRAK
		set		KODE			      = @p_KODE,
				DESKRIPSI			  = @p_DESKRIPSI,
				DOKUMEN_PATH		  = @p_DOKUMEN_PATH,
				DOKUMEN_NAME		  = @p_DOKUMEN_NAME,
				KODE_UNIT_KERJA		  = @p_KODE_UNIT_KERJA,
				KODE_POSISI			  = @p_KODE_POSISI,
				KODE_MST_JABATAN      = @p_KODE_MST_JABATAN,
				KODE_PEGAWAI          = @p_KODE_PEGAWAI,
				STATUS_PEGAWAI	      = case when @p_STATUS_PEGAWAI = '1' then 1 else 0 end,
				TANGGAL_MULAI_KONTRAK = @p_TANGGAL_MULAI_KONTRAK,
				TANGGAL_AKHIR_KONTRAK = @p_TANGGAL_AKHIR_KONTRAK,				
				mod_date			  = @p_mod_date,
				mod_by				  = @p_mod_by,
				mod_ip_address		  = @p_mod_ip_address
		where	ID		= @p_ID
	end
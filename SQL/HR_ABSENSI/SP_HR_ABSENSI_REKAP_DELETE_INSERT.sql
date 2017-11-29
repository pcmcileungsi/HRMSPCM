CREATE procedure [dbo].[SP_HR_ABSENSI_REKAP_DELETE_INSERT]
(
     @p_NIK varchar(10),
     @p_NAMA varchar(50),
     @p_TANGGAL_AWAL varchar(10),
     @p_TANGGAL_AKHIR varchar(10),
     @p_TELAT varchar(2),
     @p_PULANGCEPAT varchar(2),
     @p_HADIR varchar(2),
     @p_SAKIT varchar(2),
     @p_CUTI varchar(2),
     @p_IJIN varchar(2),
     @p_ALPHA varchar(2),
     @p_cre_date			datetime
	,@p_cre_by				nvarchar(15)
	,@p_cre_ip_address		nvarchar(15)
	,@p_mod_date			datetime
	,@p_mod_by				nvarchar(15)
	,@p_mod_ip_address		nvarchar(15)			
) as
begin

	begin try
		begin tran
		
		   DELETE HR_ABSENSI_REKAP WHERE NIK = @p_NIK AND TANGGAL_AWAL = @p_TANGGAL_AWAL AND TANGGAL_AKHIR = @p_TANGGAL_AKHIR
		   
		   INSERT INTO HR_ABSENSI_REKAP
           ([NIK]
           ,[NAMA]
           ,[TANGGAL_AWAL]
           ,[TANGGAL_AKHIR]
           ,[TELAT]
           ,[PULANGCEPAT]
           ,[HADIR]
           ,[SAKIT]
           ,[CUTI]
           ,[IJIN]
           ,[ALPHA]
           ,[CRE_DATE]
           ,[CRE_BY]
           ,[CRE_IP_ADDRESS]
           ,[MOD_DATE]
           ,[MOD_BY]
           ,[MOD_IP_ADDRESS])
            VALUES
           (@p_NIK
           ,@p_NAMA
           ,@p_TANGGAL_AWAL
           ,@p_TANGGAL_AKHIR
           ,@p_TELAT
           ,@p_PULANGCEPAT
           ,@p_HADIR
           ,@p_SAKIT
           ,@p_CUTI
           ,@p_IJIN
           ,@p_ALPHA,
            @p_cre_date,
			@p_cre_by,
			@p_cre_ip_address,
			@p_mod_date,
			@p_mod_by,
			@p_mod_ip_address) 
				
		commit tran
	end try
	begin catch
		rollback tran
	end catch
	
	
	
end

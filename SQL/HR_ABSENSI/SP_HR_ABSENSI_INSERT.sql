create procedure [dbo].[SP_HR_ABSENSI_INSERT]
(
	 @p_NIK         		varchar(20)
	,@p_TANGGAL_ABSEN		date
	,@p_IN_TIME		        TIME
	,@p_OUT_TIME		    TIME
	,@p_ATTEND_TIME		    varchar(5)
	,@p_LEAVE_TIME			varchar(5)	
	,@p_KODE_JENIS_SHIFT	nvarchar(5)	
	,@p_ABNORMAL            varchar(50)
	,@p_WORK_TIME           INTEGER
	,@p_cre_date			datetime
	,@p_cre_by				nvarchar(15)
	,@p_cre_ip_address		nvarchar(15)
	,@p_mod_date			datetime
	,@p_mod_by				nvarchar(15)
	,@p_mod_ip_address		nvarchar(15)
) as
begin

	insert into HR_ABSENSI
	(
	    NIK
       ,TANGGAL_ABSEN
       ,IN_TIME
       ,OUT_TIME
       ,ATTEND_TIME
       ,LEAVE_TIME
       ,KODE_JENIS_SHIFT
       ,ABNORMAL
       ,WORK_TIME          
       ,[CRE_DATE]
       ,[CRE_BY]
       ,[CRE_IP_ADDRESS]
       ,[MOD_DATE]
       ,[MOD_BY]
       ,[MOD_IP_ADDRESS]
	)
	values
	(
		@p_NIK,
		@p_TANGGAL_ABSEN,
		@p_IN_TIME,
		@p_OUT_TIME,
		case when @p_ATTEND_TIME = '' then NULL else @p_ATTEND_TIME end,
		case when @p_LEAVE_TIME = '' then NULL else @p_LEAVE_TIME end,
		@p_KODE_JENIS_SHIFT,
		@p_ABNORMAL,
		@p_WORK_TIME,		   	
		@p_cre_date,
		@p_cre_by,
		@p_cre_ip_address,
		@p_mod_date,
		@p_mod_by,
		@p_mod_ip_address
	)
	
end

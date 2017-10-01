create procedure [dbo].[SP_HR_ABSENSI_GETROWS] --''
	(
	  @p_keywords	nvarchar(5)	 
	) 
	as
	begin
		select	ROW_NUMBER() OVER(ORDER BY (SELECT 0), f.nama,a.ID) AS NO,
		        a.ID,
		        a.KODE_PEGAWAI,			
				f.NAMA as NAMA_PEGAWAI,
				a.TANGGAL_ABSEN,
			    convert(varchar(5),IN_TIME,21) IN_TIME,   
			    convert(varchar(5),OUT_TIME,21) OUT_TIME, 	
                case when ATTEND_TIME is null then '' else convert(varchar(5),ATTEND_TIME,21) end ATTEND_TIME,  
			    case when LEAVE_TIME is null then '' else convert(varchar(5),LEAVE_TIME,21) end  LEAVE_TIME,
                a.KODE_JENIS_SHIFT				
		from	HR_ABSENSI a
		left join REFF_JENIS_SHIFT b on b.KODE = a.KODE_JENIS_SHIFT		
		left join HR_PEGAWAI f on f.nik = a.KODE_PEGAWAI
		where	f.NAMA	 like '%' + @p_keywords + '%' or f.NAMA is null	
	end
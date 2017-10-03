create procedure [dbo].[SP_HR_ABSENSI_REKAP_GETROW] --''
	(
	  @p_nik	varchar(15),
	  @p_TanggalAbsen	varchar(25)	 
	) 
	as
	begin
		select  id,
		        convert(varchar(10),tanggal_absen,105)tanggal_absen,
				convert(varchar(5),attend_time,21)attend_time,
				convert(varchar(5),leave_time,21)leave_time 
		from HR_absensi
		WHERE kode_pegawai = @p_nik and 
		      tanggal_absen between
		      RTRIM(LTRIM(SUBSTRING(@p_TanggalAbsen, 1, CHARINDEX('s', @p_TanggalAbsen, 0) - 1))) 
		      and 
		      RTRIM(LTRIM(SUBSTRING(@p_TanggalAbsen, CHARINDEX('d', @p_TanggalAbsen, 0) + LEN(';'), LEN(@p_TanggalAbsen))))
	end
	
	
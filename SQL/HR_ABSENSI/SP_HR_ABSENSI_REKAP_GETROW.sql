create procedure [dbo].[SP_HR_ABSENSI_REKAP_GETROW] --'533','2017-07-21 s/d 2017-08-20'
	(
	  @p_nik	varchar(15),
	  @p_TanggalAbsen	varchar(25)	 
	) 
	as
	begin
		select  id,
		        convert(varchar(10),tanggal_absen,105)tanggal_absen,
			    case when convert(varchar(5),attend_time,21) = '00:00' then '' else convert(varchar(5),attend_time,21) end  attend_time,
				case when(datediff(minute,in_time,attend_time)-10) < 0 then 0 else(datediff(minute,in_time,attend_time)-10) end telat,
				case when convert(varchar(5),leave_time,21) = '00:00' then '' else convert(varchar(5),leave_time,21) end leave_time,
				case when datediff(minute,out_time,leave_time) < 0 then datediff(minute,out_time,leave_time) else 0 end PulangCepat,
				0 Sakit,
				0 Cuti,
				0 Ijin,
				0 Alpha 
		from HR_absensi
		WHERE nik = @p_nik and 
		      tanggal_absen between
		      RTRIM(LTRIM(SUBSTRING(@p_TanggalAbsen, 1, CHARINDEX('s', @p_TanggalAbsen, 0) - 1))) 
		      and 
		      RTRIM(LTRIM(SUBSTRING(@p_TanggalAbsen, CHARINDEX('d', @p_TanggalAbsen, 0) + LEN(';'), LEN(@p_TanggalAbsen))))
	end
 
	
	--select * from HR_absensi where tanggal_absen between '2017-07-21' and '2017-08-20' and kode_pegawai = '533' and id = '8401'
	--select datediff(minute,'00:00','07:20')
	
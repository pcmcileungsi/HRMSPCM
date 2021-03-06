--[dbo].[SP_HR_ABSENSI_REKAP_GETROW] '820','2017-07-21 s/d 2017-8-20'
ALTER procedure [dbo].[SP_HR_ABSENSI_REKAP_GETROW] --'820','2017-07-21 s/d 2017-08-20'
	(
	  @p_nik	varchar(15),
	  @p_TanggalAbsen	varchar(25)	 
	) 
	as
	begin

	select * from
	(
		select *, Rank() OVER(partition By tanggal_absen Order By id desc) as ranking
		from
		(
			select '' as id,t1.tanggal_absen,'' as attend_time,'' as telat,'' as leave_time,'' as PulangCepat,				
				  case when exists (select 1 from HR_absensi a where a.tanggal_absen = t1.tanggal_absen and a.nik = @p_nik) then '0' else '1' end as sakit,
				  0 Cuti,
				  0 Ijin,
				  0 Alpha,
				  t1.working_day,
				  case when  t1.working_day = 1 then '' else 'Libur Nasional' end as Keterangan        
			from 
			(			
				select date as tanggal_absen,working_day from mst_calendar
				WHERE date between 
					  RTRIM(LTRIM(SUBSTRING(@p_TanggalAbsen, 1, CHARINDEX('s', @p_TanggalAbsen, 0) - 1))) 
					  and 
					  RTRIM(LTRIM(SUBSTRING(@p_TanggalAbsen, CHARINDEX('d', @p_TanggalAbsen, 0) + LEN(';'), LEN(@p_TanggalAbsen))))					  
			)t1	

			union all
	   
			select a.id,a.tanggal_absen,
			      case when convert(varchar(5),a.attend_time,21) = '00:00' then '' else convert(varchar(5),a.attend_time,21) end  attend_time,
				  case when(datediff(minute,a.in_time,a.attend_time)-10) < 0 then 0 else(datediff(minute,a.in_time,a.attend_time)-10) end telat,
				  case when convert(varchar(5),a.leave_time,21) = '00:00' then '' else convert(varchar(5),a.leave_time,21) end leave_time,
				  case when datediff(minute,a.out_time,a.leave_time) < 0 then datediff(minute,a.out_time,a.leave_time) else 0 end PulangCepat,
				  '0' as sakit,
				  0 Cuti,
				  0 Ijin,
				  0 Alpha,
				  1 working_day,
				  case when a.Keterangan = '' then '' else a.Keterangan end as Keterangan
			from HR_absensi a
			WHERE a.nik = @p_nik and 
				  a.tanggal_absen between 
				  RTRIM(LTRIM(SUBSTRING(@p_TanggalAbsen, 1, CHARINDEX('s', @p_TanggalAbsen, 0) - 1))) 
				  and 
				  RTRIM(LTRIM(SUBSTRING(@p_TanggalAbsen, CHARINDEX('d', @p_TanggalAbsen, 0) + LEN(';'), LEN(@p_TanggalAbsen))))		
		)TX	
	 ) A Where ranking = 1		

	
	end
 	
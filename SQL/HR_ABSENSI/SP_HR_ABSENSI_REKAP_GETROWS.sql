USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_HR_ABSENSI_REKAP_GETROWS]    Script Date: 11/27/2017 22:33:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[SP_HR_ABSENSI_REKAP_GETROWS] '2017-07-21','2017-08-20','1'
ALTER procedure [dbo].[SP_HR_ABSENSI_REKAP_GETROWS] --'2017-07-21','2017-08-20','1'
	(
	  @p_TANGGAL_ABSEN1	varchar(10),
	  @p_TANGGAL_ABSEN2	varchar(10),
	  @p_KODE_UNIT_KERJA varchar(5)	 
	) 
	as
	begin	
	
    DECLARE @maxid INT,@Flag INT,@nik varchar(5),@sakit INT
    select ROW_NUMBER() OVER(ORDER BY (select 0)) as NUMBER,t1.nik, 0 as sakit 
    into #tmp1 
    from 
    (
		SELECT distinct nik 	
		from HR_absensi WHERE tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2
	)t1	
	
    SELECT @maxid = COUNT(1) FROM #tmp1;
	SET @Flag = 1;
	
	    WHILE (@Flag <= @maxid)
		BEGIN 
		    select @nik = nik 
			from #tmp1	 
			where NUMBER = @flag 

			select @sakit= count(1)  from
			(
				select case when exists (select 1 from HR_absensi a where a.tanggal_absen = t1.tanggal_absen and a.nik = @nik) then 0 else 1 end as sakit				          
				from 
				(			
					select date as tanggal_absen from MST_CALENDAR
					WHERE date between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2 and working_day = '1'
				)t1	
			 )t2 where t2.sakit = 1 
			update #tmp1 set sakit = @sakit where NUMBER = @Flag 

		    SET @Flag = @Flag + 1
		END
		
	select t1.nik, a.NAMA, sum(Telat)as Telat, sum(PulangCepat) as PulangCepat,sum(Hadir) as Hadir,
	       sum(Sakit)as Sakit, sum(Cuti) as Cuti,sum(Ijin) as Ijin,sum(Alpha) as Alpha   
	from
	(
		select a.nik,
		       --count( RTRIM(LTRIM(SUBSTRING(a.abnormal, CHARINDEX(';', a.abnormal, 0) + LEN(';'), LEN(a.abnormal))))) Telat,
		       count(case when(datediff(minute,a.in_time,a.attend_time)-10) < 0 then 0 else(datediff(minute,a.in_time,a.attend_time)-10) end) Telat,
		       0 as PulangCepat, 0 as Hadir , 0 Sakit, 0 Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja		
		RIGHT JOIN MST_CALENDAR D ON A.tanggal_absen = D.DATE --TAMBAHAN		
		where a.abnormal not in('Absence','Normal') --(a.abnormal <> 'Absence' or a.abnormal <> 'Normal') 
		and RTRIM(LTRIM(SUBSTRING(a.abnormal, CHARINDEX(';', a.abnormal, 0) + LEN(';'), LEN(a.abnormal)))) <> ''
		and (a.tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)
		AND D.WORKING_DAY = 1	
		AND (case when(datediff(minute,a.in_time,a.attend_time)-10) < 0 then 0 else(datediff(minute,a.in_time,a.attend_time)-10) end) >=1	
		group by a.nik
				
		union
		
		select a.nik,0 as Telat, count( RTRIM(LTRIM(SUBSTRING(a.abnormal, 1, CHARINDEX(';', a.abnormal, 0) - 1)))) PulangCepat, 
		       0 as Hadir , 0 Sakit, 0 Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		RIGHT JOIN MST_CALENDAR D ON A.tanggal_absen = D.DATE --TAMBAHAN
		where a.abnormal not in('Absence','Normal') --(a.abnormal <> 'Absence' and a.abnormal <> 'Normal')
		and RTRIM(LTRIM(SUBSTRING(a.abnormal, 1, CHARINDEX(';', a.abnormal, 0) - 1))) <> ''
		and (tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)
		AND D.WORKING_DAY = 1	
		group by a.nik
		
		union
		
		--HADIR
		select a.nik,0 as Telat, 0 as PulangCepat , count(a.abnormal) Hadir,0 Sakit, 0 Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		RIGHT JOIN MST_CALENDAR D ON A.tanggal_absen = D.DATE --TAMBAHAN
		where --a.abnormal = 'Normal' and
		(a.tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)	
		AND D.WORKING_DAY = 1	
		group by a.nik
		
		union
		
		--SAKIT	
		select nik,0 as Telat, 0 as PulangCepat , 0 Hadir,sakit,0 Cuti, 0 Ijin, 0 Alpha from #tmp1	
		union		
		select a.nik,0 as Telat, 0 as PulangCepat , 0 Hadir, count(a.keterangan) Sakit, 0 Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		where (a.tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)	and a.keterangan = 'Sakit'
		group by a.nik
		
		union
		
		--CUTI
		select a.nik,0 as Telat, 0 as PulangCepat , 0 Hadir, 0 Sakit, count(a.keterangan) Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		where (a.tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)	and a.keterangan = 'Cuti'
		group by a.nik
		
		union
		
		--IJIN
		select a.nik,0 as Telat, 0 as PulangCepat , 0 Hadir, 0 Sakit, 0 Cuti, count(a.keterangan) Ijin, 0 Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		where (a.tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)	and a.keterangan = 'Ijin'
		group by a.nik
		
		union
		
		--ALPHA
		select a.nik,0 as Telat, 0 as PulangCepat , 0 Hadir, 0 Sakit, 0 Cuti, 0 Ijin, count(a.keterangan) Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		where (a.tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)	and a.keterangan = 'Alpha'
		group by a.nik
	)t1
	inner join  HR_PEGAWAI a on a.nik = t1.nik
	group by t1.nik,a.nama   
	
	drop table #tmp1
	    
	end
	

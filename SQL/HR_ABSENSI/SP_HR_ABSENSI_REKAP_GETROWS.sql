create procedure [dbo].[SP_HR_ABSENSI_REKAP_GETROWS] --'2017-07-21','2017-08-20','1'
	(
	  @p_TANGGAL_ABSEN1	varchar(10),
	  @p_TANGGAL_ABSEN2	varchar(10),
	  @p_KODE_UNIT_KERJA varchar(5)	 
	) 
	as
	begin
		
	select t1.nik, a.NAMA, sum(Telat)as Telat, sum(PulangCepat) as PulangCepat,sum(Hadir) as Hadir,
	       sum(Sakit)as Sakit, sum(Cuti) as Cuti,sum(Ijin) as Ijin,sum(Alpha) as Alpha   
	from
	(
		select a.nik,count( RTRIM(LTRIM(SUBSTRING(a.abnormal, CHARINDEX(';', a.abnormal, 0) + LEN(';'), LEN(a.abnormal))))) Telat,
		       0 as PulangCepat, 0 as Hadir , 0 Sakit, 0 Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		where a.abnormal not in('Absence','Normal') --(a.abnormal <> 'Absence' or a.abnormal <> 'Normal') 
		and RTRIM(LTRIM(SUBSTRING(a.abnormal, CHARINDEX(';', a.abnormal, 0) + LEN(';'), LEN(a.abnormal)))) <> ''
		and (a.tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)		
		group by a.nik
		union
		select a.nik,0 as Telat, count( RTRIM(LTRIM(SUBSTRING(a.abnormal, 1, CHARINDEX(';', a.abnormal, 0) - 1)))) PulangCepat, 
		       0 as Hadir , 0 Sakit, 0 Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		where a.abnormal not in('Absence','Normal') --(a.abnormal <> 'Absence' and a.abnormal <> 'Normal')
		and RTRIM(LTRIM(SUBSTRING(a.abnormal, 1, CHARINDEX(';', a.abnormal, 0) - 1))) <> ''
		and (tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)
		group by a.nik
		union
		select a.nik,0 as Telat, 0 as PulangCepat , count(a.abnormal) Hadir,0 Sakit, 0 Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		where --a.abnormal = 'Normal' and
		(a.tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)	
		group by a.nik
		union
		select a.nik,0 as Telat, 0 as PulangCepat , 0 Hadir, 0 Sakit, 0 Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		union
		select a.nik,0 as Telat, 0 as PulangCepat , 0 Hadir, 0 Sakit, 0 Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		union
		select a.nik,0 as Telat, 0 as PulangCepat , 0 Hadir, 0 Sakit, 0 Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		union
		select a.nik,0 as Telat, 0 as PulangCepat , 0 Hadir, 0 Sakit, 0 Cuti, 0 Ijin, 0 Alpha
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.nik = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
	)t1
	inner join  HR_PEGAWAI a on a.nik = t1.nik
	group by t1.nik,a.nama       
	end
	

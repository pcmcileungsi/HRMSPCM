create procedure [dbo].[SP_HR_ABSENSI_REKAP_GETROWS] --'2017-07-21','2017-08-20','1'
	(
	  @p_TANGGAL_ABSEN1	varchar(10),
	  @p_TANGGAL_ABSEN2	varchar(10),
	  @p_KODE_UNIT_KERJA varchar(5)	 
	) 
	as
	begin
		
	select kode_pegawai, a.NAMA, sum(Telat)as Telat, sum(PulangCepat) as PulangCepat,sum(Hadir) as Hadir from
	(
		select a.kode_pegawai,count( RTRIM(LTRIM(SUBSTRING(a.abnormal, CHARINDEX(';', a.abnormal, 0) + LEN(';'), LEN(a.abnormal))))) Telat, 0 as PulangCepat, 0 as Hadir 
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.kode_pegawai = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		where (a.abnormal <> 'Absence' or a.abnormal <> 'Normal') 
		and RTRIM(LTRIM(SUBSTRING(a.abnormal, CHARINDEX(';', a.abnormal, 0) + LEN(';'), LEN(a.abnormal)))) <> ''
		and (a.tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)		
		group by a.kode_pegawai
		union
		select a.kode_pegawai,0 as Telat, count( RTRIM(LTRIM(SUBSTRING(a.abnormal, 1, CHARINDEX(';', a.abnormal, 0) - 1)))) PulangCepat , 0 as Hadir 
		from HR_ABSENSI a
		inner join hr_pegawai b on a.kode_pegawai = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		where (a.abnormal <> 'Absence' and a.abnormal <> 'Normal')
		and RTRIM(LTRIM(SUBSTRING(a.abnormal, 1, CHARINDEX(';', a.abnormal, 0) - 1))) <> ''
		and (tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN1)
		group by a.kode_pegawai
		union
		select a.kode_pegawai,0 as Telat, 0 as PulangCepat , count(a.abnormal) Hadir
		from HR_ABSENSI a 
		inner join hr_pegawai b on a.kode_pegawai = b.nik
		inner join mst_unit_kerja c on c.kode = b.kode_unit_kerja
		where a.abnormal = 'Normal'
		and (a.tanggal_absen between @p_TANGGAL_ABSEN1 and @p_TANGGAL_ABSEN2)	
		group by a.kode_pegawai
	)t1
	inner join  HR_PEGAWAI a on a.nik = t1.KODE_PEGAWAI
	group by t1.kode_pegawai,a.nama       
	end
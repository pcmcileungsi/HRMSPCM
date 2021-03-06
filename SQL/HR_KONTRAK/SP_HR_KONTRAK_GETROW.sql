USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_HR_KONTRAK_GETROW]    Script Date: 08/16/2017 20:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_HR_KONTRAK_GETROW]
	(
	  @p_ID		int
	) 
	as
	begin
		select	a.ID,
				a.KODE,
				a.DESKRIPSI,
				a.TANGGAL_MULAI_KONTRAK,
			    a.TANGGAL_AKHIR_KONTRAK,
				f.NIK,
				f.NAMA as NAMA_PEGAWAI,
			    a.KODE_UNIT_KERJA,	
			    b.nama as UNIT_KERJA,
			    a.KODE_POSISI,
			    c.deskripsi as POSISI,
			    a.KODE_MST_JABATAN,
			    e.deskripsi as JABATAN,
			    a.STATUS_PEGAWAI,
			    a.is_cuti,
			    a.is_shift,
			    a.DOKUMEN_NAME,
			    a.DOKUMEN_PATH	
		from	HR_KONTRAK a
		inner join MST_UNIT_KERJA b on b.kode = a.kode_unit_kerja
		inner join reff_posisi c on c.kode = a.kode_posisi
		inner join mst_jabatan d on d.kode = a.kode_mst_jabatan
		inner join reff_jenis_jabatan e on e.kode = d.kode_jabatan
		inner join HR_PEGAWAI f on f.nik = a.nik
		where	a.ID	= @p_ID
	end
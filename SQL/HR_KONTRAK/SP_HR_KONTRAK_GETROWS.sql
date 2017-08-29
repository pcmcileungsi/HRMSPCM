USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_HR_KONTRAK_GETROWS]    Script Date: 08/16/2017 20:33:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_HR_KONTRAK_GETROWS]
	(
	  @p_keywords	nvarchar(5)	 
	) 
	as
	begin
		select	ROW_NUMBER() OVER(ORDER BY (SELECT 0), f.nama,a.ID) AS NO,
		        a.ID,
				a.KODE,
				a.kode_mst_jabatan,
				f.NAMA as NAMA_PEGAWAI,
				a.TANGGAL_MULAI_KONTRAK,
			    a.TANGGAL_AKHIR_KONTRAK,
			    b.nama as UNIT_KERJA,
			    c.deskripsi as POSISI,
			    e.deskripsi as JABATAN,
			    a.DOKUMEN_NAME				
		from	HR_KONTRAK a
		inner join MST_UNIT_KERJA b on b.kode = a.kode_unit_kerja
		inner join reff_posisi c on c.kode = a.kode_posisi
		inner join mst_jabatan d on d.kode = a.kode_mst_jabatan
		inner join reff_jenis_jabatan e on e.kode = d.kode_jabatan
		inner join HR_PEGAWAI f on f.nik = a.KODE_PEGAWAI
		where	f.NAMA	 like '%' + @p_keywords + '%'		
	end
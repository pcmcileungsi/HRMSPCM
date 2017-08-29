USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_GAPOK_GETROW]    Script Date: 08/08/2017 21:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_MST_GAPOK_GETROW]
	(
	  @p_ID		int
	) 
	as
	begin
		select	a.ID,
		        a.KODE,
		        a.KODE_JENJANG_PENDIDIKAN,
		        a.KODE_JENIS_GOLONGAN,
		        a.KODE_MASA_KERJA,
		        a.KODE_STATUS_PEGAWAI,
		        CAST(a.NOMINAL AS VARCHAR(20)) AS NOMINAL,
		        a.TAHUN,
		        a.STATUS,		        	        
		        b.DESKRIPSI as DESKRIPSI_PENDIDIKAN,
		        c.DESKRIPSI as DESKRIPSI_GOLONGAN,
				d.DESKRIPSI as DESKRIPSI_MASAKERJA,
				e.DESKRIPSI as DESKRIPSI_STATUSPEGAWAI
		from	MST_GAPOK a
		inner join REFF_JENJANG_PENDIDIKAN b on a.kode_jenjang_pendidikan = b.kode
		inner join REFF_JENIS_GOLONGAN c on a.kode_jenis_golongan = c.kode
		inner join REFF_MASA_KERJA d on a.kode_masa_kerja = d.kode
		inner join REFF_STATUS_PEGAWAI e on  a.kode_status_pegawai = e.kode
		where	a.ID	= @p_ID
	end
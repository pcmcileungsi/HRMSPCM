IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[HR_PEGAWAI]') AND type in (N'U'))
BEGIN
		DROP TABLE [dbo].[HR_PEGAWAI]
END

CREATE TABLE [dbo].[HR_PEGAWAI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NIK] [varchar](20) NULL,
	[NAMA] [varchar](100) NULL,
	[NAMA_PANGGILAN] [varchar](20) NULL,
	[NO_KTP] [varchar](20) NULL,
	[NO_PASSPORT] [varchar](20) NULL,
	[NO_NPWP] [varchar](20) NULL,
	[NO_SIM] [varchar](20) NULL,
	[JENIS_SIM] [tinyint] NULL,
	[JENIS_KELAMIN] [bit] NULL,
	[KENDARAAN] [tinyint] NULL,
	[TEMPAT_LAHIR] [varchar](50) NULL,
	[TANGGAL_LAHIR] [date] NULL,
	[KODE_AGAMA] [nvarchar] (5) NULL,
	[STATUS_KAWIN] [tinyint] NULL,
	[PENDIDIKAN_TERAKHIR] [nvarchar] (5) NULL,
	[ALAMAT_KTP] [varchar](200) NULL,
	[ALAMAT_SEKARANG] [varchar](200) NULL,
	[STATUS_RUMAH] [tinyint] NULL,
	[TELP] [varchar](20) NULL,
	[HP1] [varchar](20) NULL,
	[HP2] [varchar](20) NULL,
	[EMAIL] [varchar](50) NULL,
	[SIAP_LEMBUR] [bit] NULL,
	[SIAP_LUAR_KOTA] [bit] NULL,
	[DARURAT_NAMA] [varchar](50) NULL,
	[DARURAT_ALAMAT] [varchar](100) NULL,
	[DARURAT_TELP] [varchar](50) NULL,
	[DARURAT_HUBUNGAN] [varchar](50) NULL,
	[BAJU] [varchar](10) NULL,
	[CELANA] [varchar](10) NULL,
	[SEPATU] [varchar](10) NULL,
	[TOPI] [varchar](10) NULL,
	[BARANG_DITITIP] [varchar](200) NULL,
	[BARANG_INVENTARIS] [varchar](200) NULL,
	[PHOTO_PATH] [varchar](150) NULL,
	[PHOTO_NAME] [varchar](50) NULL,
	[NAMA_AYAH] [varchar](50) NULL,
	[NAMA_IBU] [varchar](50) NULL,
	[TEMPAT_LAHIR_AYAH] [varchar](50) NULL,
	[TEMPAT_LAHIR_IBU] [varchar](50) NULL,
	[TANGGAL_LAHIR_AYAH] [date] NULL,
	[TANGGAL_LAHIR_IBU] [date] NULL,
	[PENDIDIKAN_AYAH] [nvarchar] (5) NULL,
	[PENDIDIKAN_IBU] [nvarchar] (5) NULL,
	[PEKERJAAN_AYAH] [nvarchar] (5) NULL,
	[PEKERJAAN_IBU] [nvarchar] (5) NULL,
	[NAMA_BANK] [varchar](50) NULL,
	[NO_REKENING] [varchar](50) NULL,
	[NAMA_ASURANSI] [varchar](50) NULL,
	[NO_ASURANSI] [varchar](50) NULL,
	[KODE_JABATAN1] [nvarchar](5) NULL,
	[KODE_JABATAN2] [nvarchar](5) NULL,
	[KODE_JABATAN3] [nvarchar](5) NULL,
	[KODE_UNIT_KERJA] [nvarchar] (5) NULL,
	[KODE_POSISI] [nvarchar] (5) NULL,
	[STATUS_PEGAWAI] [varchar](1) NULL,
	[TANGGAL_MULAI_KERJA] [date] NULL,
	[TANGGAL_PENSIUN] [date] NULL,
 CONSTRAINT [PK_HR_PEGAWAI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



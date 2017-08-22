CREATE TABLE [dbo].[MST_TUNJANGAN_JABATAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KODE] [nvarchar](10) NOT NULL,
	[KODE_JENIS_TUNJANGAN] [nvarchar](5) NULL,
	[KODE_MASTER_JABATAN] [nvarchar](10) NULL,
	[NOMINAL] [numeric](18, 2) NULL,
	[TAHUN] [nvarchar](4) NULL,
	[STATUS] [nvarchar](1) NULL,
	[CRE_DATE] [datetime] NOT NULL,
	[CRE_BY] [nvarchar](15) NOT NULL,
	[CRE_IP_ADDRESS] [nvarchar](15) NOT NULL,
	[MOD_DATE] [datetime] NOT NULL,
	[MOD_BY] [nvarchar](15) NOT NULL,
	[MOD_IP_ADDRESS] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_MST_TUNJANGAN_JABATAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


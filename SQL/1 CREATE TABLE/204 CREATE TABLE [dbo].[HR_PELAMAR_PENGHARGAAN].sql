CREATE TABLE [dbo].[HR_PELAMAR_PENGHARGAAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KODE_PELAMAR] [varchar](20) NULL,
	[NAMA] [varchar](50) NULL,
	[LEMBAGA] [varchar](50) NULL,	
	[TANGGAL] [date] NULL,
	[SERTIFIKAT] [bit] NULL,
	[ATTACH_PATH] [varchar](100) NULL,
	[ATTACH_NAME] [varchar](50) NULL,
	[CRE_DATE] [datetime] NOT NULL,
	[CRE_BY] [nvarchar](15) NOT NULL,
	[CRE_IP_ADDRESS] [nvarchar](15) NOT NULL,
	[MOD_DATE] [datetime] NOT NULL,
	[MOD_BY] [nvarchar](15) NOT NULL,
	[MOD_IP_ADDRESS] [nvarchar](15) NOT NULL,	
 CONSTRAINT [PK_HR_PELAMAR_PENGHARGAAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
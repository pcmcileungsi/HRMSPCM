CREATE TABLE [dbo].[HR_PELAMAR_KETERAMPILAN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KODE_PELAMAR] [varchar](20) NULL,
	[DESKRIPSI] [varchar](50) NULL,
	[SERTIFIKAT] [bit] NULL,
	[ATTACH_PATH] [varchar](100) NULL,
	[ATTACH_NAME] [varchar](50) NULL,
	[CRE_DATE] [datetime] NOT NULL,
	[CRE_BY] [nvarchar](15) NOT NULL,
	[CRE_IP_ADDRESS] [nvarchar](15) NOT NULL,
	[MOD_DATE] [datetime] NOT NULL,
	[MOD_BY] [nvarchar](15) NOT NULL,
	[MOD_IP_ADDRESS] [nvarchar](15) NOT NULL,	
 CONSTRAINT [PK_HR_PELAMAR_KETERAMPILAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
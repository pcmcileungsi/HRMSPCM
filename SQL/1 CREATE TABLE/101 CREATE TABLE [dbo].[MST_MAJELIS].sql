CREATE TABLE [dbo].[MST_MAJELIS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KODE] [nvarchar](5) NOT NULL,
	[NAMA] [nvarchar](100) NULL,
	[ALAMAT] [nvarchar](200) NULL,
	[TELP] [nvarchar](20) NULL,
	[FAX] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[KA_UNIT] [nvarchar](100) NULL,
	[GROUP] [nvarchar](1) NULL,
	[CRE_DATE] [datetime] NOT NULL,
	[CRE_BY] [nvarchar](15) NOT NULL,
	[CRE_IP_ADDRESS] [nvarchar](15) NOT NULL,
	[MOD_DATE] [datetime] NOT NULL,
	[MOD_BY] [nvarchar](15) NOT NULL,
	[MOD_IP_ADDRESS] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_MST_MAJELIS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



IF  EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[REFF_MASA_KERJA]') AND type in (N'U'))
BEGIN
		DROP TABLE [dbo].[REFF_MASA_KERJA]
END

CREATE TABLE [dbo].[REFF_MASA_KERJA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KODE] [nvarchar](5) NOT NULL,
	[DESKRIPSI] [nvarchar](100) NULL,
	[CRE_DATE] [datetime] NOT NULL,
	[CRE_BY] [nvarchar](15) NOT NULL,
	[CRE_IP_ADDRESS] [nvarchar](15) NOT NULL,
	[MOD_DATE] [datetime] NOT NULL,
	[MOD_BY] [nvarchar](15) NOT NULL,
	[MOD_IP_ADDRESS] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_REFF_MASA_KERJA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--SELECT * FROM REFF_MASA_KERJA
INSERT INTO REFF_MASA_KERJA
			(KODE,	DESKRIPSI,			CRE_DATE,		CRE_BY,			CRE_IP_ADDRESS,		MOD_DATE,		MOD_BY,			MOD_IP_ADDRESS)
SELECT		1,		'1 s/d 4 Tahun',	GETDATE(),		'Anas',			'192.127.0.1',		GETDATE(),		'Anas',			'192.127.0.1' UNION
SELECT		2,		'5 s/d 8 Tahun',	GETDATE(),		'Anas',			'192.127.0.1',		GETDATE(),		'Anas',			'192.127.0.1' UNION
SELECT		3,		'9 s/d 12 Tahun',	GETDATE(),		'Anas',			'192.127.0.1',		GETDATE(),		'Anas',			'192.127.0.1' UNION
SELECT		4,		'13 s/d 16 Tahun',	GETDATE(),		'Anas',			'192.127.0.1',		GETDATE(),		'Anas',			'192.127.0.1' UNION
SELECT		5,		'17 s/d 20 Tahun',	GETDATE(),		'Anas',			'192.127.0.1',		GETDATE(),		'Anas',			'192.127.0.1' UNION
SELECT		6,		'21 s/d 24 Tahun',	GETDATE(),		'Anas',			'192.127.0.1',		GETDATE(),		'Anas',			'192.127.0.1' UNION
SELECT		7,		'25 s/d 28 Tahun',	GETDATE(),		'Anas',			'192.127.0.1',		GETDATE(),		'Anas',			'192.127.0.1' UNION
SELECT		8,		'29 s/d 32 Tahun',	GETDATE(),		'Anas',			'192.127.0.1',		GETDATE(),		'Anas',			'192.127.0.1' 

USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_CUTI_INSERT]    Script Date: 08/08/2017 21:10:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_MST_CUTI_INSERT]
(
	 @p_ID		int output
	,@p_KODE			nvarchar(10)	
	,@p_NAMA			nvarchar(100)
	,@p_JML_HARI			tinyint
	,@p_cre_date			datetime
	,@p_cre_by				nvarchar(15)
	,@p_cre_ip_address		nvarchar(15)
	,@p_mod_date			datetime
	,@p_mod_by				nvarchar(15)
	,@p_mod_ip_address		nvarchar(15)
) as
begin

	insert into MST_CUTI
	(
		KODE,		
		NAMA,
		JML_HARI,				
		cre_date,
		cre_by,
		cre_ip_address,
		mod_date,
		mod_by,
		mod_ip_address
	)
	values
	(
		@p_KODE,		
		@p_NAMA,
		@p_JML_HARI,				
		@p_cre_date,
		@p_cre_by,
		@p_cre_ip_address,
		@p_mod_date,
		@p_mod_by,
		@p_mod_ip_address
	)
	set @p_ID =  @@identity
end

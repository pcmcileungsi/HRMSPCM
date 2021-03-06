USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[sp_sys_company_getrows]    Script Date: 08/08/2017 20:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_sys_company_getrows]
	(
		@p_keywords nvarchar(50)
	)as
	begin

		select	C_CODE,
				C_NAME,
				C_ADDRESS1,				
				SYS_COMPANYID
		from	sys_company
		where	SANDI		LIKE	'%' + @p_keywords + '%'
		or		C_NAME		LIKE	'%' + @p_keywords + '%'
		or		C_NPWP		LIKE	'%' + @p_keywords + '%'
		or		C_CODE		LIKE	'%' + @p_keywords + '%'
	end	

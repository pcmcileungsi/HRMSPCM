USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_HR_SHIFT_INSERT]    Script Date: 08/08/2017 21:10:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_HR_SHIFT_INSERT]
(
	          @p_NIK		varchar(20) 
			,@p_KODE_UNIT_KERJA			nvarchar(5)
			,@p_TANGGAL_SHIFT			date
			,@p_KODE_REFF_SHIFT		nvarchar(5)
			,@p_STATUS_SHIFT		nvarchar(1)	
			,@p_cre_date			datetime
			,@p_cre_by				nvarchar(15)
			,@p_cre_ip_address		nvarchar(15)
			,@p_mod_date			datetime
			,@p_mod_by				nvarchar(15)
			,@p_mod_ip_address		nvarchar(15)
) as
begin

	insert into HR_SHIFT
	(
		NIK,
		KODE_UNIT_KERJA,
		KODE_REFF_SHIFT,
		TANGGAL_SHIFT,	
        STATUS_SHIFT,		
		cre_date,
		cre_by,
		cre_ip_address,
		mod_date,
		mod_by,
		mod_ip_address
	)
	values
	(
		@p_NIK,
		@p_KODE_UNIT_KERJA,
		@p_KODE_REFF_SHIFT,	
		@p_TANGGAL_SHIFT,		
        @p_STATUS_SHIFT,		
		@p_cre_date,
		@p_cre_by,
		@p_cre_ip_address,
		@p_mod_date,
		@p_mod_by,
		@p_mod_ip_address
	)	
end

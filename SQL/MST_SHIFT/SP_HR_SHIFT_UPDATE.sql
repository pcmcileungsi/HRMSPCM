USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_HR_SHIFT_UPDATE]    Script Date: 08/08/2017 21:14:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[SP_HR_SHIFT_UPDATE] 
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
		update	HR_SHIFT
		set		KODE_REFF_SHIFT		= @p_KODE_REFF_SHIFT,							
				mod_date			= @p_mod_date,
				mod_by				= @p_mod_by,
				mod_ip_address		= @p_mod_ip_address
		where	NIK		= @p_NIK and
		        KODE_UNIT_KERJA = @p_KODE_UNIT_KERJA and
				TANGGAL_SHIFT = @p_TANGGAL_SHIFT and
				STATUS_SHIFT = @p_STATUS_SHIFT
				
	end
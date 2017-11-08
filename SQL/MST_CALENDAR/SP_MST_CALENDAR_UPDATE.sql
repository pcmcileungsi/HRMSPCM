USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_CALENDAR_UPDATE]    Script Date: 08/07/2017 20:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[SP_MST_CALENDAR_UPDATE]
	(
		 @p_working_Day			varchar(1)	
		,@p_date			    varchar(10)		
		,@p_cre_date			datetime
		,@p_cre_by				nvarchar(15)
		,@p_cre_ip_address		nvarchar(15)
		,@p_mod_date			datetime
		,@p_mod_by				nvarchar(15)
		,@p_mod_ip_address		nvarchar(15)
	) as
	begin
		update	MST_CALENDAR
		set		WORKING_DAY			= @p_working_Day,										
				mod_date			= @p_mod_date,
				mod_by				= @p_mod_by,
				mod_ip_address		= @p_mod_ip_address
		where	DATE= @p_date
	end
create procedure [dbo].[SP_HR_ABSENSI_REKAP_UPDATE] --''
	(
	  @p_id	integer,
	  @p_masuk	varchar(5),
	  @p_pulang	varchar(5)	 
	) 
	as
	begin
	    update HR_absensi 
	    set 
	        attend_time = @p_masuk, 
	        leave_time = @p_pulang
	    where id = @p_id		
	end
	
	
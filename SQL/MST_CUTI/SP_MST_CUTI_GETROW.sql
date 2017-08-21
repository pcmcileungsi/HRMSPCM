create procedure [dbo].[SP_MST_CUTI_GETROW]
	(
	  @p_ID		int
	) 
	as
	begin
		select	a.*
		from	MST_CUTI a
	    where	a.ID	= @p_ID
	end
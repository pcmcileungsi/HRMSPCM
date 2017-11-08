create procedure [dbo].[SP_MST_CALENDAR_INSERT] --'2017'
	(
	     @Year	varchar(4)
		,@p_cre_date			datetime
		,@p_cre_by				nvarchar(15)
		,@p_cre_ip_address		nvarchar(15)
		,@p_mod_date			datetime
		,@p_mod_by				nvarchar(15)
		,@p_mod_ip_address		nvarchar(15)
	  	 
	) 
	as
begin

		DECLARE @@Wk varchar(1), @@Start datetime, @@End datetime;		
		SET @@Start =convert(date,@Year+'-01-01');
		SET @@End =convert(date,@Year+'-12-31');
		WHILE @@Start<=@@End
		begin
		if datepart(dw,@@Start)=1 or datepart(dw,@@Start)=7
		begin
			SET @@Wk='0';
		end
		else
		begin 
			SET @@Wk='1';
		end

			INSERT INTO MST_CALENDAR 
			values 
			(
				@@Start,
				@@Wk,
				@p_cre_date,
				@p_cre_by,
				@p_cre_ip_address,
				@p_mod_date,
				@p_mod_by,
				@p_mod_ip_address
			)
			
		  set @@Start=DATEADD(day,1,@@Start);
end

END



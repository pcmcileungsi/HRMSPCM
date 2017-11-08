CREATE procedure [dbo].[SP_MST_CALENDAR_GETROWS] --''
	(
	  @p_keywords	varchar(4)	 
	) 
	as
begin
	SELECT 	CONVERT(VARCHAR(10), DATE, 121) AS DATE,	
			WORKING_DAY 	
	FROM MST_CALENDAR
	WHERE YEAR(DATE) = @p_keywords AND WORKING_DAY = '1'
end



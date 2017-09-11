USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_HR_SHIFT_GETROWS]    Script Date: 08/08/2017 21:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_HR_SHIFT_GETROWS] --'2010','02'
	(
	  @p_Year	           varchar(4),
	  @p_Month	           varchar(2),
	  @p_KODE_UNIT_KERJA   nvarchar(5),
	  @p_STATUS_SHIFT      varchar(1)
	) 
	as
	begin
	
	DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
	DECLARE @ColumnName AS NVARCHAR(MAX)

	--Get distinct values of the PIVOT Column
	select distinct RIGHT(cast(TANGGAL_SHIFT as varchar(10)),2) AS TGL
	into #tmp			            	
	from HR_SHIFT
	where  substring(cast(TANGGAL_SHIFT as varchar(10)),1,7) = @p_Year + '-' + @p_Month 
	       and KODE_UNIT_KERJA = @p_KODE_UNIT_KERJA
	       and STATUS_SHIFT = @p_STATUS_SHIFT
	--order by TANGGAL_SHIFT
		 
	SELECT @ColumnName= ISNULL(@ColumnName + ',','') + QUOTENAME(TGL)
	FROM (
	    select  * from #tmp
	) AS TGLs
		
	if @ColumnName is null
	    set @ColumnName = '[01],[02],[03]'   
 
	--Prepare the PIVOT query using the dynamic 
	SET @DynamicPivotQuery = 
	  N'	
        select * from (
		  select  a.NIK,
		          b.NAMA,
		          cast(a.KODE_REFF_SHIFT as decimal) KODE_REFF_SHIFT, 		       	      		       
		          RIGHT(cast(a.TANGGAL_SHIFT as varchar(10)),2) AS TGL            			            	
          from HR_SHIFT a 
          inner join hr_pegawai b on a.nik = b.nik
          where  substring(cast(a.TANGGAL_SHIFT as varchar(10)),1,7) = ''' + @p_Year + '-' + @p_Month + ''' 
                 and a.KODE_UNIT_KERJA = ''' + @p_KODE_UNIT_KERJA	+ '''
                 and a.STATUS_SHIFT = ''' + @p_STATUS_SHIFT	+ '''                  
		)T1     
		PIVOT 
		(
			sum(KODE_REFF_SHIFT)
			for tgl in (' + @ColumnName + ')
		)T2'
	--Execute the Dynamic Pivot Query
	EXEC sp_executesql @DynamicPivotQuery
	
	
	
	end
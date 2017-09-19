USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_HR_SHIFT_GETROWS]    Script Date: 08/08/2017 21:07:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_HR_SHIFT_GETROWS] --'2017','01','1','1'
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
	    set @ColumnName = '[01]'   
 
	--Prepare the PIVOT query using the dynamic 
	SET @DynamicPivotQuery = 
	  N'	
        select * from (
		  select  a.NIK,
		          a.NAMA,
		          cast(b.KODE_REFF_SHIFT as decimal) KODE_REFF_SHIFT, 		       	      		       
		          RIGHT(cast(b.TANGGAL_SHIFT as varchar(10)),2) AS TGL            			            	
          from hr_pegawai a 
          inner join mst_unit_kerja c on c.kode = a.kode_unit_kerja
          left join HR_SHIFT b on a.nik = b.nik
          where  (
                   substring(cast(b.TANGGAL_SHIFT as varchar(10)),1,7) = ''' + @p_Year + '-' + @p_Month + ''' 
                   or 
                   substring(cast(b.TANGGAL_SHIFT as varchar(10)),1,7) is null
                 )
                 and 
                 (
                    b.STATUS_SHIFT = ''' + @p_STATUS_SHIFT	+ ''' 					
                    or 
                    b.STATUS_SHIFT is null
                 )
                 and
                    a.KODE_UNIT_KERJA = ''' + @p_KODE_UNIT_KERJA	+ '''                 
		)T1     
		PIVOT 
		(
			sum(KODE_REFF_SHIFT)
			for tgl in (' + @ColumnName + ')
		)T2'
	--Execute the Dynamic Pivot Query
	EXEC sp_executesql @DynamicPivotQuery
	

	
	end
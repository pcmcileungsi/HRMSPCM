USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_HR_KONTRAK_GETROWS]    Script Date: 08/16/2017 20:33:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_HR_PEGAWAI_GETROWS]
	(
	  @p_keywords	nvarchar(5)	 
	) 
	as
	begin
		select a.NIK,
		       a.NAMA											
		from	HR_PEGAWAI a		
		where	a.NAMA	 like '%' + @p_keywords + '%'		
	end
USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_SHIFT_GETROW]    Script Date: 08/08/2017 21:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_MST_SHIFT_GETROW]
	(
	  @p_ID		int
	) 
	as
	begin
		select	ID,
		        KODE,
		        DESKRIPSI,
		        convert(varchar(5),START_TIME,21) START_TIME,
		        convert(varchar(5),END_TIME,21) END_TIME
		from	REFF_JENIS_SHIFT 
		where	ID	= @p_ID
	end
create procedure [dbo].[SP_HR_ABSENSI_INSERT_CEK]
(
     @p_ID int output,
     @p_NIK varchar(10),
     @p_TANGGAL_ABSEN varchar(10)	
) as
begin

	if not exists (select 1 from HR_ABSENSI where NIK = @p_NIK and TANGGAL_ABSEN = @p_TANGGAL_ABSEN)
		set @p_ID = 0
	else
		set @p_ID = 1
	
end

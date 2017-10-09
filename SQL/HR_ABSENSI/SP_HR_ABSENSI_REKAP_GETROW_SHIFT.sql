CREATE procedure [dbo].[SP_HR_ABSENSI_REKAP_GETROW_SHIFT] --''
	(
	  @p_nik	nvarchar(15)	 
	) 
	as
	begin
		select a.is_shift from hr_kontrak a
		inner join HR_PEGAWAI b on a.nik = b.nik
		where a.nik = @p_nik
	end
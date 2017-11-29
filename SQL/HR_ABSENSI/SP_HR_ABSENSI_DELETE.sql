CREATE procedure [dbo].[SP_HR_ABSENSI_DELETE]
(
     @p_NIK         		varchar(20)
	,@p_TANGGAL_ABSEN		date
		
) as
begin

	begin try
		begin tran		
		
		   DELETE HR_ABSENSI WHERE NIK = @p_NIK AND TANGGAL_ABSEN = @p_TANGGAL_ABSEN  		 
				
		commit tran
	end try
	begin catch
		rollback tran
	end catch
	
	
	
end

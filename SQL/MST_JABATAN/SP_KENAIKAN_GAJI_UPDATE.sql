USE [HRMSPCM]
GO
/****** Object:  StoredProcedure [dbo].[SP_KENAIKAN_GAJI_UPDATE]    Script Date: 08/07/2017 20:54:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create procedure [dbo].[SP_KENAIKAN_GAJI_UPDATE]
	(
		     @p_PERSEN		varchar(4)
			,@p_RUPIAH		varchar(20)		
			,@p_TAHUN		varchar(4)
			,@p_cre_date			datetime
			,@p_cre_by				nvarchar(15)
			,@p_cre_ip_address		nvarchar(15)
			,@p_mod_date			datetime
			,@p_mod_by				nvarchar(15)
			,@p_mod_ip_address		nvarchar(15)
	) as
	begin try	
		
		if (@p_PERSEN = '0')
		begin
		    begin tran
			update	MST_TUNJANGAN
		    set		NOMINAL		        = cast(@p_RUPIAH as decimal(18,2)) + NOMINAL,							
				    mod_date			= @p_mod_date,
				    mod_by				= @p_mod_by,
				    mod_ip_address		= @p_mod_ip_address	
			where TAHUN = @p_TAHUN		
            
            update	MST_GAPOK
		    set		NOMINAL			    = cast(@p_RUPIAH as decimal(18,2)) + NOMINAL,							
				    mod_date			= @p_mod_date,
				    mod_by				= @p_mod_by,
				    mod_ip_address		= @p_mod_ip_address	
			where TAHUN = @p_TAHUN
	        commit tran				
		end
		else
		begin
		    begin tran
			update	MST_TUNJANGAN
		    set		NOMINAL		        = ((cast(@p_PERSEN as decimal(18,2)) * NOMINAL)/100) + NOMINAL,							
				    mod_date			= @p_mod_date,
				    mod_by				= @p_mod_by,
				    mod_ip_address		= @p_mod_ip_address	
			where TAHUN = @p_TAHUN		
            
            update	MST_GAPOK
		    set		NOMINAL			    = ((cast(@p_PERSEN as decimal(18,2)) * NOMINAL)/100) + NOMINAL,								
				    mod_date			= @p_mod_date,
				    mod_by				= @p_mod_by,
				    mod_ip_address		= @p_mod_ip_address	
            where TAHUN = @p_TAHUN	
            commit tran					
		end		
		
	end try
begin catch
	rollback tran
end catch
	

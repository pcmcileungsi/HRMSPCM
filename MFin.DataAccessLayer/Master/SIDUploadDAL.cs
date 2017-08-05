using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class SIDUploadDAL
    {
        public void InsertTempDIN(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_t_din_insert", parameters))
            {
                throw new Exception("Fail to execute sp_temp_t_din_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteTempDIN(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_t_din_delete", parameters))
            {
                throw new Exception("Fail to execute sp_temp_t_din_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertTempDebiturFasilitas(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_r_debitur_fasilitas_insert", parameters))
            {
                throw new Exception("Fail to execute sp_temp_r_debitur_fasilitas_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteTempDebiturFasilitas(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_r_debitur_fasilitas_delete", parameters))
            {
                throw new Exception("Fail to execute sp_temp_r_debitur_fasilitas_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertTempAgunan(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_t_agunan_insert", parameters))
            {
                throw new Exception("Fail to execute sp_temp_t_agunan_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteTempAgunan(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_t_agunan_delete", parameters))
            {
                throw new Exception("Fail to execute sp_temp_t_agunan_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertTempDebitur(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_t_debitur_insert", parameters))
            {
                throw new Exception("Fail to execute sp_temp_t_debitur_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteTempDebitur(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_t_debitur_delete", parameters))
            {
                throw new Exception("Fail to execute sp_temp_t_debitur_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertTempKredit(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_t_kredit_insert", parameters))
            {
                throw new Exception("Fail to execute sp_temp_t_kredit_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteTempKredit(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_t_kredit_delete", parameters))
            {
                throw new Exception("Fail to execute sp_temp_t_kredit_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertTempPengurus(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_t_pengurus_insert", parameters))
            {
                throw new Exception("Fail to execute sp_temp_t_pengurus_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteTempPengurus(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_temp_t_pengurus_delete", parameters))
            {
                throw new Exception("Fail to execute sp_temp_t_pengurus_delete", new Exception(dbw.DBErrorMessage));
            }
        }
    }
}

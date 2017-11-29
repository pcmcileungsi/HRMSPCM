using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class HR_CUTI_KUOTA_DAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_CUTI_KUOTA_INSERT", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute SP_HR_CUTI_KUOTA_INSERT", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_CUTI_KUOTA_UPDATE", parameters))
            {
                throw new Exception("Fail to execute SP_HR_CUTI_KUOTA_UPDATE", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_CUTI_KUOTA_DELETE", parameters))
            {
                throw new Exception("Fail to execute SP_HR_CUTI_KUOTA_DELETE", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_CUTI_KUOTA_GETROWS", parameters, ds))
            {
                throw new Exception("Fail to execute SP_HR_CUTI_KUOTA_GETROWS", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_HR_CUTI_KUOTA_GETROWS. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_CUTI_KUOTA_GETROW", parameters, ds))
            {
                throw new Exception("Fail to execute SP_HR_CUTI_KUOTA_GETROW", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_HR_CUTI_KUOTA_GETROW. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsTahun(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_CUTI_KUOTA_GETROWS_TAHUN", parameters, ds))
            {
                throw new Exception("Fail to execute SP_HR_CUTI_KUOTA_GETROWS_TAHUN", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_HR_CUTI_KUOTA_GETROWS_TAHUN. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsTempBalanceDataExcel(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("xsp_Temp_HR_CUTI_KUOTA_getrows_Upload", parameters, ds))
            {
                throw new Exception("Fail to execute xsp_Temp_HR_CUTI_KUOTA_getrows_Upload", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to xsp_Temp_HR_CUTI_KUOTA_getrows_Upload. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsBalanceByEmployee(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_HR_CUTI_KUOTA_getrow_by_Employee", parameters, ds))
            {
                throw new Exception("Fail to execute sp_HR_CUTI_KUOTA_getrow_by_Employee", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_HR_CUTI_KUOTA_getrow_by_Employee. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsTempBalanceGrid(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("xsp_Temp_HR_CUTI_KUOTA_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute xsp_Temp_HR_CUTI_KUOTA_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to xsp_Temp_HR_CUTI_KUOTA_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void InsertTempBalance(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("xsp_Temp_HR_CUTI_KUOTA_insert_Upload", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute xsp_Temp_HR_CUTI_KUOTA_insert_Upload", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteTempBalance(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("xsp_Temp_HR_CUTI_KUOTA_Delete", parameters))
            {
                throw new Exception("Fail to execute xsp_Temp_HR_CUTI_KUOTA_Delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public void TempBalanceUploadProcess(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("xsp_Temp_HR_CUTI_KUOTA_upload_process", parameters))
            {
                throw new Exception("Fail to execute xsp_Temp_HR_CUTI_KUOTA_upload_process", new Exception(dbw.DBErrorMessage));
            }
        }
    }
}

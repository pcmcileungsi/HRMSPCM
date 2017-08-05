using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;


namespace MFin.DataAccessLayer.Master
{
    public class SysZIPDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_zip_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_zip_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_zip_update", parameters))
            {
                throw new Exception("Fail to execute sp_sys_zip_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_zip_delete", parameters))
            {
                throw new Exception("Fail to execute sp_sys_zip_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_zip_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_zip_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_zip_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsWithAreaCode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_zip_getrows_withareacode", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_zip_getrows_withareacode", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_zip_getrows_withareacode. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_zip_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_zip_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_zip_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowByClient(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_zip_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_zip_getrow_byclient", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_zip_getrow_byclient. No row found.");
                else
                    return ds.Tables[0];
            }
        }

    }
}

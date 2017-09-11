using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class MST_SHIFT_DAL
    {
        public void InsertHR_Shift(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_SHIFT_INSERT", parameters))
            {
                throw new Exception("Fail to execute SP_HR_SHIFT_INSERT", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateHR_Shift(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_SHIFT_UPDATE", parameters))
            {
                throw new Exception("Fail to execute SP_HR_SHIFT_UPDATE", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateInsertHR_Shift(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_SHIFT_UPDATE_INSERT", parameters))
            {
                throw new Exception("Fail to execute SP_HR_SHIFT_UPDATE_INSERT", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_SHIFT_INSERT", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute SP_MST_SHIFT_INSERT", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_SHIFT_UPDATE", parameters))
            {
                throw new Exception("Fail to execute SP_MST_SHIFT_UPDATE", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_SHIFT_DELETE", parameters))
            {
                throw new Exception("Fail to execute SP_MST_SHIFT_DELETE", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows_HR_SHIFT(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_SHIFT_GETROWS", parameters, ds))
            {
                throw new Exception("Fail to execute SP_HR_SHIFT_GETROWS", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_HR_SHIFT_GETROWS. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_SHIFT_GETROWS", parameters, ds))
            {
                throw new Exception("Fail to execute SP_MST_SHIFT_GETROWS", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_MST_SHIFT_GETROWS. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsKode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_SHIFT_GETROWS_KODE", parameters, ds))
            {
                throw new Exception("Fail to execute SP_MST_SHIFT_GETROWS_KODE", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_MST_SHIFT_GETROWS_KODE. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_SHIFT_GETROW", parameters, ds))
            {
                throw new Exception("Fail to execute SP_MST_SHIFT_GETROW", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_MST_SHIFT_GETROW. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

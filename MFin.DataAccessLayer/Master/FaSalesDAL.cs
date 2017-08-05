using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class FaSalesDAL
    {
        public void Insert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_sales_insert", parameters))
            {
                throw new Exception("Fail to execute sp_fa_sales_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_sales_update", parameters))
            {
                throw new Exception("Fail to execute sp_fa_sales_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_sales_Approve", parameters))
            {
                throw new Exception("Fail to execute sp_fa_sales_Approve", new Exception(dbw.DBErrorMessage));
            }
        }
        public void Reject(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_sales_reject", parameters))
            {
                throw new Exception("Fail to execute sp_fa_sales_reject", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_sales_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_sales_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_sales_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowInit(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_sales_getdata", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_sales_getdata", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_sales_getdata. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_sales_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_sales_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_sales_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

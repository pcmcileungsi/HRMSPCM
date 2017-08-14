using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class MST_TUNJANGAN_DAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_TUNJANGAN_INSERT", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute SP_MST_TUNJANGAN_INSERT", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_TUNJANGAN_UPDATE", parameters))
            {
                throw new Exception("Fail to execute SP_MST_TUNJANGAN_UPDATE", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_TUNJANGAN_DELETE", parameters))
            {
                throw new Exception("Fail to execute SP_MST_TUNJANGAN_DELETE", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_TUNJANGAN_GETROWS", parameters, ds))
            {
                throw new Exception("Fail to execute SP_MST_TUNJANGAN_GETROWS", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_MST_TUNJANGAN_GETROWS. No row found.");
                else
                    return ds.Tables[0];
            }
        }
		
		 public DataTable GetRowsTahun(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_TUNJANGAN_GETROWS_TAHUN", parameters, ds))
            {
                throw new Exception("Fail to execute SP_MST_TUNJANGAN_GETROWS_TAHUN", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_MST_TUNJANGAN_GETROWS_TAHUN. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_TUNJANGAN_GETROW", parameters, ds))
            {
                throw new Exception("Fail to execute SP_MST_TUNJANGAN_GETROW", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_MST_TUNJANGAN_GETROW. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

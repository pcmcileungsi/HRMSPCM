using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class PLAmortDAL
    {
        public void Insert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_pl_amort_insert", parameters))
            {
                throw new Exception("Fail to execute sp_pl_amort_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_pl_amort_update", parameters))
            {
                throw new Exception("Fail to execute sp_pl_amort_update", new Exception(dbw.DBErrorMessage));
            }
        }


        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_pl_amort_delete", parameters))
            {
                throw new Exception("Fail to execute sp_pl_amort_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_pl_amort_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_pl_amort_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_pl_amort_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_pl_amort_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_pl_amort_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_pl_amort_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public object GetRowsNew(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_pl_amort_getrows_new", parameters, ds))
            {
                throw new Exception("Fail to execute sp_pl_amort_getrows_new", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_pl_amort_getrows_new. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowNew(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_pl_amort_getrow_new", parameters, ds))
            {
                throw new Exception("Fail to execute sp_pl_amort_getrow_new", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_pl_amort_getrow_new. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public object GetRowsTerminate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_pl_amort_getrows_terminate", parameters, ds))
            {
                throw new Exception("Fail to execute sp_pl_amort_getrows_terminate", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_pl_amort_getrows_terminate. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public void Terminate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_pl_amort_terminate", parameters))
            {
                throw new Exception("Fail to execute sp_pl_amortterminate", new Exception(dbw.DBErrorMessage));
            }
        }

    }
}

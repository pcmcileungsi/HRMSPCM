using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSinsregisterDAL
    {

        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insregister_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_insregister_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insregister_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_insregister_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insregister_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_insregister_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insregister_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_insregister_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_insregister_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForSearchAtLsInsRegister(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insregister_getrows_for_search_at_lsinsregister", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_insregister_getrows_for_search_at_lsinsregister", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_insregister_getrows_for_search_at_lsinsregister. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForUnexpiredInsurance(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insregister_getrows_unexpired", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_insregister_getrows_unexpired", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_insregister_getrows_unexpired. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForExpiredInsurance(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insregister_getrows_expired", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_insregister_getrows_expired", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_insregister_getrows_expired. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insregister_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_insregister_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_insregister_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

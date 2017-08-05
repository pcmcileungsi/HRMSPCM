using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LsChangeDueDateDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_changeduedate_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_changeduedate_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_changeduedate_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_changeduedate_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateReject(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_changeduedate_update_rejected", parameters))
            {
                throw new Exception("Fail to execute sp_ls_changeduedate_update_rejected", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateApprove(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_changeduedate_update_approve", parameters))
            {
                throw new Exception("Fail to execute sp_ls_changeduedate_update_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_changeduedate_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_changeduedate_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_changeduedate_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_changeduedate_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_changeduedate_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_changeduedate_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_changeduedate_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_changeduedate_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

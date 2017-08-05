using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSAddAppraisalhdDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertRequest(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_insert_request", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_insert_request", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateRequest(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_update_request", parameters))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_update_request", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_addappraisalhd_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsforApplication(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_getrows_asforapplication", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_getrows_asforapplication", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_addappraisalhd_getrows_asforapplication. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_addappraisalhd_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void Copy(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_copy", parameters))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_copy", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_approve", parameters))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void PostRequest(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_post_request", parameters))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_post_request", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateStatus(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_addappraisalhd_update_status", parameters))
            {
                throw new Exception("Fail to execute sp_ls_addappraisalhd_update_status", new Exception(dbw.DBErrorMessage));
            }
        }

    }
}

using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSAppraisalhdDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertRequest(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_insert_request", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_insert_request", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateRequest(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_update_request", parameters))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_update_request", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_appraisalhd_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsforApplication(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_getrows_asforapplication", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_getrows_asforapplication", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_appraisalhd_getrows_asforapplication. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_appraisalhd_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void Copy(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_copy", parameters))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_copy", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_approve", parameters))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void PostRequest(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_post_request", parameters))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_post_request", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateStatus(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_appraisalhd_update_status", parameters))
            {
                throw new Exception("Fail to execute sp_ls_appraisalhd_update_status", new Exception(dbw.DBErrorMessage));
            }
        }

    }
}

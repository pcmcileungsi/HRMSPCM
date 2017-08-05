using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class FCBatchDAL
    {
        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_approve", parameters))
            {
                throw new Exception("Fail to execute sp_fc_batch_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Reject(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_reject", parameters))
            {
                throw new Exception("Fail to execute sp_fc_batch_reject", new Exception(dbw.DBErrorMessage));
            }
        }
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_fc_batch_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_update", parameters))
            {
                throw new Exception("Fail to execute sp_fc_batch_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_delete", parameters))
            {
                throw new Exception("Fail to execute sp_fc_batch_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_batch_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_batch_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsApproved(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_getrows_approvedbatch", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_batch_getrows_approvedbatch", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_batch_getrows_approvedbatch. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsRejected(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_getrows_rejectedbatch", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_batch_getrows_rejectedbatch", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_batch_getrows_rejectedbatch. No row found.");
                else
                    return ds.Tables[0];
            }
        }


        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_batch_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_batch_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsLookUp(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_getrows_lookup", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_batch_getrows_lookup", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_batch_getrows_lookup. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsReport(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_getrows_report", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_batch_getrows_report", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_batch_getrows_report. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForPDC(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_batch_getrows_for_pdc", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_batch_getrows_for_pdc", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_batch_getrows_for_pdc. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

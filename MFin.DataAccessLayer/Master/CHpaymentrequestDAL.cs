using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;


namespace MFin.DataAccessLayer.Master
{
    public class CHpaymentrequestDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_paymentrequest_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ch_paymentrequest_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_paymentrequest_update", parameters))
            {
                throw new Exception("Fail to execute sp_ch_paymentrequest_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_paymentrequest_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ch_paymentrequest_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_paymentrequest_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_paymentrequest_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_paymentrequest_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_paymentrequest_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_paymentrequest_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_paymentrequest_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void Approval(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_paymentrequest_approve", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_paymentrequest_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Reject(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_paymentrequest_reject", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_paymentrequest_reject", new Exception(dbw.DBErrorMessage));
            }
        }


        public DataTable GetRowsApproved(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_paymentrequest_getrows_approved_disb", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_paymentrequest_getrows_approved_disb", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_paymentrequest_getrows_approved_disb. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsPending(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_paymentrequest_getrows_approved_pending_disb", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_paymentrequest_getrows_approved_pending_disb", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_paymentrequest_getrows_approved_pending_disb. No row found.");
                else
                    return ds.Tables[0];
            }
        }


    }
}

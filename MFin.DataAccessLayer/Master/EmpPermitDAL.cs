using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class EmpPermitDAL

    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpPermit_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_EmpPermit_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpPermit_update", parameters))
            {
                throw new Exception("Fail to execute sp_EmpPermit_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpPermit_delete", parameters))
            {
                throw new Exception("Fail to execute sp_EmpPermit_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpPermit_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_EmpPermit_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_EmpPermit_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsApproval(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpPermit_getrows_Approval", parameters, ds))
            {
                throw new Exception("Fail to execute sp_EmpPermit_getrows_Approval", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_EmpPermit_getrows_Approval. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpPermit_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_EmpPermit_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_EmpPermit_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpPermit_approve", parameters))
            {
                throw new Exception("Fail to execute sp_EmpPermit_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Reject(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpPermit_reject", parameters))
            {
                throw new Exception("Fail to execute sp_EmpPermit_reject", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Mail(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_send_email_EmpPermit", parameters))
            {
                throw new Exception("Fail to execute sp_send_email_EmpPermit", new Exception(dbw.DBErrorMessage));
            }
        }
                
    }
}

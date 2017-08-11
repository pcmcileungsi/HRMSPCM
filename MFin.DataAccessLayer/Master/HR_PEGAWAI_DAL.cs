using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class HR_PEGAWAI_DAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_hr_pegawai_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_hr_pegawai_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_hr_pegawai_update", parameters))
            {
                throw new Exception("Fail to execute sp_hr_pegawai_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_hr_pegawai_delete", parameters))
            {
                throw new Exception("Fail to execute sp_hr_pegawai_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_hr_pegawai_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_hr_pegawai_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_hr_pegawai_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForClaim(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpSPD_getrows_forClaim", parameters, ds))
            {
                throw new Exception("Fail to execute sp_EmpSPD_getrows_forClaim", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_EmpSPD_getrows_forClaim. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpSPD_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_EmpSPD_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_EmpSPD_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRpt(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_EmpSPD", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_EmpSPD", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_EmpSPD. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsApproval(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpSPD_getrows_Approval", parameters, ds))
            {
                throw new Exception("Fail to execute sp_EmpSPD_getrows_Approval", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_EmpSPD_getrows_Approval. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpSPD_approve", parameters))
            {
                throw new Exception("Fail to execute sp_EmpSPD_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Reject(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpSPD_reject", parameters))
            {
                throw new Exception("Fail to execute sp_EmpSPD_reject", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Mail(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_send_email_empspd", parameters))
            {
                throw new Exception("Fail to execute sp_send_email_empspd", new Exception(dbw.DBErrorMessage));
            }
        }
       
        
    }
}

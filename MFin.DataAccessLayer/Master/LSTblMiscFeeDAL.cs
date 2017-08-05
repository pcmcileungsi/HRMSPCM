using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;
namespace MFin.DataAccessLayer.Master
{
    public class LSTblMiscFeeDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_tblmiscfee_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_tblmiscfee_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_tblmiscfee_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_tblmiscfee_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_tblmiscfee_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_tblmiscfee_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_tblmiscfee_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_tblmiscfee_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_tblmiscfee_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForLsAppliFee(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_tblmiscfee_getrows_for_ls_applifee", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_tblmiscfee_getrows_for_ls_applifee", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_tblmiscfee_getrows_for_ls_applifee. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForLsAppliFeeEdit(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_tblmiscfee_getrows_for_ls_applifee_edit", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_tblmiscfee_getrows_for_ls_applifee_edit", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_tblmiscfee_getrows_for_ls_applifee_edit. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForProvisi(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_tblmiscfee_getrows_for_provisi", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_tblmiscfee_getrows_for_provisi", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_tblmiscfee_getrows_for_provisi No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_tblmiscfee_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_tblmiscfee_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_tblmiscfee_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

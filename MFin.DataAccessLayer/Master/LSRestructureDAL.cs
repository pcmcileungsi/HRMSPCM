using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSRestructureDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructure_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_restructure_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructure_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_restructure_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateTermCondition(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructure_update_termcondition", parameters))
            {
                throw new Exception("Fail to execute sp_ls_restructure_update_termcondition", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateSteps(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructure_update_steps", parameters))
            {
                throw new Exception("Fail to execute sp_ls_restructure_update_steps", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructure_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_restructure_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructure_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_restructure_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_restructure_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructure_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_restructure_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_restructure_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public object GetRowsPending(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructure_getrows_pending", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_restructure_getrows_pending", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_restructure_getrows_pending. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructure_approve", parameters))
            {
                throw new Exception("Fail to execute sp_ls_restructure_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Calculate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructure_calculate", parameters))
            {
                throw new Exception("Fail to execute sp_ls_restructure_calculate", new Exception(dbw.DBErrorMessage));
            }
        }
    }
}

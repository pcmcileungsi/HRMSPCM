using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSRestructStepDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructstep_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_restructstep_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructstep_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_restructstep_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructstep_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_restructstep_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructstep_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_restructstep_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_restructstep_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsByApplicno(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructstep_getrows_byapplicno", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_restructstep_getrows_byapplicno", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_restructstep_getrows_byapplicno. No row found.");
                else
                    return ds.Tables[0];
            }
        }


        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructstep_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_restructstep_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_restructstep_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetStepNo(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructstep_getstepno", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_restructstep_getstepno", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_restructstep_getstepno. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

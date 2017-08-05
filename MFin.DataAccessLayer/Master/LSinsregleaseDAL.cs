using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSinsregleaseDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insreglease_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_insreglease_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertNoInsurance(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insreglease_insert_no_insurance", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_insreglease_insert_no_insurance", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertAllNoInsurance(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insreglease_insert_all_no_insurance", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_insreglease_insert_all_no_insurance", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insreglease_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_insreglease_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insreglease_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_insreglease_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insreglease_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_insreglease_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_insreglease_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForInsRegister(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insreglease_getrows_for_insregister", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_insreglease_getrows_for_insregister", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_insreglease_getrows_for_insregister. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insreglease_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_insreglease_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_insreglease_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

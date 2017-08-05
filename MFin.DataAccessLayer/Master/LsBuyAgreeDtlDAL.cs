using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LsBuyAgreeDtlDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreedtl_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_buyagreedtl_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreedtl_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_buyagreedtl_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreedtl_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_buyagreedtl_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreedtl_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreedtl_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreedtl_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreedtl_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreedtl_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreedtl_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowbyCode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreedtl_getrow_by_code", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreedtl_getrow_by_code", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreedtl_getrow_by_code. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void InsertWithModule(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreedtl_insertwithmodule", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_buyagreedtl_insertwithmodule", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteWithModule(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreedtl_deletewithmodule", parameters))
            {
                throw new Exception("Fail to execute sp_ls_buyagreedtl_deletewithmodule", new Exception(dbw.DBErrorMessage));
            }
        }
    }
}

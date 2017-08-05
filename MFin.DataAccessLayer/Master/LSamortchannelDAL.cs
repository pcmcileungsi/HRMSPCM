using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSamortchannelDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortchannel_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_amortchannel_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortchannel_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_amortchannel_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortchannel_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_amortchannel_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteByCode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortchannel_delete_by_code", parameters))
            {
                throw new Exception("Fail to execute sp_ls_amortchannel_delete_by_code", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortchannel_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_amortchannel_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_amortchannel_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortchannel_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_amortchannel_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_amortchannel_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsforChanneling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortchannel_getrowsasforchanneling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_amortchannel_getrowsasforchanneling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_amortchannel_getrowsasforchanneling. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void Calculate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortchannel_calc_proc", parameters))
            {
                throw new Exception("Fail to execute sp_ls_amortchannel_calc_proc", new Exception(dbw.DBErrorMessage));
            }
        }

    }
}

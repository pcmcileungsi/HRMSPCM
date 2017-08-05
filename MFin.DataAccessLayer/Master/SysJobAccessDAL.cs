using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class SysJobAccessDAL
    {
        public DataTable GetRowByMenuId(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_jobaccess_getrowbyMenu", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_jobaccess_getrowbyMenu", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_jobaccess_getrowbyMenu. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_jobaccess_getrowbyMenu", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_jobaccess_getrowbyMenu", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_jobaccess_getrowbyMenu. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_jobaccess_update", parameters))
            {
                throw new Exception("Fail to execute sp_sys_jobaccess_update", new Exception(dbw.DBErrorMessage));
            }
        }
        
        public void Generate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_jobaccess_generate", parameters))
            {
                throw new Exception("Fail to execute sp_sys_jobaccess_generate", new Exception(dbw.DBErrorMessage));
            }
        }
        
    }
}

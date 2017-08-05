using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;


namespace MFin.DataAccessLayer.Master
{
    public class SysClientgroupDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_clientgroup_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_clientgroup_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_clientgroup_update", parameters))
            {
                throw new Exception("Fail to execute sp_sys_clientgroup_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_clientgroup_delete", parameters))
            {
                throw new Exception("Fail to execute sp_sys_clientgroup_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_clientgroup_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_clientgroup_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_clientgroup_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForReportARClientPerGroup(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_clientgroup_getrows_asforreportclientpergroup", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_clientgroup_getrows_asforreportclientpergroup", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_clientgroup_getrows_asforreportclientpergroup. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForLookUp(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_clientgroup_getrows_for_lookup", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_clientgroup_getrows_for_lookup", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_clientgroup_getrows_for_lookup. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_clientgroup_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_clientgroup_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_clientgroup_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

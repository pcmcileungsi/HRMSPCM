using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class MasterGroupRoleDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_group_role_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_master_group_role_insert", new Exception(dbw.DBErrorMessage));
            }
        }
        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_group_role_update", parameters))
            {
                throw new Exception("Fail to execute sp_master_group_role_update", new Exception(dbw.DBErrorMessage));
            }
        }
        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_group_role_delete", parameters))
            {
                throw new Exception("Fail to execute sp_master_group_role_delete", new Exception(dbw.DBErrorMessage));
            }
        }
        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_group_role_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_group_role_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_group_role_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_group_role_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_group_role_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_group_role_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void DeleteByGroupCode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_group_role_delete_by_group_code", parameters))
            {
                throw new Exception("Fail to execute sp_master_group_role_delete_by_group_code", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowByGroupCode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_group_role_getrows_by_group_code", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_group_role_getrows_by_group_code", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_group_role_getrows_by_group_code. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

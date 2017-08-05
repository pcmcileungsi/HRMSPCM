using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class MasterUserCompanyGroupDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_company_group_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_master_user_company_group_insert", new Exception(dbw.DBErrorMessage));
            }
        }
        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_company_group_update", parameters))
            {
                throw new Exception("Fail to execute sp_master_user_company_group_update", new Exception(dbw.DBErrorMessage));
            }
        }
        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_company_group_delete", parameters))
            {
                throw new Exception("Fail to execute sp_master_user_company_group_delete", new Exception(dbw.DBErrorMessage));
            }
        }
        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_company_group_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_user_company_group_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_user_company_group_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_company_group_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_user_company_group_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_user_company_group_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowByUserIDCCode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_company_group_getrow_by_user_id_c_code", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_user_company_group_getrow_by_user_id_c_code", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_user_company_group_getrow_by_user_id_c_code. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

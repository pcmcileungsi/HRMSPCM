using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Security
{
    public class MasterUserDAL
    {
        public void Insert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_insert", parameters))
            {
                throw new Exception("Fail to execute sp_master_user_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable Validate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_validate", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_user_validate", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Invalid user id/password.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable ValidateLogin(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_validate_login", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_user_validate_login", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Invalid user id/password.");
                else
                    return ds.Tables[0];
            }
        }

        public void UpdateLastLoginDate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_update_last_login_date", parameters))
            {
                throw new Exception("Fail to execute sp_master_user_update_last_login_date", new Exception(dbw.DBErrorMessage));
            }
        }
        public void UpdateLoginInfo(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_update_login_info", parameters))
            {
                throw new Exception("Fail to execute sp_master_user_update_login_info", new Exception(dbw.DBErrorMessage));
            }
        }
        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_user_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_user_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_user_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_user_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsUserforHRMS(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_User_for_HRMS_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_user_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_user_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void ChangePassword(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_change_password", parameters))
            {
                throw new Exception("Fail to execute sp_master_user_change_password", new Exception(dbw.DBErrorMessage));
            }
        }
    }
}

﻿using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;


namespace MFin.DataAccessLayer.Security
{
    public class MasterUserLogDAL
    {
        public void Insert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_log_insert", parameters))
            {
                throw new Exception("Fail to execute sp_master_user_log_insert", new Exception(dbw.DBErrorMessage));
            }
        }


        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_user_log_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_user_log_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_user_log_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

﻿using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class SysBlacklistSupplierDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_supplierblacklist_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_supplierblacklist_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_supplierblacklist_update", parameters))
            {
                throw new Exception("Fail to execute sp_sys_supplierblacklist_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_supplierblacklist_delete", parameters))
            {
                throw new Exception("Fail to execute sp_sys_supplierblacklist_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_supplierblacklist_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_supplierblacklist_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_supplierblacklist_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForBlacklist(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblsupplier_getrows_asforblacklist", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblsupplier_getrows_asforblacklist", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblsupplier_getrows_asforblacklist. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_supplierblacklist_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_supplierblacklist_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_supplierblacklist_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

    }
}

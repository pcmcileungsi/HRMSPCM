using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class SysTblSupplierDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblsupplier_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_tblsupplier_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblsupplier_update", parameters))
            {
                throw new Exception("Fail to execute sp_sys_tblsupplier_update", new Exception(dbw.DBErrorMessage));
            }
        }
        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblsupplier_approve", parameters))
            {
                throw new Exception("Fail to execute sp_sys_tblsupplier_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblsupplier_delete", parameters))
            {
                throw new Exception("Fail to execute sp_sys_tblsupplier_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblsupplier_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblsupplier_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblsupplier_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsAsForListCustomerPerSupplier(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblsupplier_getrows_asforlistcustomerpersupplier", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblsupplier_getrows_asforlistcustomerpersupplier", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblsupplier_getrows_asforlistcustomerpersupplier. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsBySuppStatus(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblsupplier_getrows_bysuppstatus", parameters, ds))
            {
                throw new Exception("Fail to sp_sys_tblsupplier_getrows_bysuppstatus sp_sys_tblsupplier_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblsupplier_getrows_bysuppstatus. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblsupplier_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblsupplier_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblsupplier_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsforReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblsupplierasforreports_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblsupplierasforreports_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblsupplierasforreports_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

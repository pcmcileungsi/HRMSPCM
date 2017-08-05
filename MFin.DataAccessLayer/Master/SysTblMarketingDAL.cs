using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class SysTblMarketingDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblmarketing_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_company_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblmarketing_update", parameters))
            {
                throw new Exception("Fail to execute sp_sys_tblmarketing_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblmarketing_delete", parameters))
            {
                throw new Exception("Fail to execute sp_sys_tblmarketing_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblmarketing_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblmarketing_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblmarketing_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForDDLAOC(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblmarketing_getrows_aoc", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblmarketing_getrows_aoc", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblmarketing_getrows_aoc. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblmarketing_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sys_tblmarketing_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblmarketing_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsforOnScrnMkt(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblmarketing_getrowsasforonscrnmkt", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblmarketing_getrowsasforonscrnmkt", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblmarketing_getrowsasforonscrnmkt. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsOrderByCCode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblmarketing_getrows_order_by_c_code", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblmarketing_getrows_order_by_c_code", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblmarketing_getrows_order_by_c_code. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsDDLApp(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblmarketing_getrows_ddl_application", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblmarketing_getrows_ddl_application", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblmarketing_getrows_ddl_application. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

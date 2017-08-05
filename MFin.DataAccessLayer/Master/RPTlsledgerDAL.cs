using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class RPTlsledgerDAL
    {
        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_ledger_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_ledger_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_ledger_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsExportToExcel(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_ledger_getrows_export_excel", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_ledger_getrows_export_excel", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_ledger_getrows_export_excel. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

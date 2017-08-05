using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class RptLsReceiveableDAL
    {
        public DataTable AgreementListGetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_agreementlist2_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_agreementlist2_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_agreementlist2_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable AgingScheGetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_agingsche_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_agingsche_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_agingsche_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable RPTLedgerGetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ledger_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ledger_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ledger_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

    }
}

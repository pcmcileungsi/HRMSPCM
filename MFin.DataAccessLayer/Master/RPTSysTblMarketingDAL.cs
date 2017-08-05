using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class RPTSysTblMarketingDAL
    {
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

        public DataTable GetRowsAsForRptMktLeaseAO(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_sys_tblmarketing_getrows_asforrptmktleaseao", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_sys_tblmarketing_getrows_asforrptmktleaseao", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_sys_tblmarketing_getrows_asforrptmktleaseao. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        

        public DataTable GetRowsforagreementperao(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_sys_tblmarketing_for_agreement_per_ao_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_sys_tblmarketing_for_agreement_per_ao_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_sys_tblmarketing_for_agreement_per_ao_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

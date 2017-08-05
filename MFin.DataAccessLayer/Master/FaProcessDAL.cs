using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class FaProcessDAL
    {
        public void DepreciationProcess(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_depreciation_process", parameters))
            {
                throw new Exception("Fail to execute sp_fa_depreciation_process", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowsFixedDepre(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_fixeddepre_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_fixeddepre_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_fixeddepre_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAssetDepre(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetdepre_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_assetdepre_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_assetdepre_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAcctDepre(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_acctdepre_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_acctdepre_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_acctdepre_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_depreciation_approve", parameters))
            {
                throw new Exception("Fail to execute sp_fa_depreciation_approve", new Exception(dbw.DBErrorMessage));
            }
        }
    }
}

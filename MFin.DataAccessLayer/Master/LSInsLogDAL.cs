using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSInsLogDAL
    {

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_inslog_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_inslog_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_inslog_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        //public DataTable GetRowsForReports(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_insmut_getrows_reports", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_ls_insmut_getrows_reports", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_ls_insmut_getrows_reports. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public DataTable GetRowsForAgreement(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_insmut_getrows_agreement", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_ls_insmut_getrows_agreement", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_ls_insmut_getrows_agreement. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}
    }
}

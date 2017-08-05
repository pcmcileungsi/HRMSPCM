using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class RPTModGLOperationDAL
    {
        public DataTable GetRowsForGLTransVoucher(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_mod_gloperation_getrows_asforgltransvcr", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_mod_gloperation_getrows_asforgltransvcr", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_mod_gloperation_getrows_asforgltransvcr. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForGLTransAccount(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_mod_gloperation_getrows_asforgltransacc", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_mod_gloperation_getrows_asforgltransacc", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_mod_gloperation_getrows_asforgltransacc. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForGLTransBySourceCode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_mod_gloperation_getrows_asforgltransjv", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_mod_gloperation_getrows_asforgltransjv", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_mod_gloperation_getrows_asforgltransjv. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForGLTransDepartment(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_mod_gloperation_getrows_asforcostdeptdetail", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_mod_gloperation_getrows_asforcostdeptdetail", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_mod_gloperation_getrows_asforcostdeptdetail. No row found.");
                else
                    return ds.Tables[0];
            }
        } //and detail, both using same sp
    }
}

using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class RPTInsRegDAL
    {
        public DataTable GetRowsPoliciesInsurance(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_insreg_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_insreg_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_insreg_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsUnexpiredPolicies(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_insreg_unexpired_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_insreg_unexpired_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_insreg_unexpired_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsExpiredPolicies(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_insregexp_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_insregexp_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_insregexp_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsRenewalPolicies(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_insreg_renewal_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_insreg_renewal_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_insreg_renewal_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAgreementUnterminate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_agreement_list1_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_agreement_list1_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_agreement_list1_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsInsurerByPolicy(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_insbyinsurer_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_insbyinsurer_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_insbyinsurer_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsPoliciesByInsurer(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_insbyinsurer_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_insbyinsurer_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_insbyinsurer_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsInsurerFee(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_insurerfee_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_insurerfee_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_insurerfee_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsClosedType(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ins_closedtype_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ins_closedtype_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ins_closedtype_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

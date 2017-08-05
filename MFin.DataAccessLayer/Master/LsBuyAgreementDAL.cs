using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;


namespace MFin.DataAccessLayer.Master
{
    public class LsBuyAgreementDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreement_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_buyagreement_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreement_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_buyagreement_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreement_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_buyagreement_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreement_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreement_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreement_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForCashReceipt(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreement_getrows_for_cashreceipt", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreement_getrows_for_cashreceipt", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreement_getrows_for_cashreceipt. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (parameters.ContainsKey("p_code"))
            {
                if (!dbw.ExecuteSP("sp_ls_buyagreement_getrow_by_code", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_ls_buyagreement_getrow_by_code", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_ls_buyagreement_getrow_by_code. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
            else
            {
                if (!dbw.ExecuteSP("sp_ls_buyagreement_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_ls_buyagreement_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_ls_buyagreement_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
        }

        public DataTable GetRowsAsForPending(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreementasforpending_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreementasforpending_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreementasforpending_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForPendingDisbursement(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreementasforpendingdisbursement_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreementasforpendingdisbursement_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreementasforpendingdisbursement_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForDisbursement(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreementasfordisbursement_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreementasfordisbursement_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreementasfordisbursement_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForReject(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreementasforreject_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreementasforreject_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreementasforreject_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void Reject(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreement_reject", parameters))
            {
                throw new Exception("Fail to execute sp_ls_buyagreement_reject", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreement_approve", parameters))
            {
                throw new Exception("Fail to execute sp_ls_buyagreement_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowsForAgreementChanneling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreement_getrows_for_agreement", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreement_getrows_for_agreement", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreement_getrows_for_agreement. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void InsertWithModule(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreement_insertwithmodule", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_buyagreement_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateWithModule(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreement_updatewithmodule", parameters))
            {
                throw new Exception("Fail to execute sp_ls_buyagreement_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowsAsForReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreement_getrowsasforreports", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreement_getrowsasforreports", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreement_getrowsasforreports. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsDisbursementAsForReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_buyagreementdisbursement_getrowsasforreports", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_buyagreementdisbursement_getrowsasforreports", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_buyagreementdisbursement_getrowsasforreports. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

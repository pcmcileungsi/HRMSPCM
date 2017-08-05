using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSagreementDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_agreement_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_agreement_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateForLKPDaction(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_update_for_lkpd_action", parameters))
            {
                throw new Exception("Fail to execute sp_ls_agreement_update_for_lkpd_action", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateOnChannelingAgreement(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_update_on_channeling_agreement", parameters))
            {
                throw new Exception("Fail to execute sp_ls_agreement_update_on_channeling_agreement", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_approve", parameters))
            {
                throw new Exception("Fail to execute sp_ls_agreement_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Reject(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_reject", parameters))
            {
                throw new Exception("Fail to execute sp_ls_agreement_reject", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateLKPD(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_update_lkpd", parameters))
            {
                throw new Exception("Fail to execute sp_ls_agreement_update_lkpd", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_agreement_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForRestructure(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_restructure", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_restructure", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_restructure. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsPending(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_pending", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_pending", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_pending. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowswccodeandmodule(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_lookup_termination", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_lookup_termination", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_lookup_termination. No row found.");
                else
                    return ds.Tables[0];
            }
        }



        public DataTable GetRowsApprovedPendingDisb(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_approved_pending_disb", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_approved_pending_disb", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_approved_pending_disb. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsDisbursement(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_disbursement", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_disbursement", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_disbursement. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsTerminated(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_terminated", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_terminated", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_terminated. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsBadDebt(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_baddebt", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_baddebt", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_baddebt. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsCancelled(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_cancelled", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_cancelled", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_cancelled. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (parameters.ContainsKey("p_lsagree"))
            {
                if (!dbw.ExecuteSP("sp_ls_agreement_getrow_w_lsagree", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_ls_agreement_getrow_w_lsagree", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_ls_agreement_getrow_w_lsagree. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
            else
            {
                if (!dbw.ExecuteSP("sp_ls_agreement_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_ls_agreement_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_ls_agreement_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
        }

        public DataTable GetRowsForAgreementARChanneling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_agreement_archanneling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_agreement_archanneling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_agreement_archanneling. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForPDC(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_pdc", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_pdc", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_pdc. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAgreementForPDC(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_all_agreement_getrows_for_pdc", parameters, ds))
            {
                throw new Exception("Fail to execute sp_all_agreement_getrows_for_pdc", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_all_agreement_getrows_pdc. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForLookUpRestructure(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_lookup_restructure", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_lookup_restructure", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_lookup_restructure. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForLookUpDocument(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_lookup_document", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_lookup_document", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_lookup_document. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void RestructureAgreement(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_restructure", parameters))
            {
                throw new Exception("Fail to execute sp_ls_agreement_restructure", new Exception(dbw.DBErrorMessage));
            }
        }


        public DataTable GetRowsForInsRegister(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_insregister", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_insregister", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_insregister. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForWriteOff(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_writeoff", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_writeoff", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_writeoff. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForCashReceipt(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_cashreceipt", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_cashreceipt", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_cashreceipt. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsDisbursementForLsLedger(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_disbursement_for_ledger", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_disbursement_for_ledger", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_disbursement_for_ledger. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        public DataTable GetRowsForChangeDueDate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_change_duedate", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_change_duedate", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_change_duedate. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForLookUpRentalAdjust(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_lookup_rentaladjust", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_lookup_rentaladjust", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_lookup_rentaladjust. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForCrossAsset(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_crossasset", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_crossasset", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_crossasset. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForDocEnquiry(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_docenquiry", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_docenquiry", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_docenquiry. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForLKPDactionLainLain(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_lkpd_action_lain", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_lkpd_action_lain", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_lkpd_action_lain. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForLKPDactionPolis(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_lkpd_action_polis", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_lkpd_action_polis", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_lkpd_action_polis. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForLKPDactionPremiGiro(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_lkpd_action_premi_giro", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_lkpd_action_premi_giro", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_lkpd_action_premi_giro. No row found.");
                else
                    return ds.Tables[0];
            }
        }


        public DataTable GetRowsOperationReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_foroperationreports", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_foroperationreports", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_foroperationreports. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForForecastDisbursement(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_asforfcdisburse", parameters, ds))
            {
                throw new Exception("Fail to execute  sp_ls_agreement_getrows_asforfcdisburse", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to  sp_ls_agreement_getrows_asforfcdisburse. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForDepositInsurance(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_deposit_insurance", parameters, ds))
            {
                throw new Exception("Fail to execute  sp_ls_agreement_getrows_for_deposit_insurance", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to  sp_ls_agreement_getrows_for_deposit_insurance. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowLKPDAction(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrow_lkpd_action", parameters, ds))
            {
                throw new Exception("Fail to execute  sp_ls_agreement_getrow_lkpd_action", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to  sp_ls_agreement_getrow_lkpd_action. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForLeaseAssetRegister(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_leaseassetregister", parameters, ds))
            {
                throw new Exception("Fail to execute  sp_ls_agreement_getrows_for_leaseassetregister", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to  sp_ls_agreement_getrows_for_leaseassetregister. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForAgreementTradeChanneling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_agreement_tradechanneling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_agreement_tradechanneling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_agreement_tradechanneling. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForInvoice(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_invoice", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_invoice", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_invoice. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        //CHANELLING

        public DataTable GetRowChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_agreement_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_agreement_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void InsertCHEntry(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_insert_appentry", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ch_agreement_insert_appentry", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateCHEntry(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_update_appentry", parameters))
            {
                throw new Exception("Fail to execute sp_ch_agreement_update_appentry", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateCHTermCondition(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_update_termcondition", parameters))
            {
                throw new Exception("Fail to execute sp_ch_agreement_update_termcondition", new Exception(dbw.DBErrorMessage));
            }
        }

        public void CloneAgreement(Hashtable parameters, ref string CloneAppNo)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_clone", parameters, ref CloneAppNo))
            {
                throw new Exception("Fail to execute sp_ch_agrement_clone", new Exception(dbw.DBErrorMessage));
            }
        }


    }
}

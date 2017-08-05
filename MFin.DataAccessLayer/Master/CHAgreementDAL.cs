using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class CHAgreementDAL
    {
        //public void Insert(Hashtable parameters, ref int iNextID)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_insert", parameters, ref iNextID))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_insert", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void InsertAppEntry(Hashtable parameters, ref int iNextID)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_insert_appentry", parameters, ref iNextID))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_insert_appentry", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void InsertToAgreement(Hashtable parameters, ref int iNextID)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_insert_to_agreement", parameters, ref iNextID))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_insert_to_agreement", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void CloneApplication(Hashtable parameters, ref string CloneAppNo)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_clone", parameters, ref CloneAppNo))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_clone", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void Update(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_update", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_update", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void UpdateStatus(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_update_status", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_update_status", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void UpdateAppEntry(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_update_appentry", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_update_appentry", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void UpdateTermCondition(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_update_termcondition", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_update_termcondition", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void UpdateSurveyAnalysis(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_update_surveyanalysis", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_update_surveyanalysis", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void UpdateSteps(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_update_steps", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_update_steps", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        
        //public void CreateQuickSteps(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_createquickstep", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_createquickstep", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void ApproveMarketing(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_approve_marketing", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_approve_marketing", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void ApproveSalesAdmin(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_approve_salesadmin", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_approve_salesadmin", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void ApproveCreditCommittee(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_approve_creditcommittee", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_approve_creditcommittee", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void RejectApplication(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_reject", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_reject", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        public void RejectAgreement(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_reject_application", parameters))
            {
                throw new Exception("Fail to execute sp_ls_application_reject_application", new Exception(dbw.DBErrorMessage));
            }
        }

        //public void Delete(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_delete", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_delete", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_getrows_pending", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_agreement_getrows_pending", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_agreement_getrows_pending. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsPendingBatch(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_getrows_pendingbatch", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_agreement_getrows_pendingbatch", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_agreement_getrows_pendingbatch. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsPendingDisbursement(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_getrows_pendingdisbursement", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_agreement_getrows_pendingdisbursement", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_agreement_getrows_pendingdisbursement. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsDisbursement(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_getrows_disbursement", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_agreement_getrows_disbursement", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_agreement_getrows_disbursement. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        //public DataTable GetRowsSalesAdmin(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_getrows_salesadmin", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_getrows_salesadmin", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_ls_application_getrows_salesadmin. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public DataTable GetRowsCreditCommitee(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_getrows_creditcommitee", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_getrows_creditcommitee", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_ls_application_getrows_creditcommitee. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public DataTable GetRowsRejected(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_getrows_rejected", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_getrows_rejected", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_ls_application_getrows_rejected. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public DataTable GetRowsAgreement(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_getrows_agreement", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_getrows_agreement", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_ls_application_getrows_agreement. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_application_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_application_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_application_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        //public DataTable GetRowAsForAsset(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_getrow_asfor_assetdefault", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_getrow_asfor_assetdefault", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_ls_application_getrow_asfor_assetdefault. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public DataTable GetRowsReportLS(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_getrows_report_ls", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_getrows_report_ls", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_ls_application_getrows_report_ls. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public DataTable GetRowsReportCF(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_getrows_report_cf", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_getrows_report_cf", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_ls_application_getrows_report_cf. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public DataTable GetRowsReportIMBT(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_getrows_report_imbt", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_getrows_report_imbt", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_ls_application_getrows_report_imbt. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public DataTable GetRowsReportMrbh(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_ls_application_getrows_report_mrbh", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_ls_application_getrows_report_mrbh", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_ls_application_getrows_report_mrbh. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public DataTable GetRowsConfLetter(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_rpt_ls_letter9_getrows", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_rpt_ls_letter9_getrows", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_rpt_ls_letter9_getrows. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public DataTable GetRowsConfLetter8to17(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_rpt_ls_letter8_getrows", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_rpt_ls_letter8_getrows", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_rpt_ls_letter8_getrows. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        public DataTable GetRowsPerBatch(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_getrows_per_batch", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_agreement_getrows_per_batch", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_agreement_getrows_per_batch. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAmortisasiReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_getrows_foramortisasireports", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_agreement_getrows_foramortisasireports", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_agreement_getrows_foramortisasireports. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsRentalReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_agreement_getrows_forrentalreports", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_agreement_getrows_forrentalreports", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_agreement_getrows_forrentalreports. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

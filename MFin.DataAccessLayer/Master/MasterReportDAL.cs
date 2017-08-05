using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;


namespace MFin.DataAccessLayer.Master
{
    public class MasterReportDAL
    {
        public DataTable GetRowsForConfirmationLetter(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_confirmationletter", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_confirmationletter", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_confirmationletter. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForMarketingReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_marketing", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_marketing", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_marketing. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForHrReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_hr", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_hr", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_hr. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForOperationReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_operationreport", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_operationreport", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_operationreport. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForReceivableReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_receivable", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_receivable", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_receivable. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForConfirmationReport(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_confirmationreport", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_confirmationreport", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("sp_master_report_getrows_confirmationreport. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForContractAgreementLetter(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_contractagreementletters", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_contractagreementletters", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("sp_master_report_getrows_contractagreementletters. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForGLOperationReport(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_gloperation", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_gloperation", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_gloperation. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForGLOperationReportAsForGeneralLedger(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_gloperationasforgeneralledger", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_gloperationasforgeneralledger", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_gloperationasforgeneralledger. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForGLManagementReport(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_glmanagement", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_glmanagement", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_glmanagement. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForFixedAssetReport(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_fixasset", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_fixasset", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_fixasset. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForCashierReport(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_cashier", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_cashier", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_cashier. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForBIGovermentReport(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_bigoverment", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_bigoverment", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_bigoverment. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForAccountingReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_accounting", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_accounting", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_accounting. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForClientMasterReportList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_clientmasterreportlist", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_clientmasterreportlist", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_clientmasterreportlist. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForOnScreenReportLKPDMasterReportList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_onscrlkpdreport", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_onscrlkpdreport", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_onscrlkpdreport. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForOnScreenReportPDCMasterReportList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_onscrpdcreport", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_onscrpdcreport", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_onscrpdcreport. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForOnScreenReportMktReportList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_onscrmktreport", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_onscrmktreport", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_onscrmktreport. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForInspectionAsset(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_inspectionassets", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_inspectionassets", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_inspectionassets. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForOLReport(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_olreport", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_olreport", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_olreport. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForSupplierReportList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_supplierreportlist", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_supplierreportlist", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_supplierreportlist. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForReceiveableLedger(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_receivableledger", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_receivableledger", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_receivableledger. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForAppraisalReportList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_appraisalreportlist", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_appraisalreportlist", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_appraisalreportlist. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForAddAppraisalReportList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_addappraisalreportlist", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_addappraisalreportlist", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_addappraisalreportlist. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForLsChanneling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_lschanneling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_lschanneling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_lschanneling. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsForLeasedAssetRegister(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_assetreg", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_assetreg", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_assetreg. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        public DataTable GetRowsForLeaseInsurance(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_leaseinsurance", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_leaseinsurance", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_leaseinsurance. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForPajakReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_pajak", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_pajak", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_pajak. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForInsurance(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_insurance", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_insurance", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_insurance. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForFactoring(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_factoring", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_factoring", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_factoring. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForAmortisasiChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_amortisasichannelling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_amortisasichannelling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_amortisasichannelling. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForContractChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_contractchannelling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_contractchannelling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_contractchannelling. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForChannellingReport(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_master_report_getrows_channelling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_master_report_getrows_channelling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_master_report_getrows_channelling. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

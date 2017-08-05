using System;
using System.Collections;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class MailMergeDAL
    {
        public DataTable LsApplicationOfferingLetterGetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_surat_getrowbyid", parameters, ds))
            {
                throw new Exception("Fail to execute sp_surat_getrowbyid", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_surat_getrowbyid. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public void LsApplicationOfferingLetterInsert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_surat_insert_applicationofferingletter", parameters))
            {
                throw new Exception("Fail to execute sp_surat_insert_applicationofferingletter", new Exception(dbw.DBErrorMessage));
            }
        }
        public void LsApplicationPurchaseOrderinsert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_surat_insert_purchaseorder",parameters))
            {
                throw new Exception("Fail to execute sp_surat_insert_purchaseorder", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InvoiceInsuranceInsert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_surat_invoice_insurance", parameters))
            {
                throw new Exception("Fail to execute sp_surat_invoice_insurance", new Exception(dbw.DBErrorMessage));
            }
        }

        public void RentalAdjustmentLetterInsert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_amortschedule2doc", parameters))
            {
                throw new Exception("Fail to execute sp_rpt_ls_amortschedule2doc", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable RentalAdjustmentLetterGetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_amortschedule2doc_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_amortschedule2doc_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_amortschedule2doc_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSInsMutDAL
    {
        //public void Insert(Hashtable parameters, ref int iNextID)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_acc_pdcleasing_insert", parameters, ref iNextID))
        //    {
        //        throw new Exception("Fail to execute sp_acc_pdcleasing_insert", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void Update(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_acc_pdcleasing_update", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_acc_pdcleasing_update", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void Delete(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_acc_pdcleasing_delete", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_acc_pdcleasing_delete", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insmut_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_insmut_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_insmut_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForReports(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insmut_getrows_reports", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_insmut_getrows_reports", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_insmut_getrows_reports. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForAgreement(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_insmut_getrows_agreement", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_insmut_getrows_agreement", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_insmut_getrows_agreement. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        //public DataTable GetRow(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_acc_pdcleasing_getrow", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_acc_pdcleasing_getrow", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_acc_pdcleasing_getrow. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public void InsertForPDCleasing(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_acc_pdcleasing_insert_for_pdc_proses", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_acc_pdcleasing_insert_for_pdc_proses", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void InsertCalculate(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_acc_pdcleasing_insert_calculate", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_acc_pdcleasing_insert_calculate", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public DataTable GetRowsForPDCtolakan(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_acc_pdcleasing_getrows_for_pdc_tolakan", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_acc_pdcleasing_getrows_for_pdc_tolakan", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_acc_pdcleasing_getrows_for_pdc_tolakan. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public DataTable GetRowForPDCtolakan(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_acc_pdcleasing_getrow_for_pdc_tolakan", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_acc_pdcleasing_getrow_for_pdc_tolakan", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_acc_pdcleasing_getrow_for_pdc_tolakan. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        //public void DeleteByAgreement(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_acc_pdcleasing_delete_by_agreement", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_acc_pdcleasing_delete_by_agreement", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public void Generate(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_acc_pdcleasing_insert_generate", parameters))
        //    {
        //        throw new Exception("Fail to execute sp_acc_pdcleasing_insert_generate", new Exception(dbw.DBErrorMessage));
        //    }
        //}

        //public DataTable GetRowsForInsurance(Hashtable parameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    dbw.ConnectionString = Shared.ConnectionString;
        //    if (!dbw.ExecuteSP("sp_acc_pdcleasing_getrows_for_insurance", parameters, ds))
        //    {
        //        throw new Exception("Fail to execute sp_acc_pdcleasing_getrows_for_insurance", new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to sp_acc_pdcleasing_getrows_for_pdc_tolakan. No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}
    }
}

using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;


namespace MFin.DataAccessLayer.Master
{
    public class SIDDataKreditDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_update", parameters))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_delete", parameters))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void ExportDataKelolaan(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_asforexporttodatakelolaan", parameters))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_asforexporttodatakelolaan", new Exception(dbw.DBErrorMessage));
            }
        }

        public void ImportDataJaminan(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_asforimportdatajaminan", parameters))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_asforimportdatajaminan", new Exception(dbw.DBErrorMessage));
            }
        }

        public void TransferFromLocalDB(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_transferdata", parameters))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_transferdata", new Exception(dbw.DBErrorMessage));
            }
        }

        public void ExportToSIDReporting(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_textfile", parameters))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_textfile", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowsTXTDataKredit(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_txt_getrows_datakredit", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_txt_getrows_datakredit", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_txt_getrows_datakredit. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsTXTDebitur(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_txt_getrows_debitur", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_txt_getrows_debitur", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_txt_getrows_debitur. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsTXTFooter(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_txt_getrows_footer", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_txt_getrows_footer", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_txt_getrows_footer. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsTXTHeader(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_txt_getrows_header", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_txt_getrows_header", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_txt_getrows_footer. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        public DataTable GetRowsTXTJaminan(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_txt_getrows_jaminan", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_txt_getrows_jaminan", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_txt_getrows_jaminan. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        public DataTable GetRowsTXTPengurus(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_txt_getrows_pengurus", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_txt_getrows_pengurus", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_txt_getrows_pengurus. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        public DataTable GetRowsTXTRelasi(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_txt_getrows_relasi", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_txt_getrows_relasi", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_txt_getrows_relasi. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsXLSDataKredit(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_xls_getrows_datakredit", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_xls_getrows_datakredit", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_xls_getrows_datakredit. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsXLSDebitur(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_xls_getrows_debitur", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_xls_getrows_debitur", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_xls_getrows_debitur. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsXLSFooter(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_xls_getrows_footer", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_xls_getrows_footer", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_xls_getrows_footer. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsXLSHeader(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_xls_getrows_header", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_xls_getrows_header", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_xls_getrows_footer. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsXLSJaminan(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_xls_getrows_jaminan", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_xls_getrows_jaminan", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_xls_getrows_jaminan. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsXLSPengurus(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_xls_getrows_pengurus", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_xls_getrows_pengurus", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_xls_getrows_pengurus. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsXLSRelasi(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_export_xls_getrows_relasi", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_export_xls_getrows_relasi", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_datakredit_export_xls_getrows_relasi. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void DinRequest(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_din_request", parameters))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_din_request", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateDIN(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_update_din", parameters))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_update_din", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateSIDData(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_datakredit_update_sid_data", parameters))
            {
                throw new Exception("Fail to execute sp_sid_datakredit_update_sid_data", new Exception(dbw.DBErrorMessage));
            }
        }

        
    }
}

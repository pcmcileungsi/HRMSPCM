using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSdtchannelDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_dtchannel_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_dtchannel_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_dtchannel_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_dtchannel_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_dtchannel_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_dtchannel_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_dtchannel_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_dtchannel_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_dtchannel_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsByCode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_dtchannel_getrowsbycode", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_dtchannel_getrowsbycode", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_dtchannel_getrowsbycode. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsReportToBumiPutera(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_hdchannel_getrows_asforreporttobumiputera", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_hdchannel_getrows_asforreporttobumiputera", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_hdchannel_getrows_asforreporttobumiputera. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_dtchannel_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_dtchannel_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_dtchannel_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void InsertUpload(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_dtchannel_insert_upload", parameters))
            {
                throw new Exception("Fail to execute sp_ls_dtchannel_insert_upload", new Exception(dbw.DBErrorMessage));
            }
        }
    }
}

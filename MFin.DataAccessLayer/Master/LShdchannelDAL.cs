using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LShdchannelDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_hdchannel_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_hdchannel_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_hdchannel_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_hdchannel_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_hdchannel_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_hdchannel_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_hdchannel_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_hdchannel_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_hdchannel_getrows. No row found.");
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

        public string GetTotalAmount(Hashtable parameters)
        {
            string totalamount="0";
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_hdchannel_getamount_total", parameters,ref totalamount))
            {
                throw new Exception("Fail to execute sp_ls_hdchannel_getamount_total", new Exception(dbw.DBErrorMessage));
                
            }
            return totalamount;
        }
        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_hdchannel_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_hdchannel_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_hdchannel_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

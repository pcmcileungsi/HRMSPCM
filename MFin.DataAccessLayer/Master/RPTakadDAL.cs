using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class RPTakadDAL
    {
        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_akad_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_akad_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_akad_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsforPDCstock(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_akadstock_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_akadstock_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_akadstock_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsforRestructure(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_akad_getrowsasforrestructure", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_akad_getrowsasforrestructure", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_akad_getrowsasforrestructure. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ch_akad_getrowsasforchannelling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ch_akad_getrowsasforchannelling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ch_akad_getrowsasforchannelling. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

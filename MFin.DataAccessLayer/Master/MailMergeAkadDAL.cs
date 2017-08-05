using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class MailMergeAkadDAL
    {
        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_akad_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_akad_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_akad_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowRestructure(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_akad_getrowasforrestructure", parameters, ds))
            {
                throw new Exception("Fail to execute sp_akad_getrowasforrestructure", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_akad_getrowasforrestructure. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowSupplier(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_akad_getrowasforsupplier", parameters, ds))
            {
                throw new Exception("Fail to execute sp_akad_getrowasforsupplier", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_akad_getrowasforsupplier. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowTandaTerima(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter14_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter14_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter14_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void Insert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_akad_insert", parameters))
            {
                throw new Exception("Fail to execute sp_akad_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertRestructure(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_akad_insertasforrestructure", parameters))
            {
                throw new Exception("Fail to execute sp_akad_insertasforrestructure", new Exception(dbw.DBErrorMessage));
            }
        }
        public void InsertSupplier(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_akad_insertasforsupplier", parameters))
            {
                throw new Exception("Fail to execute sp_akad_insertasforsupplier", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertTandaTerima(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter14", parameters))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter14", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertAsForChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_akad_insertasforchannelling", parameters))
            {
                throw new Exception("Fail to execute sp_ch_akad_insertasforchannelling", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowAsForChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_akad_getrowasforchannelling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_akad_getrowasforchannelling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_akad_getrowasforchannelling. No row found.");
                else
                    return ds.Tables[0];
            }
        }

    }
}

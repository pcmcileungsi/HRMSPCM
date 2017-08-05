using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSassetdocDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetdoc_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_assetdoc_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetdoc_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_assetdoc_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetdoc_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_assetdoc_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetdoc_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetdoc_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetdoc_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsByAssetno(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetdoc_getrows_byassetno", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetdoc_getrows_byassetno", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetdoc_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsByLsagree(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetdoc_getrows_bylsagree", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetdoc_getrows_bylsagree", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetdoc_getrows_bylsagree. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetdoc_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetdoc_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetdoc_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void Generate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetdoc_generate", parameters))
            {
                throw new Exception("Fail to execute sp_ls_assetdoc_generate", new Exception(dbw.DBErrorMessage));
            }
        }
    }
}

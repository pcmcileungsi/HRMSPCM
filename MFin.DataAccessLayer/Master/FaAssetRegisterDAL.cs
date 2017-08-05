using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class FaAssetRegisterDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetregister_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_fa_assetregister_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetregister_update", parameters))
            {
                throw new Exception("Fail to execute sp_fa_assetregister_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetregister_delete", parameters))
            {
                throw new Exception("Fail to execute sp_fa_assetregister_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetregister_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_assetregister_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_assetregister_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }


        public DataTable GetRowsByCategory(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetregister_getrows_by_category", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_assetregister_getrows_by_category", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_assetregister_getrows_by_category. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsByCategoryNotSale(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetregister_getrows_by_category_no_sale", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_assetregister_getrows_by_category_no_sale", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_assetregister_getrows_by_category_no_sale. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetregister_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_assetregister_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_assetregister_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

    }
}

using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class FaAssetAdditionDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetaddition_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_fa_assetaddition_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetaddition_update", parameters))
            {
                throw new Exception("Fail to execute sp_fa_assetaddition_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetaddition_delete", parameters))
            {
                throw new Exception("Fail to execute sp_fa_assetaddition_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetaddition_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_assetaddition_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_assetaddition_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetaddition_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_assetaddition_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_assetaddition_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsPending(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetaddition_getrows_pending", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_assetaddition_getrows_pending", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_assetaddition_getrows_pending. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsApproved(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fa_assetaddition_getrows_approved", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fa_assetaddition_getrows_approved", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fa_assetaddition_getrows_approved. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

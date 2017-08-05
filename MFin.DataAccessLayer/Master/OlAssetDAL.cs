using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class OlAssetDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_asset_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ol_asset_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_asset_update", parameters))
            {
                throw new Exception("Fail to execute sp_ol_asset_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void AssignAssetToContract(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_asset_assign_asset_to_contract", parameters))
            {
                throw new Exception("Fail to execute sp_ol_asset_assign_asset_to_contract", new Exception(dbw.DBErrorMessage));
            }
        }

        public void RemoveAssetFromContract(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_asset_remove_asset_from_contract", parameters))
            {
                throw new Exception("Fail to execute sp_ol_asset_remove_asset_from_contract", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_asset_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ol_asset_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_asset_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_asset_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_asset_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForAssign(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_asset_getrows_for_assign", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_asset_getrows_for_assign", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_asset_getrows_for_assign. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsByContractNo(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_asset_getrows_by_contractno", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_asset_getrows_by_contractno", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_asset_getrows_by_contractno. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_asset_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_asset_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_asset_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

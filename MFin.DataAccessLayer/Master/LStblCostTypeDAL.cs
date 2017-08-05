using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;


namespace MFin.DataAccessLayer.Master
{
    public class LStblCostTypeDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_LS_TBLCostType_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_LS_TBLCostType_insert  ", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_LS_TBLCostType_update", parameters))
            {
                throw new Exception("Fail to execute sp_LS_TBLCostType_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_LS_TBLCostType_delete", parameters))
            {
                throw new Exception("Fail to execute sp_LS_TBLCostType_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_LS_TBLCostType_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_LS_TBLCostType_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_LS_TBLCostType_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_LS_TBLCostType_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_LS_TBLCostType_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_LS_TBLCostType_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

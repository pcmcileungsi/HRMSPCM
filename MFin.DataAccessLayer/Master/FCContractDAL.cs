using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class FCContractDAL
    {
        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_contract_approve", parameters))
            {
                throw new Exception("Fail to execute sp_fc_contract_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Reject(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_contract_reject", parameters))
            {
                throw new Exception("Fail to execute sp_fc_contract_reject", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_contract_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_fc_contract_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_contract_update", parameters))
            {
                throw new Exception("Fail to execute sp_fc_contract_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_contract_delete", parameters))
            {
                throw new Exception("Fail to execute sp_fc_contract_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_contract_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_contract_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_contract_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForBatchList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_contract_getrows_asforbatchlist", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_contract_getrows_asforbatchlist", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_contract_getrows_asforbatchlist. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForRejectList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_contract_getrows_asforrejectlist", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_contract_getrows_asforrejectlist", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_contract_getrows_asforrejectlist. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_contract_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_contract_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_contract_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void CalculateInterest(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_calculate_interest", parameters))
            {
                throw new Exception("Fail to execute sp_fc_calculate_interest", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowsForDdlInsreg(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_fc_contract_getrows_for_ddl_insreg", parameters, ds))
            {
                throw new Exception("Fail to execute sp_fc_contract_getrows_for_ddl_insreg", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_fc_contract_getrows_for_ddl_insreg. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;


namespace MFin.DataAccessLayer.Master
{
    public class LsBadDebtDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_baddebt_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_baddebt_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_baddebt_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_baddebt_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_baddebt_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_baddebt_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_baddebt_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_baddebt_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_baddebt_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForCashReceipt(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_baddebt_getrows_for_cashreceipt", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_baddebt_getrows_for_cashreceipt", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_baddebt_getrows_for_cashreceipt. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if(parameters.ContainsKey("p_lsagree"))
                if (!dbw.ExecuteSP("sp_ls_baddebt_getrow_w_lsagree", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_ls_baddebt_getrow_w_lsagree", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_ls_baddebt_getrow_w_lsagree. No row found.");
                    else
                        return ds.Tables[0];
                }
            else
                if (!dbw.ExecuteSP("sp_ls_baddebt_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_ls_baddebt_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_ls_baddebt_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
        }
    }
}

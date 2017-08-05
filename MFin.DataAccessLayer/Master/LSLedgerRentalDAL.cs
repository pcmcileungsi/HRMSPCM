using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSLedgerRentalDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_ledgerrental_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_ledgerrental_insert", new Exception(dbw.DBErrorMessage));
            }
        }
        

        public void FillPaymentByContractNo(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_ledgerrental_fill_payment_by_contractno", parameters))
            {
                throw new Exception("Fail to execute sp_ls_ledgerrental_fill_payment_by_contractno", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_ledgerrental_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_ledgerrental_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_ledgerrental_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_ledgerrental_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_ledgerrental_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_ledgerrental_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_ledgerrental_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsByContractNo(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_ledgerrental_getrows_by_contractno", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_ledgerrental_getrows_by_contractno", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_ledgerrental_getrows_by_contractno. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_ledgerrental_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_ledgerrental_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_ledgerrental_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSRentalAdjustDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_rentaladjust_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_rentaladjust_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_rentaladjust_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_rentaladjust_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Calculate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_rentaladjust_calculate", parameters))
            {
                throw new Exception("Fail to execute sp_ls_rentaladjust_calculate", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_rentaladjust_approve", parameters))
            {
                throw new Exception("Fail to execute sp_ls_rentaladjust_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_rentaladjust_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_rentaladjust_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_rentaladjust_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_rentaladjust_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_rentaladjust_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_rentaladjust_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_rentaladjust_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_rentaladjust_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsApproved(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_rentaladjust_getrows_approved", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_rentaladjust_getrows_approved", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_rentaladjust_getrows_approved. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

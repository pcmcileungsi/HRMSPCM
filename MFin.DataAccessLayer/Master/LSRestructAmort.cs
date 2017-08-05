using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;
namespace MFin.DataAccessLayer.Master
{
    public class LSRestructAmort
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructamort_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_restructamort_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructamort_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_restructamort_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructamort_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_restructamort_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructamort_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_restructamort_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_restructamort_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_restructamort_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_restructamort_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_restructamort_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void CalculateAmortisation(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_amortisation_calc_proc_restructure", parameters))
            {
                throw new Exception("Fail to execute sp_amortisation_calc_proc_restructure", new Exception(dbw.DBErrorMessage));
            }
        }
    }
}

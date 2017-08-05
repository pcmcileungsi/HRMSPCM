using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
        public class LSduedateexDAL{
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_duedateex_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_duedateex_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_duedateex_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_duedateex_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_duedateex_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_duedateex_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_duedateex_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_duedateex_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_duedateex_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (parameters.ContainsKey("p_code"))
            {
                if (!dbw.ExecuteSP("sp_ls_duedateex_getrow_by_code", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_ls_duedateex_getrow_by_code", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_ls_duedateex_getrow_by_code. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
            else
            {
                if (!dbw.ExecuteSP("sp_ls_duedateex_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_ls_duedateex_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_ls_duedateex_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
        }
        public DataTable GetRowsForDueDate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_agreement_getrows_for_duedateex", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_agreement_getrows_for_duedateex", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_agreement_getrows_for_duedateex. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
        public class SIDKursDAL{
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_kurs_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sid_kurs_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_kurs_update", parameters))
            {
                throw new Exception("Fail to execute sp_sid_kurs_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_kurs_delete", parameters))
            {
                throw new Exception("Fail to execute sp_sid_kurs_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_kurs_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_kurs_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_kurs_getrows. No row found.");
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
                if (!dbw.ExecuteSP("sp_sid_kurs_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_sid_kurs_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_sid_kurs_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
            else
            {
                if (!dbw.ExecuteSP("sp_sid_kurs_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_sid_kurs_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_sid_kurs_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
        }

        public DataTable GetRowsforDetail(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_kursd_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_kursd_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_kursd_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void InsertforDetail(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_kursd_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sid_kursd_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateforDetail(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_kursd_update", parameters))
            {
                throw new Exception("Fail to execute sp_sid_kursd_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteforDetail(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_kursd_delete", parameters))
            {
                throw new Exception("Fail to execute sp_sid_kursd_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowforDetail(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (parameters.ContainsKey("p_code"))
            {
                if (!dbw.ExecuteSP("sp_sid_kursd_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_sid_kursd_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_sid_kursd_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
            else
            {
                if (!dbw.ExecuteSP("sp_sid_kursd_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_sid_kursd_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_sid_kursd_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
        }
    }
}

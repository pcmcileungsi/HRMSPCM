using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
        public class DocStorageDAL{
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storageh_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_doc_storageh_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storageh_update", parameters))
            {
                throw new Exception("Fail to execute sp_doc_storageh_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storageh_delete", parameters))
            {
                throw new Exception("Fail to execute sp_doc_storageh_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storageh_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_doc_storageh_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_doc_storageh_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForRejectList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storagehasforrejectlist_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_doc_storagehasforrejectlist_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_doc_storagehasforrejectlist_getrows. No row found.");
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
                if (!dbw.ExecuteSP("sp_doc_storageh_getrow_by_code", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_doc_storageh_getrow_by_code", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_doc_storageh_getrow_by_code. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
            else
            {
                if (!dbw.ExecuteSP("sp_doc_storageh_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_doc_storageh_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_doc_storageh_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
        }

        public void Approve(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storageh_approve", parameters))
            {
                throw new Exception("Fail to execute sp_doc_storageh_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Reject(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storageh_reject", parameters))
            {
                throw new Exception("Fail to execute sp_doc_storageh_reject", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowsForDetailList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storaged_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_doc_storaged_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_doc_storaged_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public void DeleteDetail(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storaged_delete", parameters))
            {
                throw new Exception("Fail to execute sp_doc_storaged_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowDetail(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (parameters.ContainsKey("p_code"))
            {
                if (!dbw.ExecuteSP("sp_doc_storaged_getrow_by_code", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_doc_storaged_getrow_by_code", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_doc_storaged_getrow_by_code. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
            else
            {
                if (!dbw.ExecuteSP("sp_doc_storaged_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_doc_storaged_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_doc_storaged_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
        }

        public void InsertDetail(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storaged_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_doc_storaged_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateDetail(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storaged_update", parameters))
            {
                throw new Exception("Fail to execute sp_doc_storaged_update", new Exception(dbw.DBErrorMessage));
            }
        }
    }
}

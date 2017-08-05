using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
        public class DocViewerDAL{
       
        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_storaged_getrows_asforviewer", parameters, ds))
            {
                throw new Exception("Fail to execute sp_doc_storaged_getrows_asforviewer", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_doc_storaged_getrows_asforviewer. No row found.");
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
                if (!dbw.ExecuteSP("sp_doc_storaged_getrow_by_code_asforviewer", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_doc_storaged_getrow_by_code_asforviewer", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_doc_storaged_getrow_by_code_asforviewer. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
            else
            {
                if (!dbw.ExecuteSP("sp_doc_storaged_getrow_asforviewer", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_doc_storaged_getrow_asforviewer", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_doc_storaged_getrow_asforviewer. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
        }

        public void InsertLog(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_dllog_insert", parameters))
            {
                throw new Exception("Fail to execute sp_doc_dllog_insert", new Exception(dbw.DBErrorMessage));
            }
        }

    }
}

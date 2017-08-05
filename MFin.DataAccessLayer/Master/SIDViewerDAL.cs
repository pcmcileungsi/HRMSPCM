using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class SIDViewerDAL
    {

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_viewerh_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_viewerh_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_viewerh_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_viewerh_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_viewerh_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_viewerh_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForDetailList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_viewerd_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_viewerd_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_viewerd_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }


        public DataTable GetRowsAsForDocumentList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_clientdoc_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_clientdoc_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_clientdoc_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForUploadList(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_requestd2_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_requestd2_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_requestd2_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }


        public DataTable GetRowUpload(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (parameters.ContainsKey("p_code"))
            {
                if (!dbw.ExecuteSP("sp_sid_requestd2_getrow_by_code", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_sid_requestd2_getrow_by_code", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_sid_requestd2_getrow_by_code. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
            else
            {
                if (!dbw.ExecuteSP("sp_sid_requestd2_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_sid_requestd2_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_sid_requestd2_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
        }

        public void InsertLog(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_requestd2dllog_insert", parameters))
            {
                throw new Exception("Fail to execute sp_sid_requestd2dllog_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowDetail(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_supervisord_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_supervisord_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_supervisord_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }


    }
}

using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;
namespace MFin.DataAccessLayer.Master
{
    public class SystblblacklistDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblblacklist_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_tblblacklist_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblblacklist_update", parameters))
            {
                throw new Exception("Fail to execute sp_sys_tblblacklist_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblblacklist_delete", parameters))
            {
                throw new Exception("Fail to execute sp_sys_tblblacklist_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblblacklist_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblblacklist_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblblacklist_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblblacklist_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_tblblacklist_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_tblblacklist_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void ExportPersonal(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblblacklist_exportpersonal", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_tblblacklist_exportpersonal", new Exception(dbw.DBErrorMessage));
            }
        }

        public void ExportCorporate(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_tblblacklist_exportcorporate", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_tblblacklist_exportcorporate", new Exception(dbw.DBErrorMessage));
            }
        }
    }
}

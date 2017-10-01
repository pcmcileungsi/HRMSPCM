using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class HR_ABSENSI_DAL
    {
        public void Insert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_INSERT", parameters))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_INSERT", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_UPDATE", parameters))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_UPDATE", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_DELETE", parameters))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_DELETE", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_GETROWS", parameters, ds))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_GETROWS", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_HR_ABSENSI_GETROWS. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsRekap(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_REKAP_GETROWS", parameters, ds))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_REKAP_GETROWS", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_HR_ABSENSI_REKAP_GETROWS. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_GETROW", parameters, ds))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_GETROW", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_HR_ABSENSI_GETROW. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

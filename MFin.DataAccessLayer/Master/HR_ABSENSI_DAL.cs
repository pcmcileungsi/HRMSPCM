using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class HR_ABSENSI_DAL
    {
		public void InsertCek(Hashtable parameters, ref int isInsert)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_INSERT_CEK", parameters, ref isInsert))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_INSERT_CEK", new Exception(dbw.DBErrorMessage));
            }
        }
		
        public void Insert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_INSERT", parameters))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_INSERT", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateRekap(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_REKAP_UPDATE", parameters))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_REKAP_UPDATE", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteAbsensi(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_DELETE", parameters))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_DELETE", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteInsertAbsen(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_DELETE_INSERT", parameters))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_DELETE_INSERT", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteInsert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_REKAP_DELETE_INSERT", parameters))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_REKAP_DELETE_INSERT", new Exception(dbw.DBErrorMessage));
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

        public DataTable GetRowShift(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_REKAP_GETROW_SHIFT", parameters, ds))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_REKAP_GETROW_SHIFT", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_HR_ABSENSI_REKAP_GETROW_SHIFT. No row found.");
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

        public DataTable GetRowRekapDetail(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_HR_ABSENSI_REKAP_GETROW", parameters, ds))
            {
                throw new Exception("Fail to execute SP_HR_ABSENSI_REKAP_GETROW", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_HR_ABSENSI_REKAP_GETROW. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class EmpLeaveBalance
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpLeaveBalance_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_EmpLeaveBalance_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpLeaveBalance_update", parameters))
            {
                throw new Exception("Fail to execute sp_EmpLeaveBalance_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_Employee_delete", parameters))
            {
                throw new Exception("Fail to execute sp_Employee_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpLeaveBalance_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_EmpLeaveBalance_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_EmpLeaveBalance_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpLeaveBalance_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_EmpLeaveBalance_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_EmpLeaveBalance_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsYear(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpLeaveBalance_getrows_year", parameters, ds))
            {
                throw new Exception("Fail to execute sp_EmpLeaveBalance_getrows_year", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_EmpLeaveBalance_getrows_year. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsBalanceByEmployee(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_EmpLeaveBalance_getrow_by_Employee", parameters, ds))
            {
                throw new Exception("Fail to execute sp_EmpLeaveBalance_getrow_by_Employee", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_EmpLeaveBalance_getrow_by_Employee. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsTempBalanceDataExcel(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("xsp_Temp_EmpLeaveBalance_getrows_Upload", parameters, ds))
            {
                throw new Exception("Fail to execute xsp_Temp_EmpLeaveBalance_getrows_Upload", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to xsp_Temp_EmpLeaveBalance_getrows_Upload. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsTempBalanceGrid(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("xsp_Temp_EmpLeaveBalance_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute xsp_Temp_EmpLeaveBalance_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to xsp_Temp_EmpLeaveBalance_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
                
        public void InsertTempBalance(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("xsp_Temp_EmpLeaveBalance_insert_Upload", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute xsp_Temp_EmpLeaveBalance_insert_Upload", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteTempBalance(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("xsp_Temp_EmpLeaveBalance_Delete", parameters))
            {
                throw new Exception("Fail to execute xsp_Temp_EmpLeaveBalance_Delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public void TempBalanceUploadProcess(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("xsp_Temp_EmpLeaveBalance_upload_process", parameters))
            {
                throw new Exception("Fail to execute xsp_Temp_EmpLeaveBalance_upload_process", new Exception(dbw.DBErrorMessage));
            }
        }
        
    }
}

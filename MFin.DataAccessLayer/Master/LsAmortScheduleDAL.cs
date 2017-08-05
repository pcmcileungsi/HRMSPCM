using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LsAmortScheduleDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortschedule_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_amortschedule_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortschedule_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_amortschedule_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortschedule_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_amortschedule_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortschedule_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_amortschedule_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_amortschedule_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortschedule_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_amortschedule_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_amortschedule_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        public DataTable GetRowsForChangeDueDate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_amortschedule_getrows_for_change_duedate", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_amortschedule_getrows_for_change_duedate", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_amortschedule_getrows_for_change_duedate. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        //CHANNELLING
        public void CalculateAmortisation(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_amortisation_calc_proc", parameters))
            {
                throw new Exception("Fail to execute sp_ch_amortisation_calc_proc", new Exception(dbw.DBErrorMessage));
            }
        }

    }
}

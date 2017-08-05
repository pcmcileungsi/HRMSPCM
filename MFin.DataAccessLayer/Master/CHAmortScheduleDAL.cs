using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class CHAmortScheduleDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_amortschedule_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ch_amortschedule_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_amortschedule_update", parameters))
            {
                throw new Exception("Fail to execute sp_ch_amortschedule_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_amortschedule_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ch_amortschedule_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_amortschedule_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_amortschedule_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_amortschedule_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_amortschedule_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ch_amortschedule_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ch_amortschedule_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        
        
        //CHANNELLING
        public void CalculateAmortisation(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ch_amortisation_calc_proc_channelling", parameters))
            {
                throw new Exception("Fail to execute sp_ch_amortisation_calc_proc_channelling", new Exception(dbw.DBErrorMessage));
            }
        }

    }
}

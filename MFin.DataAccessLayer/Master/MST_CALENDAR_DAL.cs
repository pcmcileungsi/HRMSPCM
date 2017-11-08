using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class MST_CALENDAR_DAL
    {
        public void Insert(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_CALENDAR_INSERT", parameters))
            {
                throw new Exception("Fail to execute SP_MST_CALENDAR_INSERT", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_CALENDAR_UPDATE", parameters))
            {
                throw new Exception("Fail to execute SP_MST_CALENDAR_UPDATE", new Exception(dbw.DBErrorMessage));
            }
        }        

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("SP_MST_CALENDAR_GETROWS", parameters, ds))
            {
                throw new Exception("Fail to execute SP_MST_CALENDAR_GETROWS", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to SP_MST_CALENDAR_GETROWS. No row found.");
                else
                    return ds.Tables[0];
            }
        }        
    }
}

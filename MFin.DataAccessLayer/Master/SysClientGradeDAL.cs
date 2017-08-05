using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class SysClientGradeDAL
    {
        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_sysclient_getrows_clientgrade", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_sysclient_getrows_clientgrade", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_sysclient_getrows_clientgrade. No row found.");
                else
                    return ds.Tables[0];
            }
        }

    }
}

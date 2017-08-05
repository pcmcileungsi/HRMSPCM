using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class SysEmailProcessDAL
    {
        
        public void ApproveLinkAll(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_all_approve", parameters))
            {
                throw new Exception("Fail to execute sp_all_approve", new Exception(dbw.DBErrorMessage));
            }
        }

        public void RejectedLinkAll(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_all_rejected", parameters))
            {
                throw new Exception("Fail to execute sp_all_rejected", new Exception(dbw.DBErrorMessage));
            }
        }

    }
}

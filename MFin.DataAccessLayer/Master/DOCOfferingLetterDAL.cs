using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class DOCOfferingLetterDAL
    {
        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_doc_offeringletter_ls", parameters))
            {
                throw new Exception("Fail to execute sp_doc_offeringletter_ls", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowPreviousLetter(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_acc_bnkaccount_getrows_for_banklist", parameters, ds))
            {
                throw new Exception("Fail to execute sp_acc_bnkaccount_getrows_for_banklist", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_acc_bnkaccount_getrows_for_banklist. No row found.");
                else
                    return ds.Tables[0];
            }
        }

    }
}

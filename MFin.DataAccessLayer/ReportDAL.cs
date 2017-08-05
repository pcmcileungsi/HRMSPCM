using System;
using System.Data;
using System.Collections;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer
{
    public class ReportDAL : BaseDAL
    {
        public void ExecuteSPReport(string spName, Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP(spName, parameters))
            {
                throw new Exception("Fail to execute report with sp name " + spName, new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable ExecuteTextReport(string spReportName, string spResultName, Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();

            dbw.ConnectionString = Shared.ConnectionString;

            if (spReportName != null)
            {
                if (dbw.ExecuteSP(spReportName, parameters))
                {

                    if (!dbw.ExecuteSP(spResultName, parameters, ds))
                    {
                        throw new Exception(spResultName, new Exception(dbw.DBErrorMessage));
                    }
                    else
                    {
                        if (ds.Tables.Count <= 0)
                            throw new Exception("Fail to " + spResultName + ". No row found.");
                        else
                            return ds.Tables[0];
                    }
                }
                else
                {
                    throw new Exception(spReportName);
                }
            }
            else
            {
                if (!dbw.ExecuteSP(spResultName, parameters, ds))
                {
                    throw new Exception(spResultName, new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to " + spResultName + ". No row found.");
                    else
                        return ds.Tables[0];
                }
            }
        }

        public DataTable ExecuteExcelReport(string spReportName, string spResultName, Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();

            dbw.ConnectionString = Shared.ConnectionString;

            if (spReportName != null && spResultName != null)
            {
                if (dbw.ExecuteSP(spReportName, parameters))
                {

                    if (!dbw.ExecuteSP(spResultName, parameters, ds))
                    {
                        throw new Exception(spResultName, new Exception(dbw.DBErrorMessage));
                    }
                    else
                    {
                        if (ds.Tables.Count <= 0)
                            throw new Exception("Fail to " + spResultName + ". No row found.");
                        else
                            return ds.Tables[0];
                    }
                }
                else
                {
                    throw new Exception(spReportName);
                }
            }
            else if (spReportName == null)
            {
                if (!dbw.ExecuteSP(spResultName, parameters, ds))
                {
                    throw new Exception(spResultName, new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to " + spResultName + ". No row found.");
                    else
                        return ds.Tables[0];
                }
            }
            else if (spResultName == null)
            {
                if (!dbw.ExecuteSP(spReportName, parameters))
                {
                    throw new Exception(spReportName, new Exception(dbw.DBErrorMessage));
                }
                else
                    return null;
            }
            else return null;
        }
    }
}

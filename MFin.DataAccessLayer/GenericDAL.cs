using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer
{
    public class GenericDAL : BaseDAL
    {
        //public object Insert(string sTableName, Hashtable htParameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    string sp = SPNamePrefix + sTableName + SPInsertSuffix;

        //    if (!dbw.ExecuteSP(sp, htParameters))
        //    {
        //        throw new Exception("Fail to execute " + sp, new Exception(dbw.DBErrorMessage));
        //    }

        //    return true;
        //}

        //public object Insert(string sTableName, Hashtable htParameters, ref string oReturnValue)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    string sp = SPNamePrefix + sTableName + SPInsertSuffix;

        //    if (!dbw.ExecuteSP(sp, htParameters, ref oReturnValue))
        //        throw new Exception("Fail to execute " + sp, new Exception(dbw.DBErrorMessage));

        //    return true;
        //}

        //public object Insert(string sTableName, Hashtable htParameters, ref int oReturnValue)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    string sp = SPNamePrefix + sTableName + SPInsertSuffix;

        //    if (!dbw.ExecuteSP(sp, htParameters, ref oReturnValue))
        //        throw new Exception("Fail to execute " + sp, new Exception(dbw.DBErrorMessage));

        //    return true;
        //}

        //public object Update(string sTableName, Hashtable htParameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    string sp = SPNamePrefix + sTableName + SPUpdateSuffix;

        //    if (!dbw.ExecuteSP(sp, htParameters))
        //    {
        //        throw new Exception("Fail to execute " + sp, new Exception(dbw.DBErrorMessage));
        //    }

        //    return true;
        //}

        //public object Update(string sTableName, string sSPName, Hashtable htParameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    string sp = SPNamePrefix + sSPName;

        //    if (!dbw.ExecuteSP(sp, htParameters))
        //    {
        //        throw new Exception("Fail to execute " + sp, new Exception(dbw.DBErrorMessage));
        //    }

        //    return true;
        //}

        //public object Delete(string sTableName, Hashtable htParameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    string sp = SPNamePrefix + sTableName + SPDeleteSuffix;

        //    if (!dbw.ExecuteSP(sp, htParameters))
        //    {
        //        throw new Exception("Fail to execute " + sp, new Exception(dbw.DBErrorMessage));
        //    }

        //    return true;
        //}

        //public DataRow GetRow(string sTableName, Hashtable htParameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    string sp = SPNamePrefix + sTableName + SPGetRowSuffix;


        //    if (!dbw.ExecuteSP(sp, htParameters, ds))
        //    {
        //        throw new Exception("Fail to execute " + sp, new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0)
        //            throw new Exception("Fail to execute " + sp + ". No row found.");
        //        else
        //            return ds.Tables[0].Rows[0];
        //    }
        //}

        //public DataRow GetRow(string sTableName, string sSPName, Hashtable htParameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    string sp = SPNamePrefix + sSPName;


        //    if (!dbw.ExecuteSP(sp, htParameters, ds))
        //    {
        //        throw new Exception("Fail to execute " + sp, new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0)
        //            throw new Exception("Fail to execute " + sp + ". No row found.");
        //        else
        //            return ds.Tables[0].Rows[0];
        //    }
        //}

        public DataTable GetRows(string sTableName, Hashtable htParameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            //string sp = SPNamePrefix + sTableName + SPGetRowsSuffix;
            string sp = sTableName;


            if (!dbw.ExecuteSP(sp, htParameters, ds))
            {
                throw new Exception("Fail to execute " + sp, new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to execute " + sp + ". No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsTemp(string sSPName, Hashtable htParameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();

            if (!dbw.ExecuteSP(sSPName, htParameters, ds))
            {
                throw new Exception("Fail to execute " + sSPName, new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to execute " + sSPName + ". No row found.");
                else
                    return ds.Tables[0];
            }
        }

        //public DataTable GetRows(string sTableName, string sSPName, Hashtable htParameters)
        //{
        //    DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
        //    DataSet ds = new DataSet();
        //    string sp = SPNamePrefix + sSPName;


        //    if (!dbw.ExecuteSP(sp, htParameters, ds))
        //    {
        //        throw new Exception("Fail to execute " + sp, new Exception(dbw.DBErrorMessage));
        //    }
        //    else
        //    {
        //        if (ds.Tables.Count <= 0)
        //            throw new Exception("Fail to execute " + sp + ". No row found.");
        //        else
        //            return ds.Tables[0];
        //    }
        //}

        public void ExecRawSP(string sSPName, Hashtable htParameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();

            if (!dbw.ExecuteSP(sSPName, htParameters))
            {
                throw new Exception("Fail to execute " + sSPName, new Exception(dbw.DBErrorMessage));
            }
        }

        public void ExecRawSP(string sSPName, Hashtable htParameters, ref string oReturnValue)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();

            if (!dbw.ExecuteSP(sSPName, htParameters, ref oReturnValue))
            {
                throw new Exception("Fail to execute " + sSPName, new Exception(dbw.DBErrorMessage));
            }
        }

        public void ExecRawSP(string sSPName, Hashtable htParameters, ref int oReturnValue)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();

            if (!dbw.ExecuteSP(sSPName, htParameters, ref oReturnValue))
            {
                throw new Exception("Fail to execute " + sSPName, new Exception(dbw.DBErrorMessage));
            }
        }

    }
}

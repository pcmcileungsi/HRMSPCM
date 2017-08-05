using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;
namespace MFin.DataAccessLayer.Master
{
    public class RPTModConfLetterDAL
    {
        public DataTable GetRowsLetter1(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter1_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter1_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter1_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter2(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter2_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter2_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter2_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter3(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter3_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter3_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter3_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter4(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter4_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter4_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter4_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter5(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter5_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter5_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter5_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter6(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter6_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter6_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter6_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter7(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter7_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter7_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter7_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter8(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter8_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter8_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter8_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter9(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter9_rkk_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter9_rkk_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter9_rkk_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter10(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter10_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter10_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter10_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter11(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter11_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter11_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter11_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter12(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter12_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter12_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter12_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter13(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter13_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter13_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter13_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter14(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter14_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter14_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter14_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsLetter15(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter15_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter15_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter15_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter16(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter16_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter16_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter16_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter17(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter17_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter17_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter17_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }



        public DataTable GetRowsLetter21(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter21_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter21_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter21_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter22(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter22_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter22_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter22_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
        public DataTable GetRowsLetter23(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_ls_letter23_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_ls_letter23_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_ls_letter23_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

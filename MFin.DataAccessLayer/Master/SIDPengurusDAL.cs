using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class SIDPengurusDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_pengurus_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sid_pengurus_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_pengurus_update", parameters))
            {
                throw new Exception("Fail to execute sp_sid_pengurus_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_pengurus_delete", parameters))
            {
                throw new Exception("Fail to execute sp_sid_pengurus_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_pengurus_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_pengurus_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_pengurus_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_pengurus_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_pengurus_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_pengurus_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsColerateDebitur(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_pengurus_getrows_coleratedebitur", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sid_pengurus_getrows_coleratedebitur", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sid_pengurus_getrows_coleratedebitur. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void InsertChannelling(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_pengurus_insertchannelling", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sid_pengurus_insertchannelling", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_pengurus_updatechannelling", parameters))
            {
                throw new Exception("Fail to execute sp_sid_pengurus_updatechannelling", new Exception(dbw.DBErrorMessage));
            }
        }

        public void DeleteChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sid_pengurus_deletechannelling", parameters))
            {
                throw new Exception("Fail to execute sp_sid_pengurus_deletechannelling", new Exception(dbw.DBErrorMessage));
            }
        }


    }
}

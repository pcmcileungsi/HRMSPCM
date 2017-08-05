using System;
using System.Collections;
using System.Data;
using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class OJKMasterGolonganDAL
    {
       

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ojk_master_golongan_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ojk_master_golongan_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ojk_master_golongan_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ojk_master_golongan_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ojk_master_golongan_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ojk_master_golongan_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ojk_master_golongan_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ojk_master_golongan_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }


        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ojk_master_golongan_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ojk_master_golongan_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ojk_master_golongan_update", parameters))
            {
                throw new Exception("Fail to execute sp_ojk_master_golongan_update", new Exception(dbw.DBErrorMessage));
            }
        }


    }
}

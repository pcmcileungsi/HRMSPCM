using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class LSassetvehicleDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_update", parameters))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetvehicle_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsPerAgreement(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_getrowsPerAgreement", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_getrowsPerAgreement", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetvehicle_getrowsPerAgreement. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForLeasePerLineIndsutry(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_getrows_asforleaseperlineindustry", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_getrows_asforleaseperlineindustry", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetvehicle_getrows_asforleaseperlineindustry. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsNoInsurance(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_getrows_no_insurance", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_getrows_no_insurance", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetvehicle_getrows_no_insurance. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsParamLSAGREE(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_getrows_param_lsagree", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_getrows_param_lsagree", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetvehicle_getrows_param_lsagree. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsParamASSETNO(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_getrows_param_assetno", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_getrows_param_assetno", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetvehicle_getrows_param_assetno. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetvehicle_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_getrow_channelling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_getrow_channelling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetvehicle_getrow_channelling. No row found.");
                else
                    return ds.Tables[0];
            }
        }


        public DataTable GetRowsWithInsurence(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_getrows_with_insurance", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_getrows_with_insurance", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_asset_vehicle_getrows_with_insurance. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void UpdateChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_update_channelling", parameters))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_update_channelling", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowsPerBatch(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ls_assetvehicle_getrows_per_batch", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ls_assetvehicle_getrows_per_batch", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ls_assetvehicle_getrows_per_batch. No row found.");
                else
                    return ds.Tables[0];
            }
        }
    }
}

using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class SysClientDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_client_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertAppEntry(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_insert_appentry", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_client_insert_appentry", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_update", parameters))
            {
                throw new Exception("Fail to execute sp_sys_client_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateForDocEnquiry(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_update_for_docenquiry", parameters))
            {
                throw new Exception("Fail to execute sp_sys_client_update_for_docenquiry", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateSID(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_update_sid", parameters))
            {
                throw new Exception("Fail to execute sp_sys_client_update_sid", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateClientPersonal(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_update_personal", parameters))
            {
                throw new Exception("Fail to execute sp_sys_client_update_personal", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateClientCorporate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_update_corporate", parameters))
            {
                throw new Exception("Fail to execute sp_sys_client_update_corporate", new Exception(dbw.DBErrorMessage));
            }
        }


        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_delete", parameters))
            {
                throw new Exception("Fail to execute sp_sys_client_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForAgreementperCustomer(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrows_asforagreementpercustomer", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrows_asforagreementpercustomer", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrows_asforagreementpercustomer. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsPersonal(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrows_personal", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrows_personal", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrows_personal. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsCorporate(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrows_corporate", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrows_corporate", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrows_corporate. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrow", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrow", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrow. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowForRegister(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrow_byid", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrow_byid", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrow_byid. No row found.");
                else
                    return ds.Tables[0];
            }
        }


        public DataTable GetSIDData(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getsiddata", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getsiddata", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getsiddata. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForDocEnquiry(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrows_for_docenquiry", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrows_for_docenquiry", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrows_for_docenquiry. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsforClientPersonalOnly(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrows_personal", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrows_personal", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrows_personal. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsforIndustryCode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrows_plusindustrycode", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrows_plusindustrycode", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrows_plusindustrycode. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsforRPTGroup(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_sys_client_getrows_clientforgroup", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_sys_client_getrows_clientforgroup", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_sys_client_getrows_clientforgroup. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsforRPTGrade(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet(); 
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_sys_client_getrows_clientgrade", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_sys_client_getrows_clientgrade", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_sys_client_getrows_clientgrade. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsforRemedial(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_rpt_sysclient_getrows_clientremedial", parameters, ds))
            {
                throw new Exception("Fail to execute sp_rpt_sysclient_getrows_clientremedial", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_rpt_sysclient_getrows_clientremedial. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsAsForPDC(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrows_for_pdc", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrows_for_pdc", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrows_for_pdc. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable CheckName(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_checkname", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_checkname", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_checkname. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsPersonalChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrows_personalchannelling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrows_personalchannelling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrows_personalchannelling. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsCorporateChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrows_corporatechannelling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrows_corporatechannelling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrows_corporatechannelling. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrowchannelling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrowchannelling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrowchannelling. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public void InsertChannelling(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_insertchannelling", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_client_insertchannelling", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateClientPersonalChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_update_personalchannelling", parameters))
            {
                throw new Exception("Fail to execute sp_sys_client_update_personalchannelling", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertChannellingCorporate(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_insertchannellingcorporate", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_sys_client_insertchannellingcorporate", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateClientCorporateChannelling(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_update_corporatechannelling", parameters))
            {
                throw new Exception("Fail to execute sp_sys_client_update_corporatechannelling", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRowsCHAsforIndustryCode(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_sys_client_getrows_plusindustrycodechannelling", parameters, ds))
            {
                throw new Exception("Fail to execute sp_sys_client_getrows_plusindustrycodechannelling", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_sys_client_getrows_plusindustrycodechannelling. No row found.");
                else
                    return ds.Tables[0];
            }
        }

    }
}

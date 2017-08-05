using System;
using System.Collections;
using System.Data;

using MFin.DataAccessLayer.Utility;

namespace MFin.DataAccessLayer.Master
{
    public class OlApplicationDAL
    {
        public void Insert(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_insert", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ol_application_insert", new Exception(dbw.DBErrorMessage));
            }
        }

        public void InsertAppEntry(Hashtable parameters, ref int iNextID)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_insert_appentry", parameters, ref iNextID))
            {
                throw new Exception("Fail to execute sp_ol_application_insert_appentry", new Exception(dbw.DBErrorMessage));
            }
        }

        public void Update(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_update", parameters))
            {
                throw new Exception("Fail to execute sp_ol_application_update", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateAppEntry(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_update_appentry", parameters))
            {
                throw new Exception("Fail to execute sp_ol_application_update_appentry", new Exception(dbw.DBErrorMessage));
            }
        }

        public void UpdateInterview(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_update_interview", parameters))
            {
                throw new Exception("Fail to execute sp_ol_application_update_interview", new Exception(dbw.DBErrorMessage));
            }
        }

        public void ApproveApplication(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_approve_application", parameters))
            {
                throw new Exception("Fail to execute sp_ol_application_approve_application", new Exception(dbw.DBErrorMessage));
            }
        }

        public void ActivateApplication(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_activate_application", parameters))
            {
                throw new Exception("Fail to execute sp_ol_application_activate_application", new Exception(dbw.DBErrorMessage));
            }
        }

        public void RejectApplication(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_reject_application", parameters))
            {
                throw new Exception("Fail to execute sp_ol_application_reject_application", new Exception(dbw.DBErrorMessage));
            }
        }


        public void Delete(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_delete", parameters))
            {
                throw new Exception("Fail to execute sp_ol_application_delete", new Exception(dbw.DBErrorMessage));
            }
        }

        public DataTable GetRows(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_getrows", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForInsRegister(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_getrows_for_insregister", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows_for_insregister", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows_for_insregister. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForCashReceipt(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_getrows_for_cashreceipt", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows_for_cashreceipt", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows_for_cashreceipt. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForDdlInsreg(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_getrows_for_ddl_insreg", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows_for_ddl_insreg", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows_for_ddl_insreg. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForLookUp(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("[sp_ol_application_getrows_for_lookup]", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows_for_lookup", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows_for_lookup. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsInProcess(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_getrows_inprocess", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows_inprocess", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows_inprocess. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsPending(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_getrows_pending", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows_pending", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows_pending. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsActive(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_getrows_active", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows_active", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows_active. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsRejected(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_getrows_rejected", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows_rejected", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows_rejected. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForActivation(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_getrows_for_activation", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows_for_activation", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows_for_activation. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRow(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (parameters.ContainsKey("p_olagree"))
            {
                if (!dbw.ExecuteSP("sp_ol_application_getrow_w_olagree", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_ol_application_getrow_w_olagree", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_ol_application_getrow_w_olagree. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
            else
            {
                if (!dbw.ExecuteSP("sp_ol_application_getrow", parameters, ds))
                {
                    throw new Exception("Fail to execute sp_ol_application_getrow", new Exception(dbw.DBErrorMessage));
                }
                else
                {
                    if (ds.Tables.Count <= 0)
                        throw new Exception("Fail to sp_ol_application_getrow. No row found.");
                    else
                        return ds.Tables[0];
                }
            }
        }

        public DataTable GetRowsForPDC(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_getrows_for_pdc", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows_for_pdc", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows_for_pdc. No row found.");
                else
                    return ds.Tables[0];
            }
        }

        public DataTable GetRowsForCostIncomeOL(Hashtable parameters)
        {
            DBWrapper dbw = DBWrapper.GetSqlClientWrapper();
            DataSet ds = new DataSet();
            dbw.ConnectionString = Shared.ConnectionString;
            if (!dbw.ExecuteSP("sp_ol_application_getrows_asforcostincomeol", parameters, ds))
            {
                throw new Exception("Fail to execute sp_ol_application_getrows_asforcostincomeol", new Exception(dbw.DBErrorMessage));
            }
            else
            {
                if (ds.Tables.Count <= 0)
                    throw new Exception("Fail to sp_ol_application_getrows_asforcostincomeol. No row found.");
                else
                    return ds.Tables[0];
            }
        }

    }
}

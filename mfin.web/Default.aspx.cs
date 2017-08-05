using System;
using System.Configuration;
using System.Data;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using MFin.DataAccessLayer.Security;
using MFin.DataAccessLayer.Master;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) 
        { 
            //Shared.BindDDLCompany(ddlCompany); 
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        MasterUserDAL _dalMasterUser = null;
        MasterUserLogDAL _dalMasterUserLog = null;


        Hashtable htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();
            _dalMasterUser = new MasterUserDAL();
            _dalMasterUserLog = new MasterUserLogDAL();

            htParameters = new Hashtable();

            htParameters["p_user_id"] = txtUID.Text;
            htParameters["p_user_password"] = txtUPass.Text;

            DataTable dt = _dalMasterUser.ValidateLogin(htParameters);

            if (dt.Rows[0]["is_active_flag"].ToString().Equals("1"))
            {
                Session[SessionKey.CURRENT_USER_SESSION_KEY] = dt.Rows[0];
                Session[SessionKey.CURRENT_ENTITY_SESSION_KEY] = ddlCompany.SelectedItem.Value;
                Session[SessionKey.CURRENT_ENTITY_SESSION_XDESCS] = ddlCompany.SelectedItem.Text;
                Session[SessionKey.CURRENT_PASSWORD_SESSION_KEY] = txtUPass.Text;
                Session[SessionKey.CURRENT_USER_HRMS_ROLE] = dt.Rows[0].Field<string>(3);
                Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE] = dt.Rows[0].Field<string>(4);
                Session[SessionKey.CURRENT_USER_HRMS_EMP_NAME] = dt.Rows[0].Field<string>(5);
                Session[SessionKey.CURRENT_USER_HRMS_ROLE_DESC] = dt.Rows[0].Field<string>(6);


                if (String.IsNullOrEmpty(dt.Rows[0].Field<string>(4)))
                {
                    Utility.ShowMessageBoxAnas(this, "Pengguna belum terdaftar !!!", "Information");
                    return;
                }
                htParameters["ddlValue"] = ddlCompany.SelectedItem.Value;

                if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] == null)
                    Session[SessionKey.CURRENT_USER_IP_ADDRESS_SESSION_KEY] = Request.ServerVariables["REMOTE_ADDR"];
                else
                    Session[SessionKey.CURRENT_USER_IP_ADDRESS_SESSION_KEY] = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];


                #region Insert into log
                htParameters.Clear();
                htParameters["p_user_id"] = txtUID.Text;
                htParameters["p_login_date"] = DateTime.Now;
                htParameters["p_login_ip_address"] = Utility.CurrentIPAddress;
                _dalMasterUserLog.Insert(htParameters);
                #endregion


                #region Update Last Login Date
                htParameters.Clear();
                htParameters["p_user_id"] = txtUID.Text;
                htParameters["p_last_login_date"] = DateTime.Now;
                _dalMasterUser.UpdateLastLoginDate(htParameters);
                #endregion


                #region Retrive User Roles
                GetUserRoles();
                #endregion

                Response.Redirect("main.aspx");
            }
            else
                Utility.ShowMessageBox(this, "User ID is not active", null, null, null);

        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, "Fail to login to system", ex, null, null);
        }
    }

    private void GetUserRoles()
    {
        MasterUserCompanyGroupDAL _dalUserCompanyGroup = null;
        MasterGroupRoleDAL _dalGroupRole = null;
        
        Hashtable _htParameter = null;
        ArrayList _alRole = null;
        try
        {
            //System.Diagnostics.Debugger.Break();
            _dalUserCompanyGroup = new MasterUserCompanyGroupDAL();
            _dalGroupRole = new MasterGroupRoleDAL();

            _htParameter = new Hashtable();
            _htParameter["p_user_id"] = txtUID.Text;
            _htParameter["p_c_code"] = Session[SessionKey.CURRENT_ENTITY_SESSION_KEY].ToString();

            DataTable _dt = _dalUserCompanyGroup.GetRowByUserIDCCode(_htParameter);

            if (_dt.Rows.Count == 0)
            {
                _alRole = new ArrayList();
                Session[SessionKey.CURRENT_USER_ROLE_SESSION_KEY] = _alRole;
            }
            else
            {
                //ada di database, lalu ambil data role

                _htParameter["p_group_code"] = _dt.Rows[0]["GROUP_CODE"];

                DataTable _dtRoles = _dalGroupRole.GetRowByGroupCode(_htParameter);
                _alRole = new ArrayList();

                foreach (DataRow dr in _dtRoles.Rows)
                {
                    _alRole.Add(dr["ROLE_CODE"]);
                }

                Session[SessionKey.CURRENT_USER_ROLE_SESSION_KEY] = _alRole;
            }
        }
        catch (Exception ex)
        {
        }
    }

    //protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //
    //}

    protected void txtUID_TextChanged(object sender, EventArgs e)
    {
        try
        {
            Shared.BindDDLCompanyByUID(ddlCompany, txtUID.Text);
            txtUPass.Focus();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, "Invalid User ID", ex, null);
        }
    }

}

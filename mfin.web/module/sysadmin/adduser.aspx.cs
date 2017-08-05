using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using MFin.DataAccessLayer.Master;
using MFin.DataAccessLayer.Security;

public partial class module_sysadmin_adduser : BasePage
{
    //private static string _RoleCode = "P000476";
    private static string _RoleCode = "B100001";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
        }
    }

    private void SaveData()
    {
        MasterUserDAL _dalMasterUser = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMasterUser = new MasterUserDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (chkIsActive.Checked == true)
            {
                _htParameters["p_is_active_flag"] = "1";
            }
            else _htParameters["p_is_active_flag"] = "0";

            if (Request.Params["action"] == "add")
            {
                _dalMasterUser.Insert(_htParameters);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "userdetail.aspx?action=edt&id=" + txtUSER_ID.Text);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("userlist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //System.Diagnostics.Debugger.Break();
        SaveData();
    }
}

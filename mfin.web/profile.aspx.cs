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

public partial class profile : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
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
            _htParameters["p_user_id"] = Utility.CurrentUID;
            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);
            _dalMasterUser.ChangePassword(_htParameters);

            Utility.ShowMessageBox(this, "Your Password has been changed!", null, "profile.aspx");
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        //System.Diagnostics.Debugger.Break();
        SaveData();
    }
}

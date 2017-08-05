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

public partial class module_master_appemppermitdtl : BasePage
{
    private static string _RoleCode = "B100085";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
               LoadData();
        }
    }

    private void LoadData()
    {
        EmpPermitDAL _dalEmployee = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmployee = new EmpPermitDAL();
            _htParameters = new Hashtable();            
            if (Request.Params["action"] == "edt")
            {
                _htParameters["p_ID"] = Request.Params["id"];
                DataTable _dt = _dalEmployee.GetRow(_htParameters);
                MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);                
            }      
            
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }   

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("appemppermitlst.aspx");
    }    
    #endregion

}

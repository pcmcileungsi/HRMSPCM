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
public partial class module_sysadmin_master_lstblroundingdetail : BasePage
{
    private static string _RoleCode = "P000468";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            Shared.BindCurrency(ddlCurrency);
            if (Request.Params["action"].Equals("edt"))
                LoadData();
            
        }
    }

    private void LoadData()
    {
        LStblRoundingDAL _dalLSTblRounding = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();

            _dalLSTblRounding = new LStblRoundingDAL();
            _htParameters = new Hashtable();

            _htParameters["p_ls_tblroundingid"] = Request.Params["id"];
            DataTable _dt = _dalLSTblRounding.GetRow(_htParameters);

            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
            string roundto = _dt.Rows[0]["ROUND_TO"].ToString();

            if (roundto.Equals("0.01"))
                ddlRoundTo.SelectedIndex = 0;
            else if (roundto.Equals("0.1"))
                ddlRoundTo.SelectedIndex = 1;
            else if (roundto.Equals("0.5"))
                ddlRoundTo.SelectedIndex = 2;
            else if (roundto.Equals("1.00"))
                ddlRoundTo.SelectedIndex = 3;
            else if (roundto.Equals("10.00"))
                ddlRoundTo.SelectedIndex = 4;
            else if (roundto.Equals("100.00"))
                ddlRoundTo.SelectedIndex = 5;
            else if (roundto.Equals("1000.00"))
                ddlRoundTo.SelectedIndex = 6;
            else if (roundto.Equals("10000.00"))
                ddlRoundTo.SelectedIndex = 7;

            
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        LStblRoundingDAL _dalLSTblRounding = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalLSTblRounding = new LStblRoundingDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalLSTblRounding.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalLSTblRounding.Update(_htParameters);
                iNextID = Int32.Parse(lblLSTBLROUNDINGID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "lstblroundingdetail.aspx?action=edt&id="+iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstblroundinglist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion
}

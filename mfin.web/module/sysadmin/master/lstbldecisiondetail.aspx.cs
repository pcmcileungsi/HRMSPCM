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

public partial class module_sysadmin_master_lstbldecisiondetail : BasePage
{
    private static string _RoleCode = "P000465";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        txtUsername.Text = Request.Params["username"];
        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            Shared.BindCurrency(ddlCurrency);
            txtEffDate.Text = Utility.CurrentDate;
            if (Request.Params["action"].Equals("edt"))
                LoadData();
        }
    }

    private void LoadData()
    {
        LStblDecisionDAL _dalLStblDecisionDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblDecisionDAL = new LStblDecisionDAL();
            _htParameters = new Hashtable();

            _htParameters["p_ls_tbldecisionid"] = Request.Params["id"];
            DataTable _dt = _dalLStblDecisionDAL.GetRow(_htParameters);

            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        LStblDecisionDAL _dalLStblDecisionDAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalLStblDecisionDAL = new LStblDecisionDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);
            _htParameters["p_userlogin"] = txtUsername.Text;
            _htParameters["p_username"] = txtUsername.Text;

            if (Request.Params["action"] == "add")
            {
                _dalLStblDecisionDAL.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalLStblDecisionDAL.Update(_htParameters);
                iNextID = Int32.Parse(lblLSTBLDECISIONID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "lstbldecisionsublist.aspx?action=edt&id=" + iNextID.ToString() + "&username=" + txtUsername.Text);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstbldecisionsublist.aspx?username=" + txtUsername.Text);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion
}

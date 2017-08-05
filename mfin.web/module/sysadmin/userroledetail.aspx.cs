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
using MFin.DataAccessLayer;

public partial class module_sysadmin_userroledetail : BasePage
{
    private static string _RoleCode = "B100001";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            Shared.BindDDLCompany(ddlCCODE);
            //Shared.BindDDLDivisi(ddlDIVISI);
            Shared.BindDDLUsergroup(ddlUSERGROUP);

            txtUSER_ID.Text = Request.Params["userid"];

            if (Request.Params["action"] == "edt")
            {
                LoadData();
            }
        }
    }

    private void SaveData()
    {
        MasterUserCompanyGroupDAL _dal = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        //System.Diagnostics.Debugger.Break();
        try
        {
            _dal = new MasterUserCompanyGroupDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);
            _htParameters["p_user_id"] = txtUSER_ID.Text;
            if (Request.Params["action"] == "add")
            {
                _dal.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _htParameters["p_id"] = Request.Params["id"];
                //_htParameters["p_user_id_baru"] = txtUSER_ID.Text;
                _dal.Update(_htParameters);
                iNextID=Int32.Parse(Request.Params["id"]);
            }
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "userdetail.aspx?action=edt&id=" + txtUSER_ID.Text);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    protected void LoadData()
    {
        MasterUserCompanyGroupDAL _dal = null;
        Hashtable _htParameters = null;

        try
        {
            _dal = new MasterUserCompanyGroupDAL();
            _htParameters = new Hashtable();

            _htParameters["p_id"] = Request.Params["id"];
            DataTable _dt = _dal.GetRow(_htParameters);

            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }
    #region toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("userdetail.aspx?action=edt&id="+txtUSER_ID.Text);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //System.Diagnostics.Debugger.Break();
        SaveData();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //Response.Redirect("userroledetail.aspx?action=add");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //BindData();
    }
    
    #endregion
}

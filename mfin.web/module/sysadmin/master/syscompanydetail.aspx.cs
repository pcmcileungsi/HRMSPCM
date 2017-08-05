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

public partial class module_sysadmin_master_syscompanydetail : BasePage
{
    //private static string _RoleCode = "P000472";
    private static string _RoleCode = "B100019";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            if (Request.Params["action"].Equals("edt"))
                LoadData();
        }
    }
    
    private void LoadData()
    {
        SysCompanyDAL _dalSysCompany = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysCompany = new SysCompanyDAL();
            _htParameters = new Hashtable();

            _htParameters["p_sys_companyid"] = Request.Params["id"];
            DataTable _dt = _dalSysCompany.GetRow(_htParameters);

            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        SysCompanyDAL _dalSysCompany = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalSysCompany = new SysCompanyDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalSysCompany.Insert(_htParameters, ref iNextID);
                if (iNextID == 0) Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE + "Data Sudah Ada", null, null);

            }
            else
            {
                _dalSysCompany.Update(_htParameters);
                iNextID = Int32.Parse(lblSYSCOMPANY.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "syscompanydetail.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region PopUpDireksi
    //-------------------------- asfor Direksi 20161215_Anas -------------------------------------------
    private void BindGridPopUpDireksi()
    {
        EmployeeDAL _dalEmployeeDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmployeeDAL = new EmployeeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchDireksi.Text;
            _htParameters["p_status"] = "1";
            string abc = Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString();
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            }
            gvwListDireksi.DataSource = _dalEmployeeDAL.GetRows(_htParameters);
            gvwListDireksi.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchDireksi_Click(object sender, EventArgs e)
    {
        BindGridPopUpDireksi();
    }
    protected void BtnLookUpDireksi_Click(object sender, EventArgs e)
    {        
        BindGridPopUpDireksi();
        upnDetailGetDireksi.Update();
        mdlPopupGetDireksi.Show();
    }
    protected void gvwListDireksi_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtDireksi_Code.Text = gvwListDireksi.SelectedDataKey[0].ToString();
        txtDireksi_Name.Text = gvwListDireksi.SelectedDataKey[1].ToString();

        upnDetailGetDireksi.Update();
        mdlPopupGetDireksi.Hide();
    }
    protected void gvwListDireksi_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    protected void gvwListDireksi_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListDireksi.PageIndex = e.NewPageIndex;
        BindGridPopUpDireksi();
    }
    //------------------------- end Direksi ---------------------------------------------------------
    #endregion

    #region PopUpHRD
    //-------------------------- asfor HRD 20161215_Anas -------------------------------------------
    private void BindGridPopUpHRD()
    {
        EmployeeDAL _dalEmployeeDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmployeeDAL = new EmployeeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchHRD.Text;
            _htParameters["p_status"] = "1";
            string abc = Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString();
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            }
            gvwListHRD.DataSource = _dalEmployeeDAL.GetRows(_htParameters);
            gvwListHRD.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchHRD_Click(object sender, EventArgs e)
    {
        BindGridPopUpHRD();
    }
    protected void BtnLookUpHRD_Click(object sender, EventArgs e)
    {
        BindGridPopUpHRD();
        upnDetailGetHRD.Update();
        mdlPopupGetHRD.Show();
    }
    protected void gvwListHRD_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtHRD_Code.Text = gvwListHRD.SelectedDataKey[0].ToString();
        txtHRD_Name.Text = gvwListHRD.SelectedDataKey[1].ToString();

        upnDetailGetHRD.Update();
        mdlPopupGetHRD.Hide();
    }
    protected void gvwListHRD_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    protected void gvwListHRD_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListHRD.PageIndex = e.NewPageIndex;
        BindGridPopUpHRD();
    }
    //------------------------- end HRD ---------------------------------------------------------
    #endregion

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("syscompanylist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion
}

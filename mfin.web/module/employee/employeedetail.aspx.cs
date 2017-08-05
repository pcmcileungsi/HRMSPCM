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

public partial class module_master_employeedetail : BasePage
{
    //private static string _RoleCode = "P000468";
    private static string _RoleCode = "B100049";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            Shared.BindDDLHRMSReligion(ddlEmployee_ReligionCode);
            Shared.BindDDLHRMSBranch(ddlEmployee_BranchCode);
            Shared.BindDDLHRMSDept(ddlEmployee_DeptCode);
            Shared.BindDDLHRMSGrade(ddlEmployee_GradeCode);
            //Shared.BindDDLHRMSLeader(ddlEmployee_LeaderCode);            
            if (Request.Params["action"].Equals("edt"))
            {
                LoadData();
                //Shared.BindDDLHRMSUser(ddlUser_ID, Request.Params["id"]);
            }
            else
            {
                //Shared.BindDDLHRMSUser(ddlUser_ID, "0");
            }
                
        }
    }

    private void LoadData()
    {
        EmployeeDAL _dalEmployee = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();

            _dalEmployee = new EmployeeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_Employee_ID"] = Request.Params["id"];
            DataTable _dt = _dalEmployee.GetRow(_htParameters);
            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                txtEmployee_NIK.Enabled = false;
                txtEmployee_Name.Enabled = false;
                txtEmployee_JoinDate.Enabled = false;
                txtEmployee_Email.Enabled = false;
                ddlEmployee_BranchCode.Enabled = false;
                ddlEmployee_DeptCode.Enabled = false;
                ddlEmployee_GradeCode.Enabled = false;
                ImageButton1.Enabled = false;
                imgBtnLookUpEmployee.Enabled = false;
                imgBtnLookUpEmployee2.Enabled = false;
                ddlEmployee_Status.Enabled = false;
            }
            else
            {
                txtEmployee_NIK.Enabled = true;
                txtEmployee_Name.Enabled = true;
                txtEmployee_JoinDate.Enabled = true;
                txtEmployee_Email.Enabled = true;
                ddlEmployee_BranchCode.Enabled = true;
                ddlEmployee_DeptCode.Enabled = true;
                ddlEmployee_GradeCode.Enabled = true;
                ImageButton1.Enabled = true;
                imgBtnLookUpEmployee.Enabled = true;
                imgBtnLookUpEmployee2.Enabled = true;
                ddlEmployee_Status.Enabled = true;
            }
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        EmployeeDAL _dalEmployee = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalEmployee = new EmployeeDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalEmployee.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalEmployee.Update(_htParameters);
                iNextID = Int32.Parse(lblEmployee_ID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "Employeedetail.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Employeelist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion

    #region PopUpUser
    //-------------------------- asfor User 20161215_Anas -------------------------------------------
    private void BindGridPopUpUser()
    {
        MasterUserDAL _dalMasterUserDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMasterUserDAL = new MasterUserDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchUser.Text;
            _htParameters["p_status"] = "1";

            if (Request.Params["action"].Equals("edt"))
            {
                _htParameters["p_Employee_ID"] = Request.Params["id"];                             
            }
            else
            {
                _htParameters["p_Employee_ID"] = 0;
            }          

            gvwListUser.DataSource = _dalMasterUserDAL.GetRowsUserforHRMS(_htParameters);
            gvwListUser.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchUser_Click(object sender, EventArgs e)
    {
        BindGridPopUpUser();
    }
    protected void BtnLookUpUser_Click(object sender, EventArgs e)
    {
        BindGridPopUpUser();
        upnDetailGetUser.Update();
        mdlPopupGetUser.Show();
    }
    protected void gvwListUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtUser_ID.Text = gvwListUser.SelectedDataKey[0].ToString();
        txtUser_Name.Text = gvwListUser.SelectedDataKey[1].ToString();

        upnDetailGetUser.Update();
        mdlPopupGetUser.Hide();
    }
    protected void gvwListUser_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListUser.PageIndex = e.NewPageIndex;
        BindGridPopUpUser();
    }
    //------------------------- end User ---------------------------------------------------------
    #endregion

    #region PopUpLeader1
    //-------------------------- asfor Employee 20161215_Anas -------------------------------------------
    private void BindGridPopUp()
    {
        EmployeeDAL _dalEmployee = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmployee = new EmployeeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchEmployee.Text;
            _htParameters["p_status"] = "1";
            //string abc = Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString();
            //if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "2")
            //{
            //    _htParameters["p_Employee_Code"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            //}
            gvwListEmployee.DataSource = _dalEmployee.GetRows(_htParameters);
            gvwListEmployee.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchEmployee_Click(object sender, EventArgs e)
    {
        BindGridPopUp();
    }
    protected void BtnLookUpEmployee_Click(object sender, EventArgs e)
    {       
        BindGridPopUp();
        upnDetailGetEmployee.Update();
        mdlPopupGetEmployee.Show();
    }
    protected void gvwListEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtEmployee_LeaderCode.Text = gvwListEmployee.SelectedDataKey[0].ToString();
        txtEmployee_LeaderName.Text = gvwListEmployee.SelectedDataKey[1].ToString();

        upnDetailGetEmployee.Update();
        mdlPopupGetEmployee.Hide();
    }
    protected void gvwListEmployee_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListEmployee.PageIndex = e.NewPageIndex;
        BindGridPopUp();
    }
    //------------------------- end Employee ---------------------------------------------------------
    #endregion

    #region PopUpLeader2
    //-------------------------- asfor PopUpLeader2 20170321_Anas -------------------------------------------
    private void BindGridPopUpLeader2()
    {
        EmployeeDAL _dalEmployee = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmployee = new EmployeeDAL();
            _htParameters = new Hashtable();
            _htParameters["p_keywords"] = txtSearchEmployee.Text;
            _htParameters["p_status"] = "1";
            gvwListEmployee2.DataSource = _dalEmployee.GetRows(_htParameters);
            gvwListEmployee2.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchEmployee2_Click(object sender, EventArgs e)
    {
        BindGridPopUpLeader2();
    }
    protected void BtnLookUpEmployee2_Click(object sender, EventArgs e)
    {
        BindGridPopUpLeader2();
        upnDetailGetEmployee2.Update();
        mdlPopupGetEmployee2.Show();
    }
    protected void gvwListEmployee2_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtEmployee_LeaderCode2.Text = gvwListEmployee2.SelectedDataKey[0].ToString();
        txtEmployee_LeaderName2.Text = gvwListEmployee2.SelectedDataKey[1].ToString();

        upnDetailGetEmployee2.Update();
        mdlPopupGetEmployee2.Hide();
    }
    protected void gvwListEmployee2_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListEmployee2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListEmployee2.PageIndex = e.NewPageIndex;
        BindGridPopUpLeader2();
    }
    //------------------------- end Employee ---------------------------------------------------------
    #endregion
}

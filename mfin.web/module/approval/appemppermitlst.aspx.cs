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
public partial class module_form_appemppermitlst : BasePage
{
    private static string _RoleCode = "B100085";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            lblEmployee_Code.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            BindGrid();
            BindGridApproved();
            BindGridRejected();
        }
    }
    
    #region Toolbar
    protected int approvemtd(String _pass)
    {
        try
        {
            MasterUserDAL _dalMasterUser = new MasterUserDAL();
            Hashtable _htParameters = new Hashtable();

            _htParameters["p_user_id"] = Utility.CurrentUID;
            _htParameters["p_user_password"] = _pass;

            DataTable _dt = _dalMasterUser.Validate(_htParameters);
            if (_dt.Rows.Count > 0) return 1;
            else return 0;
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, "Wrong Password, or unauthorized user", ex, null);
            return 0;
        }
    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        mdlPopupApproveValidate.Show();
    }

    protected void btnApproval_Click(object sender, EventArgs e)
    {
        mdlPopupApproveValidate.Hide();
        if (approvemtd(txtPassword.Text) == 1)
        {
            EmpPermitDAL _dalEmpPermit = new EmpPermitDAL();
            Hashtable _htParameters = new Hashtable();

            foreach (GridViewRow row in gvwList.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                    if (chb.Checked)
                    {
                        try
                        {
                            _htParameters.Clear();

                            _htParameters["p_id"] = Int32.Parse(gvwList.DataKeys[row.RowIndex][0].ToString());
                            _htParameters["p_Employee_Code"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
                            _dalEmpPermit.Approve(_htParameters);
                        }
                        catch (Exception ex)
                        {
                            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
                        }
                    }
                }
            }
            BindGrid();
            BindGridApproved();
            BindGridRejected();
        }
        else Utility.ShowMessageBox(this, "Wrong Password, or unauthorized user", null, null);
    }
     
    protected void btnReject_Click(object sender, EventArgs e)
    {
        mdlPopupRejectValidate.Show();
    }

    protected void btnRejection_Click(object sender, EventArgs e)
    {
        mdlPopupRejectValidate.Hide();
        if (approvemtd(txtPasswordReject.Text) == 1)
        {
            EmpPermitDAL _dalEmpPermit = new EmpPermitDAL();
            Hashtable _htParameters = new Hashtable();

            foreach (GridViewRow row in gvwList.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                    if (chb.Checked)
                    {
                        try
                        {
                            _htParameters.Clear();

                            _htParameters["p_id"] = Int32.Parse(gvwList.DataKeys[row.RowIndex][0].ToString());
                            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
                            _dalEmpPermit.Reject(_htParameters);
                        }
                        catch (Exception ex)
                        {
                            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
                        }
                    }
                }
            }
            BindGrid();
            BindGridApproved();
            BindGridRejected();
        }
        else Utility.ShowMessageBox(this, "Wrong Password, or unauthorized user", null, null);
    }
   
    #endregion
       
    #region GridView
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
    private void BindGrid()
    {
        EmpPermitDAL _dalEmpPermit = null;
        Hashtable _htParameters = null;
        try
        {
            _dalEmpPermit = new EmpPermitDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;
            _htParameters["p_status"] = "0"; 
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;   

            gvwList.DataSource = _dalEmpPermit.GetRowsApproval(_htParameters);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void gvwList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("appemppermitdtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
            case "Delete":
                EmpPermitDAL _dalEmpPermit = null;
                Hashtable _htParameters = null;

                try
                {
                    _dalEmpPermit = new EmpPermitDAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_ID"] = e.CommandArgument.ToString();

                    _dalEmpPermit.Delete(_htParameters);
                    this.BindGrid();
                    Response.Redirect("emppermitlst.aspx");

                }
                catch (Exception ex)
                {
                    Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
                }
                break;
        }
    }
    protected void gvwList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("lstblroundingdetail.aspx?action=edt&id=" + gvwList.SelectedDataKey[0].ToString());
    }

    protected void gvwList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void gvwList_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = gvwList.DataKeys[e.Row.RowIndex].Value.ToString();
            //_btn = (ImageButton)e.Row.FindControl("btnDelete");
            //_btn.CommandArgument = gvwList.DataKeys[e.Row.RowIndex].Value.ToString();

            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    #endregion

    #region GridViewApproved
    protected void btnSearchApproved_Click(object sender, EventArgs e)
    {
        BindGridApproved();
    }

    private void BindGridApproved()
    {
        EmpPermitDAL _dalEmpPermit = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpPermit = new EmpPermitDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchApproved.Text;
            _htParameters["p_status"] = "1";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            gvwListApproved.DataSource = _dalEmpPermit.GetRowsApproval(_htParameters);
            gvwListApproved.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void gvwListApproved_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("appemppermitdtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
        }
    } 

    protected void gvwListApproved_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListApproved.PageIndex = e.NewPageIndex;
        BindGridApproved();
    }

    protected void gvwListApproved_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = gvwListApproved.DataKeys[e.Row.RowIndex].Value.ToString();


            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    #endregion

    #region GridViewRejected
    protected void btnSearchRejected_Click(object sender, EventArgs e)
    {
        BindGridRejected();
    }

    private void BindGridRejected()
    {
        EmpPermitDAL _dalEmpPermit = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpPermit = new EmpPermitDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchRejected.Text;
            _htParameters["p_status"] = "9";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            gvwListRejected.DataSource = _dalEmpPermit.GetRowsApproval(_htParameters);
            gvwListRejected.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void gvwListRejected_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("appemppermitdtl.aspx?action=edt&id=" + e.CommandArgument.ToString());
                break;
        }
    }

    protected void gvwListRejected_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListRejected.PageIndex = e.NewPageIndex;
        BindGridRejected();
    }

    protected void gvwListRejected_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = gvwListRejected.DataKeys[e.Row.RowIndex].Value.ToString();


            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    #endregion

}

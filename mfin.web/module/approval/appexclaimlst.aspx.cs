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
using MFin.DataAccessLayer.Security;

using MFin.DataAccessLayer.Master;
public partial class module_approval_appexclaimlst : BasePage
{
    private static string _RoleCode = "B100103";

    #region Load
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            lblEmployee_Code.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            BindGridHRD();
            BindGridAtasan1();
            BindGridAtasan2();
            BindGridApproved();
            BindGridRejected();
            switch (Request.Params["page"])
            {
                case "0":
                    Response.Redirect("appexclaimlst.aspx?action=edt&id=" + Request.Params["id"] + "#page-0");
                    break;
                case "1":
                    Response.Redirect("appexclaimlst.aspx?action=edt&id=" + Request.Params["id"] + "#page-1");
                    break;
                case "2":
                    Response.Redirect("appexclaimlst.aspx?action=edt&id=" + Request.Params["id"] + "#page-2");
                    break;
                case "3":
                    Response.Redirect("appexclaimlst.aspx?action=edt&id=" + Request.Params["id"] + "#page-3");
                    break;
                case "4":
                    Response.Redirect("appexclaimlst.aspx?action=edt&id=" + Request.Params["id"] + "#page-4");
                    break;
            }
        }
    }
    #endregion

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

    private void Approve_Claim(GridView grv, string TabKe)
    {
        mdlPopupApproveValidate.Hide();
        if (approvemtd(txtPassword.Text) == 1)
        {
            EmpExclaimDAL _dalEmpExclaimDAL = new EmpExclaimDAL();
            Hashtable _htParameters = new Hashtable();
            int adaData = 0;
            foreach (GridViewRow row in grv.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                    if (chb.Checked)
                    {
                        try
                        {
                            _htParameters.Clear();

                            _htParameters["p_id"] = Int32.Parse(grv.DataKeys[row.RowIndex][0].ToString());
                            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
                            _dalEmpExclaimDAL.Approve(_htParameters);
                            adaData = +1;
                        }
                        catch (Exception ex)
                        {
                            Utility.ShowMessageBox(this, Utility.APPROVE_DATA_FAIL_MESSAGE, ex, null);
                        }
                    }
                }
            }
            if (adaData > 0)
            {
                Utility.ShowMessageBox(this, Utility.APPROVE_DATA_SUCCESS_MESSAGE, null, "appexclaimlst.aspx?action=edt&page=" + TabKe + "&id=" + Request.Params["id"]);
            }
        }
        else
        {
            Utility.ShowMessageBox(this, "Wrong Password, or unauthorized user", null, null);
            mdlPopupApproveValidate.Hide();
        }
    }

    protected void btnApproval_Click(object sender, EventArgs e)
    {
        if (lblAproveType.Text == "0")
        {
            Approve_Claim(gvwListHRD,"0");
        }
        else if (lblAproveType.Text == "1")
        {
            Approve_Claim(gvwListAtasan1, "1");
        }
        else if (lblAproveType.Text == "2")
        {
            Approve_Claim(gvwListAtasan2, "2");
        }
        else if (lblAproveType.Text == "3")
        {
            Approve_Claim(gvwListApproved, "3");
        }
        else if (lblAproveType.Text == "9")
        {
            Approve_Claim(gvwListRejected, "4");
        }
    }

    protected void btnRejection_Click(object sender, EventArgs e)
    {
        if (lblAproveType.Text == "0")
        {
            Reject_Claim(gvwListHRD, "0");
        }
        else if (lblAproveType.Text == "1")
        {
            Reject_Claim(gvwListAtasan1, "1");
        }
        else if (lblAproveType.Text == "2")
        {
            Reject_Claim(gvwListAtasan2, "2");
        }
        else if (lblAproveType.Text == "3")
        {
            Reject_Claim(gvwListApproved, "3");
        }
        else if (lblAproveType.Text == "9")
        {
            Reject_Claim(gvwListRejected, "4");
        }
    }

    private void Reject_Claim(GridView grv, string TabKe)
    {
        mdlPopupRejectValidate.Hide();
        if (approvemtd(txtPasswordReject.Text) == 1)
        {
            int adaData = 0;
            EmpExclaimDAL _dalEmpExclaimDAL = new EmpExclaimDAL();
            Hashtable _htParameters = new Hashtable();

            foreach (GridViewRow row in grv.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                    if (chb.Checked)
                    {
                        try
                        {
                            _htParameters.Clear();

                            _htParameters["p_id"] = Int32.Parse(grv.DataKeys[row.RowIndex][0].ToString());
                            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
                            _dalEmpExclaimDAL.Reject(_htParameters);
                            adaData = +1;
                        }
                        catch (Exception ex)
                        {
                            Utility.ShowMessageBox(this, Utility.REJECT_DATA_FAIL_MESSAGE, ex, null);
                        }
                    }
                }
            }
            if (adaData > 0)
            {
                Utility.ShowMessageBox(this, Utility.REJECT_DATA_SUCCESS_MESSAGE, null, "appexclaimlst.aspx?action=edt&page=" + TabKe + "&id=" + Request.Params["id"]);
            }            
        }
        else
        {
            Utility.ShowMessageBox(this, "Wrong Password, or unauthorized user", null, null);
            mdlPopupRejectValidate.Hide();
        }
    }
    #endregion
       
    #region GridViewHRD

    protected void btnApproveHRD_Click(object sender, EventArgs e)
    {
        mdlPopupApproveValidate.Show();
        lblAproveType.Text = "0";
    }

    protected void btnRejectHRD_Click(object sender, EventArgs e)
    {
        mdlPopupRejectValidate.Show();
        lblAproveType.Text = "0";
    }

    protected void chbSelectAllHRD_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwListHRD.Rows)
        {
            CheckBox _cb = (CheckBox)row.Cells[1].FindControl("chbSelectHRD");
            _cb.Checked = ((CheckBox)sender).Checked;
        }
    }
    protected void btnSearchHRD_Click(object sender, EventArgs e)
    {
        BindGridHRD();
    }

    private void BindGridHRD()
    {
        EmpExclaimDAL _dalEmpExclaim = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpExclaim = new EmpExclaimDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchHRD.Text;
            _htParameters["p_status"] = "0";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;

            gvwListHRD.DataSource = _dalEmpExclaim.GetRowsApproval(_htParameters);
            gvwListHRD.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void gvwListHRD_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("appexclaimdtl.aspx?action=edt&id=" + e.CommandArgument);
                break;            
        }
    }

    protected void gvwListHRD_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("appexclaimdtl.aspx?action=edt&id=" + gvwListHRD.SelectedDataKey[0].ToString());
    }

    protected void gvwListHRD_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListHRD.PageIndex = e.NewPageIndex;
        BindGridHRD();
    }

    protected void gvwListHRD_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = gvwListHRD.DataKeys[e.Row.RowIndex].Value.ToString();
           
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    #endregion

    #region GridViewAtasan1

    protected void btnApproveAtasan1_Click(object sender, EventArgs e)
    {
        mdlPopupApproveValidate.Show();
        lblAproveType.Text = "1";
    }

    protected void btnRejectAtasan1_Click(object sender, EventArgs e)
    {
        mdlPopupRejectValidate.Show();
        lblAproveType.Text = "1";
    }

    protected void chbSelectAllAtasan1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwListAtasan1.Rows)
        {
            CheckBox _cb = (CheckBox)row.Cells[1].FindControl("chbSelectAtasan1");
            _cb.Checked = ((CheckBox)sender).Checked;
        }
    }
    protected void btnSearchAtasan1_Click(object sender, EventArgs e)
    {
        BindGridAtasan1();
    }

    private void BindGridAtasan1()
    {
        EmpExclaimDAL _dalEmpExclaim = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpExclaim = new EmpExclaimDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchAtasan1.Text;
            _htParameters["p_status"] = "1";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;

            gvwListAtasan1.DataSource = _dalEmpExclaim.GetRowsApproval(_htParameters);
            gvwListAtasan1.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void gvwListAtasan1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("appexclaimdtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
        }
    }

    protected void gvwListAtasan1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("appexclaimdtl.aspx?action=edt&id=" + gvwListAtasan1.SelectedDataKey[0].ToString());
    }

    protected void gvwListAtasan1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListAtasan1.PageIndex = e.NewPageIndex;
        BindGridAtasan1();
    }

    protected void gvwListAtasan1_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = gvwListAtasan1.DataKeys[e.Row.RowIndex].Value.ToString();

            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    #endregion

    #region GridViewAtasan2

    protected void btnApproveAtasan2_Click(object sender, EventArgs e)
    {
        mdlPopupApproveValidate.Show();
        lblAproveType.Text = "2";
    }

    protected void btnRejectAtasan2_Click(object sender, EventArgs e)
    {
        mdlPopupRejectValidate.Show();
        lblAproveType.Text = "2";
    }

    protected void chbSelectAllAtasan2_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvwListAtasan2.Rows)
        {
            CheckBox _cb = (CheckBox)row.Cells[1].FindControl("chbSelectAtasan2");
            _cb.Checked = ((CheckBox)sender).Checked;
        }
    }
    protected void btnSearchAtasan2_Click(object sender, EventArgs e)
    {
        BindGridAtasan2();
    }

    private void BindGridAtasan2()
    {
        EmpExclaimDAL _dalEmpExclaim = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpExclaim = new EmpExclaimDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchAtasan2.Text;
            _htParameters["p_status"] = "2";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;

            gvwListAtasan2.DataSource = _dalEmpExclaim.GetRowsApproval(_htParameters);
            gvwListAtasan2.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void gvwListAtasan2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("appexclaimdtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
        }
    }

    protected void gvwListAtasan2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("appexclaimdtl.aspx?action=edt&id=" + gvwListAtasan2.SelectedDataKey[0].ToString());
    }

    protected void gvwListAtasan2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListAtasan2.PageIndex = e.NewPageIndex;
        BindGridAtasan2();
    }

    protected void gvwListAtasan2_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = gvwListAtasan2.DataKeys[e.Row.RowIndex].Value.ToString();

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
        EmpExclaimDAL _dalEmpExclaim = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpExclaim = new EmpExclaimDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchApproved.Text;
            _htParameters["p_status"] = "3";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;

            gvwListApproved.DataSource = _dalEmpExclaim.GetRowsApproval(_htParameters);
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
                Response.Redirect("appexclaimdtl.aspx?action=edt&id=" + e.CommandArgument);
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
        EmpExclaimDAL _dalEmpExclaim = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpExclaim = new EmpExclaimDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchRejected.Text;
            _htParameters["p_status"] = "9";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;

            gvwListRejected.DataSource = _dalEmpExclaim.GetRowsApproval(_htParameters);
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
                Response.Redirect("appexclaimdtl.aspx?action=edt&id=" + e.CommandArgument.ToString());
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


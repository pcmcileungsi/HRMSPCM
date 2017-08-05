using System;
using System.Collections;
using System.Collections.Generic;
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
public partial class module_approval_appspdlst : BasePage
{
    private static string _RoleCode = "B100097";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            lblEmployee_Code.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            BindGrid();
            BindGridHRD();
            BindGridApproved();
            BindGridApproved2();
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
        lblAproveType.Text = "0";
    }

    protected void btnReject_Click(object sender, EventArgs e)
    {
        mdlPopupRejectValidate.Show();
        lblAproveType.Text = "0";
    }

    protected void btnApprove1_Click(object sender, EventArgs e)
    {
        mdlPopupApproveValidate.Show();
        lblAproveType.Text = "1";
    }

    protected void btnReject1_Click(object sender, EventArgs e)
    {
        mdlPopupRejectValidate.Show();
        lblAproveType.Text = "1";
    }

    protected void btnApprove2_Click(object sender, EventArgs e)
    {
        mdlPopupApproveValidate.Show();
        lblAproveType.Text = "2";
    }

    protected void btnReject2_Click(object sender, EventArgs e)
    {
        mdlPopupRejectValidate.Show();
        lblAproveType.Text = "2";
    }

    private void Approve_SPD(GridView grv)
    {
        mdlPopupApproveValidate.Hide();
        if (approvemtd(txtPassword.Text) == 1)
        {
            EmpSPDDAL _dalEmpSPDDAL = new EmpSPDDAL();
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
                            _dalEmpSPDDAL.Approve(_htParameters);
                        }
                        catch (Exception ex)
                        {
                            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
                        }
                    }
                }
            }
            BindGrid();
            BindGridHRD();
            BindGridApproved();
            BindGridApproved2();
            BindGridRejected();
        }
        else Utility.ShowMessageBox(this, "Wrong Password, or unauthorized user", null, null);
    }

    protected void btnApproval_Click(object sender, EventArgs e)
    {
        if (lblAproveType.Text=="0")
        {
            Approve_SPD(gvwList);
        } 
        else if (lblAproveType.Text == "1")
        {
            Approve_SPD(gvwListHRD);
        }
        else if (lblAproveType.Text == "2")
        {
            Approve_SPD(gvwListApproved);
        }
        else if (lblAproveType.Text == "3")
        {
            Approve_SPD(gvwListApproved2);
        }
        else if (lblAproveType.Text == "9")
        {
            Approve_SPD(gvwListRejected);
        }
    }   

    protected void btnRejection_Click(object sender, EventArgs e)
    {
        mdlPopupRejectValidate.Hide();
        if (approvemtd(txtPasswordReject.Text) == 1)
        {
            EmpSPDDAL _dalEmpSPDDAL = new EmpSPDDAL();
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
                            _dalEmpSPDDAL.Reject(_htParameters);
                        }
                        catch (Exception ex)
                        {
                            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
                        }
                    }
                }
            }
            BindGrid();
            BindGridHRD();
            BindGridApproved();
            BindGridApproved2();
            BindGridRejected();
        }
        else Utility.ShowMessageBox(this, "Wrong Password, or unauthorized user", null, null);
    }

    #endregion
       
    #region GridViewHRD
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
    private void BindGrid()
    {
        EmpSPDDAL _dalEmpSPD = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpSPD = new EmpSPDDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;
            _htParameters["p_status"] = "0";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            gvwList.DataSource = _dalEmpSPD.GetRowsApproval(_htParameters);
            gvwList.DataBind();

            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "2")
            {
                btnApprove.Visible = true;
                btnReject.Visible = true;
            }
            else
            {
                btnApprove.Visible = false;
                btnReject.Visible = false;
            }   
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
                Response.Redirect("appspddtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
            case "Delete":
                EmpSPDDAL _dalEmpSPD = null;
                Hashtable _htParameters = null;

                try
                {
                    _dalEmpSPD = new EmpSPDDAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_ID"] = e.CommandArgument.ToString();

                    _dalEmpSPD.Delete(_htParameters);
                    this.BindGrid();
                    Response.Redirect("appspdlst.aspx");

                }
                catch (Exception ex)
                {
                    Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null,null);

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
          
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    #endregion

    #region GridViewAtasan1
    protected void btnSearchHRD_Click(object sender, EventArgs e)
    {
        BindGridHRD();
    }

    private void BindGridHRD()
    {
        EmpSPDDAL _dalEmpSPD = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpSPD = new EmpSPDDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchHRD.Text;
            _htParameters["p_status"] = "1";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            gvwListHRD.DataSource = _dalEmpSPD.GetRowsApproval(_htParameters);
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
                Response.Redirect("appspddtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
        }
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

    #region GridViewAtasan2
    protected void btnSearchApproved_Click(object sender, EventArgs e)
    {
        BindGridApproved();
    }

    private void BindGridApproved()
    {
        EmpSPDDAL _dalEmpSPD = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpSPD = new EmpSPDDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchApproved.Text;
            _htParameters["p_status"] = "2";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            gvwListApproved.DataSource = _dalEmpSPD.GetRowsApproval(_htParameters);
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
                Response.Redirect("appspddtl.aspx?action=edt&id=" + e.CommandArgument);
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

    #region GridViewApproved
    protected void btnSearchApproved2_Click(object sender, EventArgs e)
    {
        BindGridApproved2();
    }

    private void BindGridApproved2()
    {
        EmpSPDDAL _dalEmpSPD = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpSPD = new EmpSPDDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchApproved2.Text;
            _htParameters["p_status"] = "3";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            gvwListApproved2.DataSource = _dalEmpSPD.GetRowsApproval(_htParameters);
            gvwListApproved2.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void gvwListApproved2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("appspddtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
        }
    }

    protected void gvwListApproved2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListApproved2.PageIndex = e.NewPageIndex;
        BindGridApproved2();
    }

    protected void gvwListApproved2_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = gvwListApproved2.DataKeys[e.Row.RowIndex].Value.ToString();


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
        EmpSPDDAL _dalEmpSPD = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpSPD = new EmpSPDDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchRejected.Text;
            _htParameters["p_status"] = "9";
            _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            gvwListRejected.DataSource = _dalEmpSPD.GetRowsApproval(_htParameters);
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
                Response.Redirect("appspddtl.aspx?action=edt&id=" + e.CommandArgument.ToString());
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

    #region Print
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Hashtable _htParameters = new Hashtable();
        IList listPDF = new ArrayList();       

        foreach (GridViewRow row in gvwListApproved.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                if (chb.Checked)
                {
                    try
                    {
                        //isi parameter
                        //counter_row++;
                        _htParameters.Clear();
                        _htParameters["p_user_id"] = Utility.CurrentUID;
                        _htParameters["p_ID"] = gvwListApproved.DataKeys[row.RowIndex][0].ToString();
                        // end isi parameter

                        // nama report yang dibuat di Crystal Report
                        string rptName = Server.MapPath(@"..\..\rpt\RPT_SPD_PERSONAL.rpt");

                        // nama pdf yang akan dicreate dan path nya
                        string pdfName = "RPT_SPD_PERSONAL" + Utility.CurrentUID + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf";
                        string pdfPath = Server.MapPath(@"..\..\temp\pdf\" + pdfName);
                        string filetype = "pdf";


                        // membuat pdf
                        //Utility.ExecuteReportHRMS(this, "sp_rpt_Personal_SPD", _htParameters, rptName, pdfPath, "RPT_SPD_PERSONAL");
                        Utility.ExecuteReport(this, "sp_rpt_Personal_SPD", _htParameters, rptName, pdfPath, "RPT_SPD_PERSONAL");
                        listPDF.Add(pdfPath);

                        // menampilkan pdf yang sudah dibuat
                        //if (counter_row == row_count)
                            ScriptManager.RegisterStartupScript(this, GetType(), "Report", "window.open('../../../temp/" + filetype + "/" + pdfName + "', 'Report', 'fullscreen=0,menubar=0,status=0,scrollbars=0,resizable=1,toolbar=0,width=600,height=400');", true);
                        //_htParameters["p_ls_applicationid"] = Int32.Parse(gvwList.DataKeys[row.RowIndex][0].ToString());


                    }
                    catch (Exception ex)
                    {
                        Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
                    }
                }
            }
        }        
    }

    #endregion
}

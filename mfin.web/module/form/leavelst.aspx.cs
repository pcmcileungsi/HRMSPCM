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
public partial class module_form_leavelst : BasePage
{
    //private static string _RoleCode = "P000468";
    private static string _RoleCode = "B100067";
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("leavedtl.aspx?action=add");
    }
   
    #endregion
       
    #region GridView
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
    private void BindGrid()
    {
        EmpLeaveDAL _dalEmpLeave = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpLeave = new EmpLeaveDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;
            _htParameters["p_status"] = "0";
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            }

            gvwList.DataSource = _dalEmpLeave.GetRows(_htParameters);
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
                Response.Redirect("leavedtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
            case "Delete":
                EmpLeaveDAL _dalEmpLeave = null;
                Hashtable _htParameters = null;

                try
                {
                    _dalEmpLeave = new EmpLeaveDAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_ID"] = e.CommandArgument.ToString();

                    _dalEmpLeave.Delete(_htParameters);
                    this.BindGrid();
                    Response.Redirect("leavelst.aspx");

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
            _btn = (ImageButton)e.Row.FindControl("btnDelete");
            _btn.CommandArgument = gvwList.DataKeys[e.Row.RowIndex].Value.ToString();

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
        EmpLeaveDAL _dalEmpLeave = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpLeave = new EmpLeaveDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchApproved.Text;
            _htParameters["p_status"] = "1";
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            }

            gvwListApproved.DataSource = _dalEmpLeave.GetRows(_htParameters);
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
                Response.Redirect("leavedtl.aspx?action=edt&id=" + e.CommandArgument);
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
        EmpLeaveDAL _dalEmpLeave = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpLeave = new EmpLeaveDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchRejected.Text;
            _htParameters["p_status"] = "9";
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            }

            gvwListRejected.DataSource = _dalEmpLeave.GetRows(_htParameters);
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
                Response.Redirect("leavedtl.aspx?action=edt&id=" + e.CommandArgument.ToString());
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

    #region print
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        //System.Diagnostics.Debugger.Break();
        Hashtable _htParameters = new Hashtable();
        int row_count = 0;
        int counter_row = 0;
        //ExportFormatType export = ExportFormatType.PortableDocFormat;
        //if (rboPrinterOption.SelectedValue.Equals("3"))
        //{
        //    export = ExportFormatType.Excel;
        //}
        //export = ExportFormatType.Excel;

        foreach (GridViewRow row in gvwListApproved.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                if (chb.Checked)
                {
                    row_count++;
                }
            }
        }
        //System.Diagnostics.Debugger.Break();
        foreach (GridViewRow row in gvwListApproved.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                if (chb.Checked)
                {
                    try
                    {

                        //System.Diagnostics.Debugger.Break();

                        //isi parameter
                        counter_row++;
                        _htParameters.Clear();
                        //MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
                        _htParameters["p_id"] = gvwListApproved.DataKeys[row.RowIndex][0].ToString(); //gvwList.Rows[row.RowIndex].Cells[2].Text.Trim();          //_htParameters["p_datefrom"] = txtDate.Text;
                        _htParameters["p_c_code"] = Session[SessionKey.CURRENT_ENTITY_SESSION_KEY].ToString().Trim();
                        _htParameters["p_user_id"] = Utility.CurrentUID.Trim();

                        if (counter_row == 1) _htParameters["p_flag"] = 1;
                        else _htParameters["p_flag"] = 0;

                        // nama report yang dibuat di Crystal Report
                        //string rptName = Server.MapPath(@"..\..\..\rpt\RPT_HRMS_EMPPERMIT.rpt");
                        string rptName = Server.MapPath(@"..\..\rpt\RPT_LEAVE_PERSONAL.rpt");

                        // nama pdf yang akan dicreate dan path nya
                        string pdfName = "RPT_LEAVE_PERSONAL" + Utility.CurrentUID + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf";
                        //string pdfPath = Server.MapPath(@"..\..\..\temp\pdf\" + pdfName);
                        string pdfPath = Server.MapPath(@"..\..\temp\pdf\" + pdfName);
                        string filetype = "pdf";


                        // membuat pdf
                        //Utility.ExecuteReport(this, "sp_rpt_emppermit", _htParameters, rptName, pdfPath, "RPT_HRMS_EMPPERMIT", export);
                        Utility.ExecuteReport(this, "sp_rpt_empleave", _htParameters, rptName, pdfPath, "RPT_LEAVE_PERSONAL");
                        //Utility.ExecuteReportHRMS(this, "sp_rpt_EmpSPD", _htParameters, rptName, pdfPath, "RPT_HRMS_SPD_DTL");
                        //listPDF.Add(pdfPath);

                        // menampilkan pdf yang sudah dibuat
                        if (counter_row == row_count)
                            ScriptManager.RegisterStartupScript(this, GetType(), "Report", "window.open('../../../temp/" + filetype + "/" + pdfName + "', 'Report', 'fullscreen=0,menubar=0,status=0,scrollbars=0,resizable=1,toolbar=0,width=600,height=400');", true);
                        //_htParameters["p_ls_applicationid"] = Int32.Parse(gvwList.DataKeys[row.RowIndex][0].ToString());
                    }
                    //  }
                    catch (Exception ex)
                    {
                        Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
                    }
                }
            }
        }
    }

    #endregion

    public void btnMail_Click(object sender, EventArgs e)
    {
        
        EmpLeaveDAL _dalEmpLeave = new EmpLeaveDAL();
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
                        _htParameters["p_ID"] = Int32.Parse(gvwList.DataKeys[row.RowIndex][0].ToString());
                        _htParameters["p_ACT"] = "LEV";
                        Utility.ApplyDefaultProp(_htParameters);
                        if (row.Cells[8].Text!="Send")
                        {
                            _dalEmpLeave.Mail(_htParameters);
                            Utility.ShowMessageBox(this, Utility.MAIL_SENDING_SUCCESS_MESSAGE, null, "leavelst.aspx");
                        }
                        else
                        {
                            Utility.ShowMessageBoxAnas(this, "Tidak dapat mengirim, <br>Status email saat ini sudah terkirim [send]", "Gagal");
                        } 
                        
                    }
                    catch (Exception ex)
                    {
                        Utility.ShowMessageBox(this, Utility.MAIL_SENDING_FAIL_MESSAGE, ex, null);
                    }
                }
            }
        }
    }


}

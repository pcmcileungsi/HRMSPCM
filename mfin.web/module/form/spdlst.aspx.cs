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
public partial class module_form_spdlst : BasePage
{
    private static string _RoleCode = "B100073";
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("spddtl.aspx?action=add");
    }
   
    #endregion
       
    #region GridView
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
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            }

            gvwList.DataSource = _dalEmpSPD.GetRows(_htParameters);
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
                Response.Redirect("spddtl.aspx?action=edt&id=" + e.CommandArgument);
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
                    Response.Redirect("spdlst.aspx");

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

    #region GridViewHRD
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
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            }

            gvwListHRD.DataSource = _dalEmpSPD.GetRows(_htParameters);
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
                Response.Redirect("spddtl.aspx?action=edt&id=" + e.CommandArgument);
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

    #region GridViewApproved
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
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            }

            gvwListApproved.DataSource = _dalEmpSPD.GetRows(_htParameters);
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
                Response.Redirect("spddtl.aspx?action=edt&id=" + e.CommandArgument);
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

    #region GridViewApproved2
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
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            }

            gvwListApproved2.DataSource = _dalEmpSPD.GetRows(_htParameters);
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
                Response.Redirect("spddtl.aspx?action=edt&id=" + e.CommandArgument);
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
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            }

            gvwListRejected.DataSource = _dalEmpSPD.GetRows(_htParameters);
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
                Response.Redirect("spddtl.aspx?action=edt&id=" + e.CommandArgument.ToString());
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
        Hashtable _htParameters = new Hashtable();
        IList listPDF = new ArrayList();
        //int row_count = 0;
        //int counter_row = 0;

        //foreach (GridViewRow row in gvwListApproved.Rows)
        //{
        //    if (row.RowType == DataControlRowType.DataRow)
        //    {
        //        CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
        //        if (chb.Checked)
        //        {
        //            row_count++;
        //        }
        //    }
        //}

        foreach (GridViewRow row in gvwListApproved2.Rows)
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
                        _htParameters["p_ID"] = gvwListApproved2.DataKeys[row.RowIndex][0].ToString();
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
        //string sPdfName = "rpt_spd_personal1_combine_" + Utility.CurrentUID + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf";
        //string sPdfPath = Server.MapPath(@"..\..\..\temp\pdf\" + sPdfName);
        //Utility.CombineReport(listPDF, sPdfPath);
        // menampilkan pdf yang sudah dibuat
        //ScriptManager.RegisterStartupScript(this, GetType(), "Report", "window.open('../../../temp/pdf/" + sPdfName + "', 'Report', 'fullscreen=0,menubar=0,status=0,scrollbars=0,resizable=1,toolbar=0,width=600,height=400');", true);
    }

    #endregion

    public void btnMail_Click(object sender, EventArgs e)
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
                        _htParameters["p_ID"] = Int32.Parse(gvwList.DataKeys[row.RowIndex][0].ToString());
                        _htParameters["p_ACT"] = "SPD";
                        Utility.ApplyDefaultProp(_htParameters);
                        if (row.Cells[8].Text != "Send")
                        {
                            _dalEmpSPDDAL.Mail(_htParameters);
                            Utility.ShowMessageBox(this, Utility.MAIL_SENDING_SUCCESS_MESSAGE, null, "spdlst.aspx");
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
                    BindGrid();
                    BindGridApproved();
                    BindGridApproved2();
                    BindGridRejected();
                }
            }
        }
    }
}

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
public partial class module_form_emppermitlst : BasePage
{
    //private static string _RoleCode = "P000468";
    private static string _RoleCode = "B100061";
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
        Response.Redirect("emppermitdtl.aspx?action=add");
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
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            }

            gvwList.DataSource = _dalEmpPermit.GetRows(_htParameters);
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
                Response.Redirect("emppermitdtl.aspx?action=edt&id=" + e.CommandArgument);
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
        EmpPermitDAL _dalEmpPermit = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpPermit = new EmpPermitDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchApproved.Text;
            _htParameters["p_status"] = "1";
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            }

            gvwListApproved.DataSource = _dalEmpPermit.GetRows(_htParameters);
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
                Response.Redirect("emppermitdtl.aspx?action=edt&id=" + e.CommandArgument);
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
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = lblEmployee_Code.Text;
            }

            gvwListRejected.DataSource = _dalEmpPermit.GetRows(_htParameters);
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
                Response.Redirect("emppermitdtl.aspx?action=edt&id=" + e.CommandArgument.ToString());
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
                        _htParameters["p_id"] = gvwListApproved.DataKeys[row.RowIndex][0].ToString();
                        _htParameters["p_user_id"] = Utility.CurrentUID;
                        // end isi parameter

                        // nama report yang dibuat di Crystal Report
                        string rptName = Server.MapPath(@"..\..\rpt\RPT_PERMIT_PERSONAL.rpt");

                        // nama pdf yang akan dicreate dan path nya
                        string pdfName = "RPT_PERMIT_PERSONAL" + Utility.CurrentUID + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf";
                        string pdfPath = Server.MapPath(@"..\..\temp\pdf\" + pdfName);
                        string filetype = "pdf";


                        // membuat pdf
                        //Utility.ExecuteReportHRMS(this, "sp_rpt_Personal_SPD", _htParameters, rptName, pdfPath, "RPT_SPD_PERSONAL");
                        Utility.ExecuteReport(this, "sp_rpt_Personal_Permit", _htParameters, rptName, pdfPath, "RPT_PERMIT_PERSONAL");
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

        EmpPermitDAL _dalEmpPermitDAL = new EmpPermitDAL();
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
                        _htParameters["p_ACT"] = "PMT";
                        Utility.ApplyDefaultProp(_htParameters);
                        if (row.Cells[8].Text != "Send")
                        {
                            _dalEmpPermitDAL.Mail(_htParameters);
                            Utility.ShowMessageBox(this, Utility.MAIL_SENDING_SUCCESS_MESSAGE, null, "emppermitlst.aspx");
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

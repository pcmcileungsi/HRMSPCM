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
using System.Collections.Generic;

using MFin.DataAccessLayer.Master;
using CrystalDecisions.Shared;

public partial class module_report_rptlshremployee : BasePage
{
    private string _RoleCode = "P000408";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        calljavascriptcal();
        if (!Page.IsPostBack)
        {
            BindGrid();
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("hrreportlist.aspx");
    }
    protected void btnPrintAll_Click(object sender, EventArgs e)
    {
        int row_count = 0;
        int counter_row = 0;
        SysCompanyDAL _dalSysCompany = null;
        Hashtable _htParameters = null;
        ExportFormatType export = ExportFormatType.PortableDocFormat;
        //if (rboPrinterOption.SelectedValue.Equals("3"))
        //{
        //    export = ExportFormatType.Excel;
        //}

        try
        {
            _dalSysCompany = new SysCompanyDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;

            DataTable _dt = _dalSysCompany.GetRows(_htParameters);
            //foreach (DataRow dr in _dt.Rows)
            //{
                _htParameters.Clear();
                MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
                //_htParameters["p_c_code"] = dr["C_CODE"].ToString();
                //_htParameters["p_c_company"] = dr["C_NAME"].ToString();
                //_htParameters["p_module"] = rboModule.SelectedValue;
                _htParameters["p_user_id"] = Utility.CurrentUID;
                _htParameters["p_status"] = rboStatus.SelectedValue;
                _htParameters["p_employee_id"]=0;
                _htParameters["p_flag"] = 1;
                // end isi parameter

                // nama report yang dibuat di Crystal Report
                string rptName = Server.MapPath(@"..\..\rpt\RPT_LS_HREMPLOYEE.rpt");

                // nama pdf yang akan dicreate dan path nya
                string pdfName = "rpt_ls_hremployee" + Utility.CurrentUID + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf";
                string pdfPath = Server.MapPath(@"..\..\temp\pdf\" + pdfName);
                string filetype = "pdf";

                //if (rboPrinterOption.SelectedValue.Equals("3"))
                //{
                //    pdfName = "rpt_ls_mktleasereje" + Utility.CurrentUID + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".xls";
                //    pdfPath = Server.MapPath(@"..\..\..\temp\xls\" + pdfName);
                //    filetype = "xls";
                //}

                // membuat pdf
                Utility.ExecuteReport(this, "sp_rpt_ls_hremployee", _htParameters, rptName, pdfPath, "RPT_LS_HREMPLOYEE", export);

                // menampilkan pdf yang sudah dibuat
                if (counter_row == row_count)
                    ScriptManager.RegisterStartupScript(this, GetType(), "Report", "window.open('../../temp/" + filetype + "/" + pdfName + "', 'Report', 'fullscreen=0,menubar=0,status=0,scrollbars=0,resizable=1,toolbar=0,width=600,height=400');", true);
            //}
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }

    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        //System.Diagnostics.Debugger.Break();
        Hashtable _htParameters = new Hashtable();
        int row_count = 0;
        int counter_row = 0;
        ExportFormatType export = ExportFormatType.PortableDocFormat;
        //if (rboPrinterOption.SelectedValue.Equals("3"))
        //{
        //    export = ExportFormatType.Excel;
        //}

        foreach (GridViewRow rows in gvwList.Rows)
        {
            CheckBox chb = (CheckBox)rows.Cells[1].Controls[1];
            if (chb.Checked)
            {
                row_count++;
            }
        }

        foreach (GridViewRow row in gvwList.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chb = (CheckBox)row.Cells[1].Controls[1];
                if (chb.Checked)
                {
                    try
                    {
                        counter_row++;
                        //isi parameter
                        _htParameters.Clear();
                        MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
                        //_htParameters["p_c_code"] = gvwList.Rows[row.RowIndex].Cells[2].Text;
                        //_htParameters["p_c_company"] = gvwList.Rows[row.RowIndex].Cells[3].Text;
                        //_htParameters["p_module"] = rboModule.SelectedValue;
                        _htParameters["p_user_id"] = Utility.CurrentUID;
                        _htParameters["p_status"] = rboStatus.SelectedValue;
                        _htParameters["p_employee_id"] = gvwList.DataKeys[row.RowIndex][0].ToString();
                        _htParameters["p_flag"] = 0;
                        // end isi parameter

                        // nama report yang dibuat di Crystal Report
                        string rptName = Server.MapPath(@"..\..\rpt\RPT_LS_HREMPLOYEE.rpt");

                        // nama pdf yang akan dicreate dan path nya
                        string pdfName = "rpt_ls_hremployee" + Utility.CurrentUID + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".pdf";
                        string pdfPath = Server.MapPath(@"..\..\temp\pdf\" + pdfName);
                        string filetype = "pdf";

                        //if (rboPrinterOption.SelectedValue.Equals("3"))
                        //{
                        //    pdfName = "rpt_ls_mktleasereje" + Utility.CurrentUID + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".xls";
                        //    pdfPath = Server.MapPath(@"..\..\..\temp\xls\" + pdfName);
                        //    filetype = "xls";
                        //}

                        // membuat pdf
                        Utility.ExecuteReport(this, "sp_rpt_ls_hremployee", _htParameters, rptName, pdfPath, "RPT_LS_HREMPLOYEE", export);

                        // menampilkan pdf yang sudah dibuat
                        if (counter_row == row_count)
                            ScriptManager.RegisterStartupScript(this, GetType(), "Report", "window.open('../../temp/" + filetype + "/" + pdfName + "', 'Report', 'fullscreen=0,menubar=0,status=0,scrollbars=0,resizable=1,toolbar=0,width=600,height=400');", true);
                    }
                    catch (Exception ex)
                    {
                        Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
                    }
                }
            }
        }
}

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
        calljavascriptcal();
    }
    #endregion

    private void BindGrid()
    {
        EmployeeDAL _dalEmployee = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmployee = new EmployeeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;
            _htParameters["p_status"] = "1";
            string abc = Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString();
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            }
            gvwList.DataSource = _dalEmployee.GetRows(_htParameters);
            gvwList.DataBind();
            if (gvwList.Rows.Count > 0)
            {
                gvwList.Columns[gvwList.Rows[0].Cells.Count - 1].Visible = true;
            }
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    #region GridView
    protected void gvwList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void gvwList_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void btnSelectAll_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvr in gvwList.Rows)
        {
            CheckBox chkSelect = gvr.FindControl("chbSelect") as CheckBox;
            chkSelect.Checked = ((CheckBox)sender).Checked;
        }
        updMain.Update();
        //BindGrid();
    }
    #endregion

    #region javascript
    protected void calljavascriptcal()
    {
        //ScriptManager.RegisterStartupScript(this, GetType(), "ss", "jsPopUpDate('ctl00_cphbd_txtdDateFr');", true);
        //ScriptManager.RegisterStartupScript(this, GetType(), "ss", "jsPopUpDate('ctl00_cphbd_txtdDateTo');", true);

        ScriptManager.RegisterStartupScript(this, GetType(), "ss", "javascript:jsPopUpDate('ctl00_cphbd_txtdDateFr');", true);
        ScriptManager.RegisterStartupScript(this, GetType(), "tt", "javascript:jsPopUpDate('ctl00_cphbd_txtdDateTo');", true);
    }
    #endregion
}

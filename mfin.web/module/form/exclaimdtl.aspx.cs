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

using System.Linq;

public partial class module_form_exclaimdtl : BasePage
{
    private static string _RoleCode = "B100079";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            TabName.Value = Request.Form[TabName.UniqueID];
            CheckRole(_RoleCode);

            //if (Request.Params["action"].Equals("edt"))
            LoadData();
        }
    }

    private void LoadData()
    {
        EmpExclaimDAL _dalEmpExclaimDAL = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();
            //ddlSPD_Code.SelectedValue = SessionKey.CURRENT_USER_HRMS_EMP_CODE.ToString();
            txtTrx_Date.Text = Utility.CurrentDate;
            //GET ROLE Response.Write(Session[SessionKey.CURRENT_USER_HRMS_ROLE]);

            _dalEmpExclaimDAL = new EmpExclaimDAL();
            _htParameters = new Hashtable();

            if (Request.Params["action"] == "edt")
            {
                _htParameters["p_ID"] = Request.Params["id"];
                pnlshow.Visible = true;
                panelDetail.Visible = false;
                DataTable _dt = _dalEmpExclaimDAL.GetRow(_htParameters);
                MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
                BindGridClaim();
                if (ddlStatus.SelectedValue == "0")
                {
                    btnSave.Visible = true;
                    btnAddExpenseClaimDetail.Visible = true;
                    grvExpenseClaimDetail.Columns[grvExpenseClaimDetail.Rows[0].Cells.Count - 1].Visible = true;
                    grvExpenseClaimDetail.Columns[grvExpenseClaimDetail.Rows[0].Cells.Count - 2].Visible = true;
                }
                else
                {
                    if (ddlStatus.SelectedValue == "1" && Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "2")
                    {
                        btnSave.Visible = true;
                        btnAddExpenseClaimDetail.Visible = true;
                        grvExpenseClaimDetail.Columns[grvExpenseClaimDetail.Rows[0].Cells.Count - 1].Visible = true;
                        grvExpenseClaimDetail.Columns[grvExpenseClaimDetail.Rows[0].Cells.Count - 2].Visible = true;
                    }
                    else
                    {
                        btnSave.Visible = false;
                        btnAddExpenseClaimDetail.Visible = false;
                        grvExpenseClaimDetail.Columns[grvExpenseClaimDetail.Rows[0].Cells.Count - 1].Visible = false;
                        grvExpenseClaimDetail.Columns[grvExpenseClaimDetail.Rows[0].Cells.Count - 2].Visible = false;
                    }
                }
            }
            else
            {
                pnlshow.Visible = false;
                //txtEmployee_Code.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString().Trim();
                //txtEmployee_Name.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_NAME].ToString().Trim();
            }
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindGridClaim()
    {
        EmpExclaimDetailDAL _dalEmpExclaimDetailDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpExclaimDetailDAL = new EmpExclaimDetailDAL();
            _htParameters = new Hashtable();

            if (txtExClaim_No.Text != "")
            {
                //Shared.BindGrvEmpExclaim(grvExpenseClaimDetail, txtSPD_No.Text);
                _htParameters["p_ExClaim_No"] = txtExClaim_No.Text;
            }
            else
            {
                _htParameters["p_SPD_No"] = txtSPD_No.Text;
                //Shared.BindGrvEmpExclaim(grvExpenseClaimDetail, txtExClaim_No.Text);
            }

            DataTable dt = new DataTable();
            dt = _dalEmpExclaimDetailDAL.GetRows(_htParameters);
            grvExpenseClaimDetail.DataSource = dt;
            grvExpenseClaimDetail.DataBind();

            if (dt.Rows.Count > 0)
            {
                decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("Total_Cost"));
                grvExpenseClaimDetail.FooterRow.Cells[5].Text = "Total";
                grvExpenseClaimDetail.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                grvExpenseClaimDetail.FooterRow.Cells[5].Font.Bold = true;
                grvExpenseClaimDetail.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Right;
                grvExpenseClaimDetail.FooterRow.Cells[6].Font.Bold = true;
                grvExpenseClaimDetail.FooterRow.Cells[6].Text = total.ToString("N2");
            }

        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    private void SaveData()
    {
        EmpExclaimDAL _dalEmpExclaimDAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalEmpExclaimDAL = new EmpExclaimDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);


            if (Request.Params["action"] == "edt")
            {
                string abc = lbl_ID.Text;
                _htParameters["p_TotalClaimAmount"] = grvExpenseClaimDetail.FooterRow.Cells[15].Text;
                _dalEmpExclaimDAL.Update(_htParameters);
                iNextID = Int32.Parse(lbl_ID.Text);
            }
            else
            {
                _htParameters["p_Employee_Code"] = txtEmployee_Code.Text;
                _htParameters["p_TotalClaimAmount"] = 0;
                _dalEmpExclaimDAL.Insert(_htParameters, ref iNextID);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "exclaimdtl.aspx?action=edt&id=" + iNextID.ToString());
            //Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "Emppermitdtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("exclaimlst.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    #endregion

    #region PopUp
    //-------------------------- asfor SPD 20161215_Anas -------------------------------------------

   

    private void BindGridPopUp()
    {
        EmpSPDDAL _dalEmpSPD = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpSPD = new EmpSPDDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchSPD.Text;
            _htParameters["p_status"] = "3";
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            }

            gvwListSPD.DataSource = _dalEmpSPD.GetRowsForClaim(_htParameters);
            gvwListSPD.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchSPD_Click(object sender, EventArgs e)
    {
        BindGridPopUp();
    }
    protected void BtnLookUpSPD_Click(object sender, EventArgs e)
    {
        BindGridPopUp();
        upnDetailGetSPD.Update();
        mdlPopupGetSPD.Show();
    }
    protected void gvwListSPD_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtEmployee_Code.Text = gvwListSPD.SelectedRow.Cells[1].Text;
        txtEmployee_Name.Text = gvwListSPD.SelectedRow.Cells[2].Text;
        txtSPD_No.Text = gvwListSPD.SelectedRow.Cells[4].Text;
        txtSPD_Date.Text = gvwListSPD.SelectedRow.Cells[5].Text;
        txtDestination.Text = gvwListSPD.SelectedRow.Cells[6].Text;
        upnDetailGetSPD.Update();
        //BindGridClaim();
        //pnlshow.Visible = true;
        //panelDetail.Visible = false;
        mdlPopupGetSPD.Hide();        
    }
    protected void gvwListSPD_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListSPD_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListSPD.PageIndex = e.NewPageIndex;
        BindGridPopUp();
    }
    //------------------------- end SPD ---------------------------------------------------------
    #endregion
        
    #region Cost
    protected void grvExpenseClaimDetail_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "EditRow":
                try
                {
                    GridViewRow gvr = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);

                    int RowIndex = gvr.RowIndex;
                    lblIdDetail.Text = e.CommandArgument.ToString();

                    txtTravel_Date.Text = gvr.Cells[1].Text;
                    txtCost_Code.Text = gvr.Cells[2].Text;
                    txtCost_Description.Text = gvr.Cells[3].Text;
                    txtCost_Value.Text = gvr.Cells[4].Text;
                    txtQty.Text = gvr.Cells[5].Text;
                    txtTotal_Cost.Text = gvr.Cells[6].Text;
                    lbljudulCost.Text = "Ubah";
                    panelDetail.Visible = true;
                }
                catch (Exception ex)
                {
                    Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
                }
                break;

            case "DeleteRow ":
                try
                {
                    EmpExclaimDetailDAL _dalEmpExclaimDetailDAL = null;
                    Hashtable _htParameters = null;

                    _dalEmpExclaimDetailDAL = new EmpExclaimDetailDAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_ID"] = e.CommandArgument.ToString();

                    _dalEmpExclaimDetailDAL.Delete(_htParameters);
                    BindGridClaim();

                }
                catch (Exception ex)
                {
                    Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
                }
                break;
        }
    }

    protected void btnAddExpenseClaimDetail_Click(object sender, EventArgs e)
    {
        txtTravel_Date.Text = "";
        txtTravel_Date.Text = "";
        txtCost_Code.Text = "";
        txtCost_Description.Text = "";
        txtCost_Value.Text = "";
        txtQty.Text = "";
        txtTotal_Cost.Text = "";
        panelDetail.Visible = true;
        lbljudulCost.Text = "Add";
    }
    protected void btnBackDetail_Click(object sender, EventArgs e)
    {
        panelDetail.Visible = false;
    }
    protected void btnSaveDetail_Click(object sender, EventArgs e)
    {
        EmpExclaimDetailDAL _dalEmpExclaimDetailDAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalEmpExclaimDetailDAL = new EmpExclaimDetailDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(UpExpenseClaimDetail.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (lbljudulCost.Text == "Ubah")
            {
                _htParameters["p_ID"] = lblIdDetail.Text;
                _htParameters["p_ExClaim_No"] = txtExClaim_No.Text;
                _dalEmpExclaimDetailDAL.Update(_htParameters);
                iNextID = Int32.Parse(lblIdDetail.Text);
            }
            else
            {
                _htParameters["p_ExClaim_No"] = txtExClaim_No.Text;
                _dalEmpExclaimDetailDAL.Insert(_htParameters, ref iNextID);
            }
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, null);
            BindGridClaim();
            panelDetail.Visible = false;
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }
    protected void grvExpenseClaimDetail_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = grvExpenseClaimDetail.DataKeys[e.Row.RowIndex].Value.ToString();

            _btn = (ImageButton)e.Row.FindControl("btnDelete");
            _btn.CommandArgument = grvExpenseClaimDetail.DataKeys[e.Row.RowIndex].Value.ToString();

            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    #endregion

    #region PopUpCost
    //-------------------------- asfor Cost 20161215_Anas -------------------------------------------
    private void BindGridPopUpCost()
    {
        LStblGradeCostDAL _dalLStblGradeCostDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblGradeCostDAL = new LStblGradeCostDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchCost.Text;
            _htParameters["p_Employee_Code"] = txtEmployee_Code.Text;
            //string abc = Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString();
            //if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            //{
            //    _htParameters["p_Employee_Code"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            //}
            gvwListCost.DataSource = _dalLStblGradeCostDAL.GetRowsbyGrade(_htParameters);
            gvwListCost.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchCost_Click(object sender, EventArgs e)
    {
        BindGridPopUpCost();
    }
    protected void BtnLookUpCost_Click(object sender, EventArgs e)
    {
        BindGridPopUpCost();
        upnDetailGetCost.Update();
        mdlPopupGetCost.Show();

    }
    protected void gvwListCost_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtCost_Code.Text = gvwListCost.SelectedDataKey[0].ToString();
        txtCost_Description.Text = gvwListCost.SelectedDataKey[1].ToString();
        txtCost_Value.Text = gvwListCost.SelectedDataKey[2].ToString();
        txtQty.Text = "1";
        txtTotal_Cost.Text = gvwListCost.SelectedDataKey[2].ToString();

        upnDetailGetCost.Update();
        mdlPopupGetCost.Hide();
        txtCost_Value.Focus();
    }
    protected void gvwListCost_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListCost_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListCost.PageIndex = e.NewPageIndex;
        BindGridPopUpCost();
    }
    //------------------------- end Cost ---------------------------------------------------------
    #endregion
}

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

public partial class module_form_spddtl : BasePage
{
    private static string _RoleCode = "B100073";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        //ScriptManager.RegisterStartupScript(this, GetType(), "fn2", "javascript:onLoadFunction();", true);
        if (!Page.IsPostBack)
        {
            //TabName.Value = Request.Form[TabName.UniqueID];
            CheckRole(_RoleCode);            
           
            //if (Request.Params["action"].Equals("edt"))
                LoadData();
                switch (Request.Params["page"])
                {
                    case "0":
                        Response.Redirect("spddtl.aspx?action=edt&id=" + Request.Params["id"] + "#page-0");
                        break;
                    case "1":
                        Response.Redirect("spddtl.aspx?action=edt&id=" + Request.Params["id"] + "#page-1");
                        break;
                    case "2":
                        Response.Redirect("spddtl.aspx?action=edt&id=" + Request.Params["id"] + "#page-2");
                        break;
                }
        }
    }

    private void LoadData()
    {
        EmpSPDDAL _dalEmpSPDDAL = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();
            //ddlEmployee_Code.SelectedValue = SessionKey.CURRENT_USER_HRMS_EMP_CODE.ToString();
            txtSPD_Date.Text = Utility.CurrentDate;
            //GET ROLE Response.Write(Session[SessionKey.CURRENT_USER_HRMS_ROLE]);

            _dalEmpSPDDAL = new EmpSPDDAL();
            _htParameters = new Hashtable();

            if (Request.Params["action"] == "edt")
            {
                _htParameters["p_ID"] = Request.Params["id"];
                lbl_ID.Text = Request.Params["id"];
                pnlshow.Visible = true;
                DataTable _dt = _dalEmpSPDDAL.GetRow(_htParameters);
                MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);

                MPF23.Shared.Mapper.DBToUI.Map(pnlBody1.Controls, _dt.Rows[0]);
                LoadDataTask();
                LoadDataCost();
                if (ddlStatus.SelectedValue == "0")
                {
                    btnSave.Visible = true;
                    btnAddTask.Visible = true;
                    btnAddCost.Visible = true;
                    grvTask.Columns[grvTask.Rows[0].Cells.Count - 1].Visible = true;
                    grvTask.Columns[grvTask.Rows[0].Cells.Count - 2].Visible = true;
                    grvCost.Columns[grvCost.Rows[0].Cells.Count - 1].Visible = true;
                    grvCost.Columns[grvCost.Rows[0].Cells.Count - 2].Visible = true;      
                }
                else
                {
                    if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString()=="2")
                    {
                        btnSave.Visible = true;
                        btnAddTask.Visible = true;
                        btnAddCost.Visible = true;
                        grvTask.Columns[grvTask.Rows[0].Cells.Count - 1].Visible = true;
                        grvTask.Columns[grvTask.Rows[0].Cells.Count - 2].Visible = true;
                        grvCost.Columns[grvCost.Rows[0].Cells.Count - 1].Visible = true;
                        grvCost.Columns[grvCost.Rows[0].Cells.Count - 2].Visible = true;      
                    }
                    else
                    {
                        btnSave.Visible = false;
                        btnAddTask.Visible = false;
                        btnAddCost.Visible = false;
                        grvTask.Columns[grvTask.Rows[0].Cells.Count - 1].Visible = false;
                        grvTask.Columns[grvTask.Rows[0].Cells.Count - 2].Visible = false;
                        grvCost.Columns[grvCost.Rows[0].Cells.Count - 1].Visible = false;
                        grvCost.Columns[grvCost.Rows[0].Cells.Count - 2].Visible = false;                        
                    }                    
                }
                //if(Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString()=="2")
                //{
                //    txtCost_Value.Enabled = true;
                //}
                //else
                //{
                //    txtCost_Value.Enabled = false;
                //}

                
            }
            else
            {
                pnlshow.Visible = false;
                txtEmployee_Code.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString().Trim();
                txtEmployee_Descs.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_NAME].ToString().Trim();
            }
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }  

    private void SaveData()
    {
        EmpSPDDAL _dalEmpSPDDAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalEmpSPDDAL = new EmpSPDDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody1.Controls, _htParameters);
            if (Request.Params["action"] == "edt")
            {
                //string abc = lbl_ID.Text;
                _dalEmpSPDDAL.Update(_htParameters);
                iNextID = Int32.Parse(lbl_ID.Text);
            }
            else
            {
                _htParameters["p_Employee_Code"] = txtEmployee_Code.Text;
                _dalEmpSPDDAL.Insert(_htParameters, ref iNextID);
            }
           
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "SPDdtl.aspx?action=edt&id=" + iNextID.ToString());
            //Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "spddtl.aspx?action=edt&page=0&id=" + Request.Params["id"]); 
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("spdlst.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
   
    #endregion

    #region PopUp
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
            string abc = Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString();
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            }
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
        //Shared.BindGRVHRMSEmployee(gvwListEmployee, txtSearchEmployee.Text);
        BindGridPopUp();
    }
    protected void BtnLookUpEmployee_Click(object sender, EventArgs e)
    {
        //Shared.BindGRVHRMSEmployee(gvwListEmployee, txtSearchEmployee.Text);
        BindGridPopUp();
        upnDetailGetEmployee.Update();
        mdlPopupGetEmployee.Show();
    }
    protected void gvwListEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtEmployee_Code.Text = gvwListEmployee.SelectedDataKey[0].ToString();
        txtEmployee_Descs.Text = gvwListEmployee.SelectedDataKey[1].ToString();
        
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
        //Shared.BindGRVHRMSEmployee(gvwListEmployee, txtSearchEmployee.Text);
        BindGridPopUp();
    }
    //------------------------- end Employee ---------------------------------------------------------
    #endregion

    #region Task 
    private void LoadDataTask()
    {
        try
        {
            Shared.BindGrvEmpSPDTask(grvTask, txtSPD_No.Text);

        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }
    protected void grvTask_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "EditRow":
                try
                 {
                     GridViewRow gvr = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
                     int RowIndex = gvr.RowIndex;
                     txtDescription_Task.Text = gvr.Cells[1].Text;
                     txtDepart_Date.Text = gvr.Cells[2].Text;
                     txtArrive_Date.Text = gvr.Cells[3].Text;
                     txtCity_Destination.Text = gvr.Cells[4].Text;
                     txtContact_Person.Text = gvr.Cells[5].Text;
                     lblIDTask.Text = e.CommandArgument.ToString();
                     mdlPopupGetTask.Show();
                     lbljudulTask.Text = "Ubah";                   
                 }
                 catch (Exception ex)
                 {
                     Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
                 }
                 break;

            case "DeleteRow ":
                try
                 {
                     EmpSPDTaskDAL _dalEmpSPDTaskDAL = null;
                     Hashtable _htParameters = null;

                     _dalEmpSPDTaskDAL = new EmpSPDTaskDAL();
                     _htParameters = new Hashtable();

                     _htParameters["p_ID"] = e.CommandArgument.ToString();

                     _dalEmpSPDTaskDAL.Delete(_htParameters);
                     Shared.BindGrvEmpSPDTask(grvTask, txtSPD_No.Text);
                     Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "spddtl.aspx?action=edt&page=1&id=" + Request.Params["id"]); 

                 }
                 catch (Exception ex)
                 {
                     Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
                 }
                 break;
        }
    }

    protected void btnAddTask_Click(object sender, EventArgs e)
    {
        txtDescription_Task.Text = "";
        txtDepart_Date.Text = "";
        txtArrive_Date.Text = "";
        txtCity_Destination.Text = "";
        txtContact_Person.Text = "";
        mdlPopupGetTask.Show();
        lbljudulTask.Text = "Tambah";
    }
    protected void btnEditTask_Click(object sender, EventArgs e)
    {
        EmpSPDTaskDAL _dalEmpSPDTaskDAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalEmpSPDTaskDAL = new EmpSPDTaskDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(upnDetailGetTask.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (lbljudulTask.Text == "Ubah")
            {
                _htParameters["p_ID"] = lblIDTask.Text;
                _dalEmpSPDTaskDAL.Update(_htParameters);
                iNextID = Int32.Parse(lblIDTask.Text);
            }
            else
            {
                _htParameters["p_SPD_No"] = txtSPD_No.Text;
                _dalEmpSPDTaskDAL.Insert(_htParameters, ref iNextID);
            }
            //Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, null);
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "spddtl.aspx?action=edt&page=1&id=" + Request.Params["id"]); 
            LoadDataTask();
            mdlPopupGetTask.Hide();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }
    protected void grvTask_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = grvTask.DataKeys[e.Row.RowIndex].Value.ToString();

            _btn = (ImageButton)e.Row.FindControl("btnDelete");
            _btn.CommandArgument = grvTask.DataKeys[e.Row.RowIndex].Value.ToString();

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

    #region Cost
    private void LoadDataCost()
    {
        try
        {
            Shared.BindGrvEmpSPDCost(grvCost, txtSPD_No.Text);

        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }
    protected void grvCost_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "EditRow":
                try
                {
                    GridViewRow gvr = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);

                    int RowIndex = gvr.RowIndex;
                    txtCost_Code.Text = gvr.Cells[1].Text;
                    txtCost_Description.Text = gvr.Cells[2].Text;
                    txtCost_Value.Text = gvr.Cells[3].Text;
                    txtQty.Text = gvr.Cells[4].Text;
                    txtTotal_Cost.Text = gvr.Cells[5].Text;
                    lblIDCost.Text = e.CommandArgument.ToString();
                    //mdlPopupGetCost.Show();
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
                    EmpSPDCostDAL _dalEmpSPDCostDAL = null;
                    Hashtable _htParameters = null;

                    _dalEmpSPDCostDAL = new EmpSPDCostDAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_ID"] = e.CommandArgument.ToString();

                    _dalEmpSPDCostDAL.Delete(_htParameters);

                    Shared.BindGrvEmpSPDCost(grvCost, txtSPD_No.Text);
                    Utility.ShowMessageBox(this, Utility.DELETE_VALIDATION_SUCCESS_MESSAGE, null, "spddtl.aspx?action=edt&page=2&id=" + Request.Params["id"]);

                }
                catch (Exception ex)
                {
                    Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
                }
                break;
        }
    }
    
    protected void grvCost_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = grvCost.DataKeys[e.Row.RowIndex].Value.ToString();

            _btn = (ImageButton)e.Row.FindControl("btnDelete");
            _btn.CommandArgument = grvCost.DataKeys[e.Row.RowIndex].Value.ToString();

            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }

    protected void btnBackDetail_Click(object sender, EventArgs e)
    {
        panelDetail.Visible = false;
    }

    protected void btnAddCost_Click(object sender, EventArgs e)
    {
        txtCost_Code.Text = "";
        txtCost_Description.Text = "";
        txtCost_Value.Text = "";
        txtQty.Text = "";
        txtTotal_Cost.Text = "";
        lbljudulCost.Text = "Tambah";
        panelDetail.Visible = true;
    }
    protected void btnSaveCost_Click(object sender, EventArgs e)
    {
        EmpSPDCostDAL _dalEmpSPDCostDAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalEmpSPDCostDAL = new EmpSPDCostDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(UpCost.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (lbljudulCost.Text == "Ubah")
            {
                _htParameters["p_ID"] = lblIDCost.Text;
                _htParameters["p_SPD_No"] = txtSPD_No.Text;
                _dalEmpSPDCostDAL.Update(_htParameters);
                iNextID = Int32.Parse(lblIDCost.Text);
            }
            else
            {
                _htParameters["p_SPD_No"] = txtSPD_No.Text;
                _dalEmpSPDCostDAL.Insert(_htParameters, ref iNextID);
            }
            //Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, null);
            mdlPopupGetCost.Hide();
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "spddtl.aspx?action=edt&page=2&id=" + Request.Params["id"]);
            //LoadData();
            //LoadDataCost();
            //
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }
    #endregion

    
}

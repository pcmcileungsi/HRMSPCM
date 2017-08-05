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
public partial class module_master_lstblgradecostlist : BasePage
{
    //private static string _RoleCode = "P000468";
    private static string _RoleCode = "B100115";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            Shared.BindDDLHRMSTypeCost(ddlCostCode, "");
            BindGrid();
        }
    }


    #region Toolbar
    protected void btnSave_Click(object sender, EventArgs e)
    {
        LStblGradeCostDAL _dalLStblGradeCostDAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;
        string message = "";
        try
        {
            foreach (GridViewRow row in gvwList.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    string p_GradeCode = row.Cells[1].Text;
                    string p_ID = (row.Cells[3].FindControl("lblID") as Label).Text;
                    string p_Cost = (row.Cells[3].FindControl("txtCost") as TextBox).Text;

                    _dalLStblGradeCostDAL = new LStblGradeCostDAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_GradeCode"] = p_GradeCode;
                    _htParameters["p_CostCode"] = ddlCostCode.SelectedValue;
                    _htParameters["p_Cost"] = double.Parse(string.IsNullOrEmpty(p_Cost) ? "0" : p_Cost);                    

                    if (p_ID == "")
                    {
                        Utility.ApplyDefaultProp(_htParameters);
                        _dalLStblGradeCostDAL.Insert(_htParameters, ref iNextID);
                        message = "Add Successfully ";
                    }
                    else
                    {
                        _htParameters["p_ID"] = p_ID;
                        Utility.ApplyDefaultProp(_htParameters);
                        _dalLStblGradeCostDAL.Update(_htParameters);
                        message = "Update Successfully";
                    }
                    if (message !="")
                    {
                        Utility.ShowMessageBoxAnas(Page, message, "Success");
                    }
                                       
                }
            }
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }       
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
    #endregion

    private void BindGrid()
    {
        LStblGradeCostDAL _dalLStblGradeCostDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalLStblGradeCostDAL = new LStblGradeCostDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;
            _htParameters["p_CostType"] = ddlCostCode.SelectedValue;

            gvwList.DataSource = _dalLStblGradeCostDAL.GetRows(_htParameters);
            gvwList.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }


    #region GridView

    protected void gvwList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("lstblbranchdetail.aspx?action=edt&id=" + e.CommandArgument);
                break;
            case "Delete":
                LStblBranchDAL _dalLSTblBranch = null;
                Hashtable _htParameters = null;

                try
                {
                    _dalLSTblBranch = new LStblBranchDAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_ID"] = e.CommandArgument.ToString();

                    _dalLSTblBranch.Delete(_htParameters);
                    this.BindGrid();
                    Response.Redirect("lstblbranchlist.aspx");

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
        //Response.Redirect("lstblroundingdetail.aspx?action=edt&id=" + gvwList.SelectedDataKey[0].ToString());
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
            //ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            //_btn.CommandArgument = gvwList.DataKeys[e.Row.RowIndex].Value.ToString();
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
    protected void ddlCostCode_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }
}

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
public partial class module_employee_empgradehstlst : BasePage
{
    //private static string _RoleCode = "P000468";
    private static string _RoleCode = "B100121";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            BindGrid();
        }
    }


    #region Toolbar
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("empgradehistorydetail.aspx?action=add");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
    #endregion

    private void BindGrid()
    {
        EmpGradeHistoryDAL _dalEmpGradeHistoryDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpGradeHistoryDAL = new EmpGradeHistoryDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;
            string abc = Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString();
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString()=="1")
            {
                _htParameters["p_Employee_Code"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();  
            }
            gvwList.DataSource = _dalEmpGradeHistoryDAL.GetRows(_htParameters);
            gvwList.DataBind();
            if (gvwList.Rows.Count > 0) 
            { 
                if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
                {
                    gvwList.Columns[gvwList.Rows[0].Cells.Count-1].Visible = false;
                    gvwList.Columns[gvwList.Rows[0].Cells.Count - 2].Visible = false;
                }
                else
                {
                    gvwList.Columns[gvwList.Rows[0].Cells.Count-1].Visible = true;
                    gvwList.Columns[gvwList.Rows[0].Cells.Count - 2].Visible = true;
                }
            }
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
                Response.Redirect("empgradehistorydetail.aspx?action=edt&id=" + e.CommandArgument);
                break;
            case "Delete":
                EmpGradeHistoryDAL _dalEmpGradeHistoryDAL = null;
                Hashtable _htParameters = null;

                try
                {
                    _dalEmpGradeHistoryDAL = new EmpGradeHistoryDAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_ID"] = e.CommandArgument.ToString();

                    _dalEmpGradeHistoryDAL.Delete(_htParameters);
                    this.BindGrid();
                    Response.Redirect("empgradehstlst.aspx");

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
        Response.Redirect("empgradehistorydetail.aspx?action=edt&id=" + gvwList.SelectedDataKey[0].ToString());
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
}

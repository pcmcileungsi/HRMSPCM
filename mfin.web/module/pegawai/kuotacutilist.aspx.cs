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
public partial class module_pegawai_kuotacutilist : BasePage
{
    private static string _RoleCode = "B100055";
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
        Response.Redirect("kuotacutidtl.aspx?action=add");
    }

    protected void btnImport_Click(object sender, EventArgs e)
    {
        Response.Redirect("kuotacutiimport.aspx?action=add");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }
    #endregion

    private void BindGrid()
    {
        HR_CUTI_KUOTA_DAL _dalHR_CUTI_KUOTA_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalHR_CUTI_KUOTA_DAL = new HR_CUTI_KUOTA_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;
            _htParameters["p_STATUS"] = ddlStatus.SelectedValue;

            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_NIK"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
                btnImport.Visible = false;
            }
            else
            {
                btnImport.Visible = true;
            }
            gvwList.DataSource = _dalHR_CUTI_KUOTA_DAL.GetRows(_htParameters);
            gvwList.DataBind();
            string abc = Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString();
            if (gvwList.Rows.Count > 0)
            {
                if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
                {
                    gvwList.Columns[gvwList.Rows[0].Cells.Count - 1].Visible = false;
                    gvwList.Columns[gvwList.Rows[0].Cells.Count - 2].Visible = false;
                }
                else
                {
                    gvwList.Columns[gvwList.Rows[0].Cells.Count - 1].Visible = true;
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
                Response.Redirect("kuotacutidtl.aspx?action=edt&id=" + e.CommandArgument);
                break;
            case "Delete":
                HR_CUTI_KUOTA_DAL _dalHR_CUTI_KUOTA_DAL = null;
                Hashtable _htParameters = null;

                try
                {
                    _dalHR_CUTI_KUOTA_DAL = new HR_CUTI_KUOTA_DAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_id"] = e.CommandArgument.ToString();

                    _dalHR_CUTI_KUOTA_DAL.Delete(_htParameters);
                    this.BindGrid();
                    Response.Redirect("kuotacutilist.aspx");

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

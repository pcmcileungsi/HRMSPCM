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
using System.IO;
using MFin.DataAccessLayer.Master;

public partial class module_pegawai_kontraklist : BasePage
{
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
        Response.Redirect("kontrakdtl.aspx?action=add");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }   
    #endregion

    private void BindGrid()
    {
        HR_KONTRAK_DAL _dalHR_KONTRAK_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalHR_KONTRAK_DAL = new HR_KONTRAK_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearch.Text;
           
            gvwList.DataSource = _dalHR_KONTRAK_DAL.GetRows(_htParameters);
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
        int rowIndex = Convert.ToInt32(e.CommandArgument) - 1;
        string p_ID = gvwList.DataKeys[rowIndex].Values[1].ToString();

        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("kontrakdtl.aspx?action=edt&id=" + p_ID);
                break;
            case "Delete":
                HR_KONTRAK_DAL _dalHR_KONTRAK_DAL = null;
                Hashtable _htParameters = null;
                
                try
                {                    
                    string filename = gvwList.DataKeys[rowIndex].Values[2].ToString();
                    string savefile = Path.Combine(Server.MapPath("~/FileAttachments/"), filename);

                    _dalHR_KONTRAK_DAL = new HR_KONTRAK_DAL();
                    _htParameters = new Hashtable();
                    _htParameters["p_ID"] = p_ID;
                    _dalHR_KONTRAK_DAL.Delete(_htParameters);
                    
                    if (System.IO.File.Exists(savefile))
                        System.IO.File.Delete(savefile);

                    this.BindGrid();
                    Response.Redirect("kontraklist.aspx");
                }
                catch (Exception ex)
                {
                    Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
                }
                break;
        }
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

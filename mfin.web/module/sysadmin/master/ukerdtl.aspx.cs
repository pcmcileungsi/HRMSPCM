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

public partial class module_sysadmin_master_ukerdtl : BasePage
{
    private static string _RoleCode = "B100079";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            if (Request.Params["action"].Equals("edt"))
                LoadData();
        }
    }

    private void LoadData()
    {
        MST_UNIT_KERJA_DAL _dalMST_UNIT_KERJA_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();

            _dalMST_UNIT_KERJA_DAL = new MST_UNIT_KERJA_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_ID"] = Request.Params["id"];
            DataTable _dt = _dalMST_UNIT_KERJA_DAL.GetRow(_htParameters);
            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        MST_UNIT_KERJA_DAL _dalMST_UNIT_KERJA_DAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalMST_UNIT_KERJA_DAL = new MST_UNIT_KERJA_DAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalMST_UNIT_KERJA_DAL.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalMST_UNIT_KERJA_DAL.Update(_htParameters);
                iNextID = Int32.Parse(lblID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "ukerdtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("ukerlist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion

    #region PopUpMajelis
    //-------------------------- -------------------------------------------
    private void BindGridPopUpMajelis()
    {
        MST_MAJELIS_DAL _dalMST_MAJELIS = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_MAJELIS = new MST_MAJELIS_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchMajelis.Text;          
           
            gvwListMajelis.DataSource = _dalMST_MAJELIS.GetRows(_htParameters);
            gvwListMajelis.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchMajelis_Click(object sender, EventArgs e)
    {
        BindGridPopUpMajelis();
    }
    protected void BtnLookUpMajelis_Click(object sender, EventArgs e)
    {
        BindGridPopUpMajelis();
        upnDetailGetMajelis.Update();
        mdlPopupGetMajelis.Show();
    }
    protected void gvwListMajelis_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtCKodeMajelis.Text = gvwListMajelis.SelectedDataKey[0].ToString();
        txtMajelis_Name.Text = gvwListMajelis.SelectedDataKey[1].ToString();

        upnDetailGetMajelis.Update();
        mdlPopupGetMajelis.Hide();
    }
    protected void gvwListMajelis_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListMajelis_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListMajelis.PageIndex = e.NewPageIndex;
        BindGridPopUpMajelis();
    }
    //------------------------- end Direksi ---------------------------------------------------------
    #endregion
}

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

public partial class module_sysadmin_master_msttunjanganjabdtl : BasePage
{
    private static string _RoleCode = "B100103";
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
        MST_TUNJANGAN_JABATAN_DAL _dalMST_TUNJANGAN_JABATAN_DAL = null;
        Hashtable _htParameters = null;

        try
        {            
            _dalMST_TUNJANGAN_JABATAN_DAL = new MST_TUNJANGAN_JABATAN_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_ID"] = Request.Params["id"];
            DataTable _dt = _dalMST_TUNJANGAN_JABATAN_DAL.GetRow(_htParameters);
            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        MST_TUNJANGAN_JABATAN_DAL _dalMST_TUNJANGAN_JABATAN_DAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalMST_TUNJANGAN_JABATAN_DAL = new MST_TUNJANGAN_JABATAN_DAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalMST_TUNJANGAN_JABATAN_DAL.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalMST_TUNJANGAN_JABATAN_DAL.Update(_htParameters);
                iNextID = Int32.Parse(lblID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "msttunjanganjabdtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("msttunjanganjablist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion

    #region PopUpTunjanganJabatan
    //-------------------------- -------------------------------------------
    private void BindGridPopUpTunjanganJab()
    {
        MST_MAJELIS_DAL _dalMST_MAJELIS = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_MAJELIS = new MST_MAJELIS_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchTunjanganJab.Text;          
           
            gvwListTunjanganJab.DataSource = _dalMST_MAJELIS.GetRows(_htParameters);
            gvwListTunjanganJab.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchTunjanganJab_Click(object sender, EventArgs e)
    {
        BindGridPopUpTunjanganJab();
    }
    protected void BtnLookUpTunjanganJab_Click(object sender, EventArgs e)
    {
        BindGridPopUpTunjanganJab();
        upnDetailGetTunjanganJab.Update();
        mdlPopupGetTunjanganJab.Show();
    }
    protected void gvwListTunjanganJab_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtCKodeTunjanganJab.Text = gvwListTunjanganJab.SelectedDataKey[0].ToString();
        txtTunjanganJab_Name.Text = gvwListTunjanganJab.SelectedDataKey[1].ToString();

        upnDetailGetTunjanganJab.Update();
        mdlPopupGetTunjanganJab.Hide();
    }
    protected void gvwListTunjanganJab_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListTunjanganJab_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListTunjanganJab.PageIndex = e.NewPageIndex;
        BindGridPopUpTunjanganJab();
    }
    //------------------------- end Tunjangan Jabatan ---------------------------------------------------------
    #endregion
	
	#region PopUpJabatan
    //-------------------------- -------------------------------------------
    private void BindGridPopUpJabatan()
    {
        MST_JABATAN_DAL _dalMST_JABATAN_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_JABATAN_DAL = new MST_JABATAN_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchJabatan.Text;

            gvwListJabatan.DataSource = _dalMST_JABATAN_DAL.GetRows(_htParameters);
            gvwListJabatan.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchJabatan_Click(object sender, EventArgs e)
    {
        BindGridPopUpJabatan();
    }
    protected void BtnLookUpJabatan_Click(object sender, EventArgs e)
    {
        BindGridPopUpJabatan();
        upnDetailGetJabatan.Update();
        mdlPopupGetJabatan.Show();
    }
    protected void gvwListJabatan_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtKodeJabatan.Text = gvwListJabatan.SelectedDataKey[0].ToString();
        txtJabatan_Name.Text = gvwListJabatan.SelectedDataKey[1].ToString();

        upnDetailGetJabatan.Update();
        mdlPopupGetJabatan.Hide();
    }
    protected void gvwListJabatan_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListJabatan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListJabatan.PageIndex = e.NewPageIndex;
        BindGridPopUpJabatan();
    }
    //------------------------- end Jabatan ---------------------------------------------------------
    #endregion
}

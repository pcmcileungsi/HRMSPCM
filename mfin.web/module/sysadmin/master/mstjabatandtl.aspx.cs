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

public partial class module_sysadmin_master_mstjabatandtl : BasePage
{
    private static string _RoleCode = "B100049";
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
        MST_JABATAN_DAL _dalMST_JABATAN_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_JABATAN_DAL = new MST_JABATAN_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_ID"] = Request.Params["id"];
            DataTable _dt = _dalMST_JABATAN_DAL.GetRow(_htParameters);
            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        MST_JABATAN_DAL _dalMST_JABATAN_DAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalMST_JABATAN_DAL = new MST_JABATAN_DAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalMST_JABATAN_DAL.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalMST_JABATAN_DAL.Update(_htParameters);
                iNextID = Int32.Parse(lblID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "mstjabatandtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("mstjabatanlist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion

    #region PopUpUnitKerja
    //-------------------------- -------------------------------------------
    private void BindGridPopUpUnitkerja()
    {
        MST_UNIT_KERJA_DAL _dalMST_UNIT_KERJA_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_UNIT_KERJA_DAL = new MST_UNIT_KERJA_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchUnitKerja.Text;
            _htParameters["p_majelis"] = "";

            gvwListUnitKerja.DataSource = _dalMST_UNIT_KERJA_DAL.GetRows(_htParameters);
            gvwListUnitKerja.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchUnitKerja_Click(object sender, EventArgs e)
    {
        BindGridPopUpUnitkerja();
    }
    protected void BtnLookUpUnitKerja_Click(object sender, EventArgs e)
    {
        BindGridPopUpUnitkerja();
        upnDetailGetUnitKerja.Update();
        mdlPopupGetUnitKerja.Show();
    }
    protected void gvwListUnitKerja_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtKodeUnitkerja.Text = gvwListUnitKerja.SelectedDataKey[0].ToString();
        txtUnitKerja_Name.Text = gvwListUnitKerja.SelectedDataKey[1].ToString();

        upnDetailGetUnitKerja.Update();
        mdlPopupGetUnitKerja.Hide();
    }
    protected void gvwListUnitKerja_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListUnitKerja_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListUnitKerja.PageIndex = e.NewPageIndex;
        BindGridPopUpUnitkerja();
    }
    //------------------------- end Unit Kerja ---------------------------------------------------------
    #endregion

    #region PopUpJabatan
    //-------------------------- -------------------------------------------
    private void BindGridPopUpJabatan()
    {
        reff_jenis_jabatanDAL _dalreff_jenis_jabatanDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalreff_jenis_jabatanDAL = new reff_jenis_jabatanDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchJabatan.Text;

            gvwListJabatan.DataSource = _dalreff_jenis_jabatanDAL.GetRows(_htParameters);
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

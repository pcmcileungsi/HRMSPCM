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

public partial class module_sysadmin_master_mstgapokdtl : BasePage
{
    private static string _RoleCode = "B100085";
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
        MST_GAPOK_DAL _dalMST_GAPOK_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_GAPOK_DAL = new MST_GAPOK_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_ID"] = Request.Params["id"];
            DataTable _dt = _dalMST_GAPOK_DAL.GetRow(_htParameters);
            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        MST_GAPOK_DAL _dalMST_GAPOK_DAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalMST_GAPOK_DAL = new MST_GAPOK_DAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalMST_GAPOK_DAL.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalMST_GAPOK_DAL.Update(_htParameters);
                iNextID = Int32.Parse(lblID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "mstgapokdtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("mstgapoklist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion

    #region PopUpPendidikan
    //-------------------------- -------------------------------------------
    private void BindGridPopUpPendidikan()
    {
        reff_jenjang_pendidikanDAL _dalreff_jenjang_pendidikanDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalreff_jenjang_pendidikanDAL = new reff_jenjang_pendidikanDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchPendidikan.Text;

            gvwListPendidikan.DataSource = _dalreff_jenjang_pendidikanDAL.GetRows(_htParameters);
            gvwListPendidikan.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchPendidikan_Click(object sender, EventArgs e)
    {
        BindGridPopUpPendidikan();
    }
    protected void BtnLookUpPendidikan_Click(object sender, EventArgs e)
    {
        BindGridPopUpPendidikan();
        upnDetailGetPendidikan.Update();
        mdlPopupGetPendidikan.Show();
    }
    protected void gvwListPendidikan_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtKodePendidikan.Text = gvwListPendidikan.SelectedDataKey[0].ToString();
        txtPendidikan_Name.Text = gvwListPendidikan.SelectedDataKey[1].ToString();

        upnDetailGetPendidikan.Update();
        mdlPopupGetPendidikan.Hide();
    }
    protected void gvwListPendidikan_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListPendidikan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListPendidikan.PageIndex = e.NewPageIndex;
        BindGridPopUpPendidikan();
    }
    //------------------------- end Pendidikan ---------------------------------------------------------
    #endregion

    #region PopUpGolongan
    //-------------------------- -------------------------------------------
    private void BindGridPopUpGolongan()
    {
        reff_jenis_golonganDAL _dalreff_jenis_golonganDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalreff_jenis_golonganDAL = new reff_jenis_golonganDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchGolongan.Text;

            gvwListGolongan.DataSource = _dalreff_jenis_golonganDAL.GetRows(_htParameters);
            gvwListGolongan.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchGolongan_Click(object sender, EventArgs e)
    {
        BindGridPopUpGolongan();
    }
    protected void BtnLookUpGolongan_Click(object sender, EventArgs e)
    {
        BindGridPopUpGolongan();
        upnDetailGetGolongan.Update();
        mdlPopupGetGolongan.Show();
    }
    protected void gvwListGolongan_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtKodeGolongan.Text = gvwListGolongan.SelectedDataKey[0].ToString();
        txtGolongan_Name.Text = gvwListGolongan.SelectedDataKey[1].ToString();

        upnDetailGetGolongan.Update();
        mdlPopupGetGolongan.Hide();
    }
    protected void gvwListGolongan_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListGolongan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListGolongan.PageIndex = e.NewPageIndex;
        BindGridPopUpGolongan();
    }
    //------------------------- end Golongan ---------------------------------------------------------
    #endregion
	
	  #region PopUpMasaKerja
    //-------------------------- -------------------------------------------
    private void BindGridPopUpMasaKerja()
    {
        REFF_MASAKERJA_DAL _dalREFF_MASAKERJA_DALL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalREFF_MASAKERJA_DALL = new REFF_MASAKERJA_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchMasaKerja.Text;

            gvwListMasaKerja.DataSource = _dalREFF_MASAKERJA_DALL.GetRows(_htParameters);
            gvwListMasaKerja.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchMasaKerja_Click(object sender, EventArgs e)
    {
        BindGridPopUpMasaKerja();
    }
    protected void BtnLookUpMasaKerja_Click(object sender, EventArgs e)
    {
        BindGridPopUpMasaKerja();
        upnDetailGetMasaKerja.Update();
        mdlPopupGetMasaKerja.Show();
    }
    protected void gvwListMasaKerja_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtMasakerja.Text = gvwListMasaKerja.SelectedDataKey[0].ToString();
        txtMasaKerja_Name.Text = gvwListMasaKerja.SelectedDataKey[1].ToString();

        upnDetailGetMasaKerja.Update();
        mdlPopupGetMasaKerja.Hide();
    }
    protected void gvwListMasaKerja_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListMasaKerja_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListMasaKerja.PageIndex = e.NewPageIndex;
        BindGridPopUpMasaKerja();
    }
    //------------------------- end MasaKerja ---------------------------------------------------------
    #endregion
	
	  #region PopUpStatusPegawai
    //-------------------------- -------------------------------------------
    private void BindGridPopUpStatusPeg()
    {
        REFF_STATUS_PEGAWAI_DAL _dalREFF_STATUS_PEGAWAI_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalREFF_STATUS_PEGAWAI_DAL = new REFF_STATUS_PEGAWAI_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchStatusPeg.Text;

            gvwListStatusPeg.DataSource = _dalREFF_STATUS_PEGAWAI_DAL.GetRows(_htParameters);
            gvwListStatusPeg.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchStatusPeg_Click(object sender, EventArgs e)
    {
        BindGridPopUpStatusPeg();
    }
    protected void BtnLookUpStatusPeg_Click(object sender, EventArgs e)
    {
        BindGridPopUpStatusPeg();
        upnDetailGetStatusPeg.Update();
        mdlPopupGetStatusPeg.Show();
    }
    protected void gvwListStatusPeg_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtStatusPeg.Text = gvwListStatusPeg.SelectedDataKey[0].ToString();
        txtStatusPeg_Name.Text = gvwListStatusPeg.SelectedDataKey[1].ToString();

        upnDetailGetStatusPeg.Update();
        mdlPopupGetStatusPeg.Hide();
    }
    protected void gvwListStatusPeg_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListStatusPeg_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListStatusPeg.PageIndex = e.NewPageIndex;
        BindGridPopUpStatusPeg();
    }
    //------------------------- end StatusPegawai ---------------------------------------------------------
    #endregion
}

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

public partial class module_pegawai_kontrakdtl : BasePage
{
    private static string _RoleCode = "B100121";
    string filepath = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        
        if (!Page.IsPostBack)
        {            
            CheckRole(_RoleCode);
            BindUnitKerja();
            BindReffPosisi();
            BindReffJabatan();

            if (Request.Params["action"].Equals("edt"))
            {
                LoadData();
                txtKode.ReadOnly = true;
            }
        }
    }

    private void LoadData()
    {
        HR_KONTRAK_DAL _dalHR_KONTRAK_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalHR_KONTRAK_DAL = new HR_KONTRAK_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_ID"] = Request.Params["id"];
            DataTable _dt = _dalHR_KONTRAK_DAL.GetRow(_htParameters);
                     
            if (_dt.Rows[0]["STATUS_PEGAWAI"].ToString() == "True")
            {
                cbStatus.Checked = true;
            }
            if (_dt.Rows[0]["is_shift"].ToString() == "1")
            {
                cbShift.Checked = true;
            }
            if (_dt.Rows[0]["is_cuti"].ToString() == "1")
            {
                cbCuti.Checked = true;
            }

            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindUnitKerja()
    {
        MST_UNIT_KERJA_DAL _dalMST_UNIT_KERJA_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMST_UNIT_KERJA_DAL = new MST_UNIT_KERJA_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";
            _htParameters["p_majelis"] = "";

            ddlUnitKerja.DataSource = _dalMST_UNIT_KERJA_DAL.GetRows(_htParameters);
            ddlUnitKerja.DataValueField = "KODE";
            ddlUnitKerja.DataTextField = "NAMA";
            ddlUnitKerja.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindReffPosisi()
    {
        reff_jenis_posisiDAL _dalreff_jenis_posisiDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalreff_jenis_posisiDAL = new reff_jenis_posisiDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddlPosisi.DataSource = _dalreff_jenis_posisiDAL.GetRows(_htParameters);
            ddlPosisi.DataValueField = "KODE";
            ddlPosisi.DataTextField = "DESKRIPSI";
            ddlPosisi.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindReffJabatan()
    {
        reff_jenis_jabatanDAL _dalreff_jenis_jabatanDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalreff_jenis_jabatanDAL = new reff_jenis_jabatanDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddlJabatan.DataSource = _dalreff_jenis_jabatanDAL.GetRowsJabatan(_htParameters);
            ddlJabatan.DataValueField = "KODE";
            ddlJabatan.DataTextField = "DESKRIPSI";
            ddlJabatan.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        HR_KONTRAK_DAL _dalHR_KONTRAK_DAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalHR_KONTRAK_DAL = new HR_KONTRAK_DAL();
            _htParameters = new Hashtable();
            _htParameters["p_DOKUMEN_PATH"] = filepath;

            if (cbStatus.Checked)
                _htParameters["p_STATUS_PEGAWAI"] = "1";
            else
                _htParameters["p_STATUS_PEGAWAI"] = "0";
			
			if (cbShift.Checked)
                _htParameters["p_IS_SHIFT"] = "1";
            else
                _htParameters["p_IS_SHIFT"] = "0";
			
			if (cbCuti.Checked)
                _htParameters["p_IS_CUTI"] = "1";
            else
                _htParameters["p_IS_CUTI"] = "0";

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalHR_KONTRAK_DAL.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalHR_KONTRAK_DAL.Update(_htParameters);
                iNextID = Int32.Parse(lblID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "kontrakdtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("kontraklist.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            HttpPostedFile file = Request.Files["ctl00$cphbd$upfile"];
            if (file != null && file.ContentLength > 0)
            {
                filepath = Server.MapPath("~/FileAttachments/");
                file.SaveAs(filepath + txtDocName.Text);
            }

            SaveData();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }     
    #endregion    
    
      #region PopUpPegawai
    //-------------------------- -------------------------------------------
    private void BindGridPopUpPeg()
    {
        HR_PEGAWAI_DAL _dalHR_PEGAWAI_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalHR_PEGAWAI_DAL = new HR_PEGAWAI_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchPeg.Text;

            gvwListPeg.DataSource = _dalHR_PEGAWAI_DAL.GetRows(_htParameters);
            gvwListPeg.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchPeg_Click(object sender, EventArgs e)
    {
        BindGridPopUpPeg();
    }
    protected void BtnLookUpPeg_Click(object sender, EventArgs e)
    {
        BindGridPopUpPeg();
        upnDetailGetPeg.Update();
        mdlPopupGetPeg.Show();
    }
    protected void gvwListPeg_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtPeg.Text = gvwListPeg.SelectedDataKey[0].ToString();
        txtPeg_Name.Text = gvwListPeg.SelectedDataKey[1].ToString();

        upnDetailGetPeg.Update();
        mdlPopupGetPeg.Hide();
    }
    protected void gvwListPeg_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListPeg_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListPeg.PageIndex = e.NewPageIndex;
        BindGridPopUpPeg();
    }
    //------------------------- end StatusPegawai ---------------------------------------------------------
    #endregion	
}

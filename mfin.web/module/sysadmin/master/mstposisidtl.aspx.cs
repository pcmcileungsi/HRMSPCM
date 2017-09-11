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

public partial class module_sysadmin_master_mstposisidtl : BasePage
{
    private static string _RoleCode = "B100073";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
			BindUnitKerja();
			BindReffPosisi();
			
            if (Request.Params["action"].Equals("edt"))
            {
                LoadData();
                txtKode.ReadOnly = true;
            }
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

    private void LoadData()
    {
        MST_POSISI_DAL _dalMST_POSISI = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();

            _dalMST_POSISI = new MST_POSISI_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_ID"] = Request.Params["id"];
            DataTable _dt = _dalMST_POSISI.GetRow(_htParameters);			
			
            if (_dt.Rows[0]["IS_SHIFT"].ToString() == "1")
            {
                cbShift.Checked = true;
            }
			if (_dt.Rows[0]["IS_CUTI"].ToString() == "1")
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

    private void SaveData()
    {
        MST_POSISI_DAL _dalMST_POSISI = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalMST_POSISI = new MST_POSISI_DAL();
            _htParameters = new Hashtable();
			
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
                _dalMST_POSISI.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalMST_POSISI.Update(_htParameters);
                iNextID = Int32.Parse(lblID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "mstposisidtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("mstposisilist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion
}

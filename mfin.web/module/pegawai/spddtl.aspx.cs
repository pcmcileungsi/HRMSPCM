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

public partial class module_form_spddtl : BasePage
{
    private static string _RoleCode = "B100121";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();
        //ScriptManager.RegisterStartupScript(this, GetType(), "fn2", "javascript:onLoadFunction();", true);
        if (!Page.IsPostBack)
        {
            //TabName.Value = Request.Form[TabName.UniqueID];
            CheckRole(_RoleCode);
            BindPosisi();
            BindAgama();
            BindUnitKerja();
            BindPendidikanTerakhir();
            //if (Request.Params["action"].Equals("edt"))
            LoadData();
            switch (Request.Params["page"])
            {
                case "0":
                    Response.Redirect("spddtl.aspx?action=edt&id=" + Request.Params["id"] + "#page-0");
                    break;
                case "1":
                    Response.Redirect("spddtl.aspx?action=edt&id=" + Request.Params["id"] + "#page-1");
                    break;
                case "2":
                    Response.Redirect("spddtl.aspx?action=edt&id=" + Request.Params["id"] + "#page-2");
                    break;
            }
        }
    }

    private void LoadData()
    {
        HR_PELAMARDAL _dalhr_pelamar_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();

            _dalhr_pelamar_DAL = new HR_PELAMARDAL();
            _htParameters = new Hashtable();

            _htParameters["p_ID"] = Request.Params["id"];
            DataTable _dt = _dalhr_pelamar_DAL.GetRow(_htParameters);
            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindPosisi()
    {
        reff_jenis_posisiDAL _dalreff_posisi = null;
        Hashtable _htParameters = null;

        try
        {
            _dalreff_posisi = new reff_jenis_posisiDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddlposisi.DataSource = _dalreff_posisi.GetRows(_htParameters);
            ddlposisi.DataValueField = "KODE";
            ddlposisi.DataTextField = "deskripsi";
            ddlposisi.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindAgama()
    {
        reff_agamaDAL _dalreff_agama = null;
        Hashtable _htParameters = null;

        try
        {
            _dalreff_agama = new reff_agamaDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            DdlAgama.DataSource = _dalreff_agama.GetRows(_htParameters);
            DdlAgama.DataValueField = "KODE";
            DdlAgama.DataTextField = "deskripsi";
            DdlAgama.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindUnitKerja()
    {
        MST_UNIT_KERJA_DAL _dalmst_unit_kerja = null;
        Hashtable _htParameters = null;

        try
        {
            _dalmst_unit_kerja = new MST_UNIT_KERJA_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddlUnitKerja.DataSource = _dalmst_unit_kerja.GetRows(_htParameters);
            ddlUnitKerja.DataValueField = "KODE";
            ddlUnitKerja.DataTextField = "nama";
            ddlUnitKerja.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindPendidikanTerakhir()
    {
        reff_jenjang_pendidikanDAL _dalreff_jenjang_pendidikan = null;
        Hashtable _htParameters = null;

        try
        {
            _dalreff_jenjang_pendidikan = new reff_jenjang_pendidikanDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = "";

            ddlPendidikan.DataSource = _dalreff_jenjang_pendidikan.GetRows(_htParameters);
            ddlPendidikan.DataValueField = "id";
            ddlPendidikan.DataTextField = "kode";
            ddlPendidikan.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        HR_PELAMARDAL _dalhr_pelamar = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalhr_pelamar = new HR_PELAMARDAL();
            _htParameters = new Hashtable();
            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);
            
            if (rdbtnJenKel.SelectedValue == "0")
            {
                _htParameters["p_JENIS_KELAMIN"] = true;
            }
            else _htParameters["p_JENIS_KELAMIN"] = false;
            _htParameters["p_STATUS_KAWIN"] = rdbtnStatusNikah.SelectedValue;
            _htParameters["p_JENIS_SIM"] = ddlJenisSIM.SelectedValue;
            _htParameters["p_KENDARAAN"] = ddlKendaraan.SelectedValue;
            _htParameters["p_PENDIDIKAN_TERAKHIR"] = ddlPendidikan.SelectedValue;
            _htParameters["p_KODE_AGAMA"] = DdlAgama.SelectedValue;
            _htParameters["p_STATUS_PEGAWAI"] = false;
            _htParameters["p_SIAP_LEMBUR"] = false;
            _htParameters["p_SIAP_LUAR_KOTA"] = false;
            if (Request.Params["action"] == "add")
            {
                _dalhr_pelamar.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalhr_pelamar.Update(_htParameters);
                iNextID = Int32.Parse(lblid.Text.ToString());
            }
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "usergroupdetail.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    protected void btnSave_Data_Diri_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    protected void btnBack_Data_Diri_Click(object sender, EventArgs e)
    {
        Response.Redirect("pelamarlist.aspx");
    }

    protected void btnSave_Pendidikan_Click(object sender, EventArgs e)
    {
        Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "spddtl.aspx?page=2&action=edt&id=1");
    }
}

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
public partial class module_master_lstblleavedetail : BasePage
{
    private static string _RoleCode = "B100055";
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
        HR_CUTI_KUOTA_DAL _dalHR_CUTI_KUOTA_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();

            _dalHR_CUTI_KUOTA_DAL = new HR_CUTI_KUOTA_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_id"] = Request.Params["id"];
            DataTable _dt = _dalHR_CUTI_KUOTA_DAL.GetRow(_htParameters);
            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
            //imgBtnLookUpKaryawan.Enabled = false;
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        HR_CUTI_KUOTA_DAL _dalHR_CUTI_KUOTA_DAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalHR_CUTI_KUOTA_DAL = new HR_CUTI_KUOTA_DAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalHR_CUTI_KUOTA_DAL.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalHR_CUTI_KUOTA_DAL.Update(_htParameters);
                iNextID = Int32.Parse(lblID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "kuotacutidtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("kuotacutilist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    protected void txtSTART_DATE_TextChanged(object sender, EventArgs e)
    {
        //HitungHari();
    }

    protected void txtEND_DATE_TextChanged(object sender, EventArgs e)
    {
        //HitungHari();
    }
    #endregion

    #region PopUpKaryawan
    //asfor Karyawan
    private void BindGridPopUpKaryawan()
    {
        HR_PEGAWAI_DAL _dalHR_PEGAWAI_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalHR_PEGAWAI_DAL = new HR_PEGAWAI_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchKaryawan.Text;
            _htParameters["p_status"] = "1";
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_NIK"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            }
            gvwListKaryawan.DataSource = _dalHR_PEGAWAI_DAL.GetRows(_htParameters);
            gvwListKaryawan.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchKaryawan_Click(object sender, EventArgs e)
    {
        //Shared.BindKaryawan(txtSearchKaryawan.Text, gvwListKaryawan);
        BindGridPopUpKaryawan();
    }
    protected void BtnLookUpKaryawan_Click(object sender, EventArgs e)
    {
        //Shared.BindKaryawan(txtSearchKaryawan.Text, gvwListKaryawan);
        BindGridPopUpKaryawan();
        upnDetailGetKaryawan.Update();
        mdlPopupGetKaryawan.Show();
    }
    protected void gvwListKaryawan_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtNIK.Text = gvwListKaryawan.SelectedDataKey[0].ToString();
        txtNAMA.Text = gvwListKaryawan.SelectedDataKey[1].ToString();

        updKaryawanInfo.Update();

        upnDetailGetKaryawan.Update();
        mdlPopupGetKaryawan.Hide();
    }
    protected void gvwListKaryawan_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListKaryawan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListKaryawan.PageIndex = e.NewPageIndex;
        //Shared.BindKaryawan(txtSearchKaryawan.Text, gvwListKaryawan);
        BindGridPopUpKaryawan();
    }
    #endregion
}

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

public partial class module_sysadmin_master_msttunjangandtl : BasePage
{
    private static string _RoleCode = "B100097";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            if (Request.Params["action"].Equals("edt"))
            {
                LoadData();
                txtCKode.ReadOnly = true;
            }
        }
    }

    private void LoadData()
    {
        MST_TUNJANGAN_DAL _dalMST_TUNJANGAN_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();

            _dalMST_TUNJANGAN_DAL = new MST_TUNJANGAN_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_ID"] = Request.Params["id"];
            DataTable _dt = _dalMST_TUNJANGAN_DAL.GetRow(_htParameters);
            _dt.Rows[0]["NOMINAL"] = string.Format("{0:0,0.00}", Convert.ToDecimal(_dt.Rows[0]["NOMINAL"]));   
            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        MST_TUNJANGAN_DAL _dalMST_TUNJANGAN_DAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalMST_TUNJANGAN_DAL = new MST_TUNJANGAN_DAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalMST_TUNJANGAN_DAL.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalMST_TUNJANGAN_DAL.Update(_htParameters);
                iNextID = Int32.Parse(lblID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "msttunjangandtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("msttunjanganlist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion

    #region PopUpTunjangan
    //-------------------------- -------------------------------------------
    private void BindGridPopUpTunjangan()
    {
        reff_jenis_tunjanganDAL _dalreff_jenis_tunjanganDAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalreff_jenis_tunjanganDAL = new reff_jenis_tunjanganDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchTunjangan.Text;

            gvwListTunjangan.DataSource = _dalreff_jenis_tunjanganDAL.GetRows(_htParameters);
            gvwListTunjangan.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }

    protected void btnSearchTunjangan_Click(object sender, EventArgs e)
    {
        BindGridPopUpTunjangan();
    }
    protected void BtnLookUpTunjangan_Click(object sender, EventArgs e)
    {
        BindGridPopUpTunjangan();
        upnDetailGetTunjangan.Update();
        mdlPopupGetTunjangan.Show();
    }
    protected void gvwListTunjangan_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtCKodeTunjangan.Text = gvwListTunjangan.SelectedDataKey[0].ToString();
        txtTunjangan_Name.Text = gvwListTunjangan.SelectedDataKey[1].ToString();

        upnDetailGetTunjangan.Update();
        mdlPopupGetTunjangan.Hide();
    }
    protected void gvwListTunjangan_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListTunjangan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListTunjangan.PageIndex = e.NewPageIndex;
        BindGridPopUpTunjangan();
    }
    //------------------------- end Tunjangan ---------------------------------------------------------
    #endregion
}

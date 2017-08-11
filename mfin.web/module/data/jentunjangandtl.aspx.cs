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

public partial class module_data_jentunjangandtl : BasePage
{
    private static string _RoleCode = "B100151";
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
        reff_jenis_tunjanganDAL _dalreff_jenis_tunjanganDAL = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();

            _dalreff_jenis_tunjanganDAL = new reff_jenis_tunjanganDAL();
            _htParameters = new Hashtable();

            _htParameters["p_id"] = Request.Params["id"];
            DataTable _dt = _dalreff_jenis_tunjanganDAL.GetRow(_htParameters);
            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        reff_jenis_tunjanganDAL _dalreff_jenis_tunjanganDAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalreff_jenis_tunjanganDAL = new reff_jenis_tunjanganDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalreff_jenis_tunjanganDAL.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalreff_jenis_tunjanganDAL.Update(_htParameters);
                iNextID = Int32.Parse(lblid.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "jentunjangandtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("jentunjanganlst.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion
}

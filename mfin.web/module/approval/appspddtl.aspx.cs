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

public partial class module_approval_appspddtl : BasePage
{
    private static string _RoleCode = "B100097";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            TabName.Value = Request.Form[TabName.UniqueID];
            CheckRole(_RoleCode);            
           
            //if (Request.Params["action"].Equals("edt"))
                LoadData();
                LoadDataTask();
                LoadDataCost();               
        }
    }

    private void LoadData()
    {
        EmpSPDDAL _dalEmpSPDDAL = null;
        Hashtable _htParameters = null;

        try
        {           
            _dalEmpSPDDAL = new EmpSPDDAL();
            _htParameters = new Hashtable();

            if (Request.Params["action"] == "edt")
            {
                _htParameters["p_ID"] = Request.Params["id"];
                pnlshow.Visible = true;
                DataTable _dt = _dalEmpSPDDAL.GetRow(_htParameters);
                MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);

                MPF23.Shared.Mapper.DBToUI.Map(pnlBody1.Controls, _dt.Rows[0]);                

                LoadDataTask();
                LoadDataCost();
            }           
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }  

  

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("appspdlst.aspx");
    }       
    #endregion

    #region Task 
    private void LoadDataTask()
    {
        try
        {
            Shared.BindGrvEmpSPDTask(grvTask, txtSPD_No.Text);

        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }   
    #endregion

    #region Cost
    private void LoadDataCost()
    {
        try
        {
            Shared.BindGrvEmpSPDCost(grvCost, txtSPD_No.Text);

        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }
    #endregion
}

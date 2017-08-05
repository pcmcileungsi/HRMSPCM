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

public partial class module_master_setengahharidtl : BasePage
{
    private static string _RoleCode = "P000468";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            //Shared.BindDDLHRMSReligion(ddlEmployee_ReligionCode);
            //Shared.BindDDLHRMSBranch(ddlEmployee_BranchCode);
            //Shared.BindDDLHRMSDept(ddlEmployee_DeptCode);
            //Shared.BindDDLHRMSGrade(ddlEmployee_GradeCode);
            //Shared.BindDDLHRMSLeader(ddlEmployee_LeaderCode);
            //Shared.BindDDLHRMSUser(ddlUser_ID, Request.Params["id"]);
           
            //if (Request.Params["action"].Equals("edt"))
            //    LoadData();
        }
    }

    private void LoadData()
    {
        EmployeeDAL _dalEmployee = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();

            _dalEmployee = new EmployeeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_Employee_ID"] = Request.Params["id"];
            DataTable _dt = _dalEmployee.GetRow(_htParameters);
            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        EmployeeDAL _dalEmployee = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalEmployee = new EmployeeDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalEmployee.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalEmployee.Update(_htParameters);
                iNextID = Int32.Parse(lblEmployee_ID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "Employeedetail.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Employeelist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion
}

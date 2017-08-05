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
public partial class module_employee_empgradehistorydetail : BasePage
{
    private static string _RoleCode = "B100121";
    #region Awal
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            if (Request.Params["action"].Equals("edt"))
            {
                if (Request.Params["action"].ToString() != "")
                {
                    LoadData();
                }
                else
                {
                    txtEmployee_code.Text = Request.Params["emp_code"].ToString();
                    txtEmployee_Name.Text = Request.Params["emp_name"].ToString();
                }
               
            }
               
        }
    }

    private void LoadData()
    {
        EmpGradeHistoryDAL _dalEmpGradeHistoryDAL = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();

            _dalEmpGradeHistoryDAL = new EmpGradeHistoryDAL();
            _htParameters = new Hashtable();

            _htParameters["p_ID"] = Request.Params["id"];
            DataTable _dt = _dalEmpGradeHistoryDAL.GetRow(_htParameters);
            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
            imgBtnLookUpKaryawan.Enabled = false;
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        EmpGradeHistoryDAL _dalEmpGradeHistoryDAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalEmpGradeHistoryDAL = new EmpGradeHistoryDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalEmpGradeHistoryDAL.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalEmpGradeHistoryDAL.Update(_htParameters);
                iNextID = Int32.Parse(lblID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "empgradehistorydetail.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }
    #endregion

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("empgradehstlst.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion

    #region PopUpKaryawan
    private void BindGridPopUpKaryawan()
    {
        EmployeeDAL _dalEmployee = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmployee = new EmployeeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchKaryawan.Text;
            _htParameters["p_status"] = "1";
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            }
            gvwListKaryawan.DataSource = _dalEmployee.GetRows(_htParameters);
            gvwListKaryawan.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }
    protected void btnSearchKaryawan_Click(object sender, EventArgs e)
    {
        BindGridPopUpKaryawan();
    }
    protected void BtnLookUpKaryawan_Click(object sender, EventArgs e)
    {
        BindGridPopUpKaryawan();
        upnDetailGetKaryawan.Update();
        mdlPopupGetKaryawan.Show();
    }
    protected void gvwListKaryawan_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtEmployee_code.Text = gvwListKaryawan.SelectedDataKey[0].ToString();
        txtEmployee_Name.Text = gvwListKaryawan.SelectedDataKey[1].ToString();

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
        BindGridPopUpKaryawan();
    }
    #endregion

    #region PopUpGrade
    private void BindGridPopUpGrade()
    {
        LStblGradeDAL _dalGrade = null;
        Hashtable _htParameters = null;

        try
        {
            _dalGrade = new LStblGradeDAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchGrade.Text;
            gvwListGrade.DataSource = _dalGrade.GetRows(_htParameters);
            gvwListGrade.DataBind();
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }
    protected void btnSearchGrade_Click(object sender, EventArgs e)
    {
        BindGridPopUpGrade();
    }
    protected void BtnLookUpGrade_Click(object sender, EventArgs e)
    {
        BindGridPopUpGrade();
        upnDetailGetGrade.Update();
        mdlPopupGetGrade.Show();
    }
    protected void gvwListGrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtGradeCode.Text = gvwListGrade.SelectedDataKey[0].ToString();
        txtGradeName.Text = gvwListGrade.SelectedDataKey[1].ToString();

        updGradeInfo.Update();

        upnDetailGetGrade.Update();
        mdlPopupGetGrade.Hide();
    }
    protected void gvwListGrade_RowCreated(object sender, GridViewRowEventArgs e)
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
    protected void gvwListGrade_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwListGrade.PageIndex = e.NewPageIndex;
        BindGridPopUpGrade();
    }
    #endregion
}

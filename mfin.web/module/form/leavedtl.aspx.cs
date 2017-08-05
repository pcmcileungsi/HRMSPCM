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

public partial class module_master_leavedtl : BasePage
{
    //private static string _RoleCode = "P000468";
    private static string _RoleCode = "B100067";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            //Shared.BindDDLHRMSLeader(ddlEmployee_Code);
            //Shared.BindDDLHRMSReligion(ddlEmployee_ReligionCode);
            //Shared.BindDDLHRMSBranch(ddlEmployee_BranchCode);
            //Shared.BindDDLHRMSDept(ddlEmployee_DeptCode);
            //Shared.BindDDLHRMSGrade(ddlEmployee_GradeCode);
            //Shared.BindDDLHRMSLeader(ddlEmployee_LeaderCode);
            //Shared.BindDDLHRMSUser(ddlUser_ID, Request.Params["id"]);
           
            //if (Request.Params["action"].Equals("edt"))
                LoadData();
        }
    }

    private void LoadData()
    {
        EmpLeaveDAL _dalEmpLeaveDAL = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();
            //ddlEmployee_Code.SelectedValue = SessionKey.CURRENT_USER_HRMS_EMP_CODE.ToString();
            txtSubmissionDate.Text = Utility.CurrentDate;
            //GET ROLE Response.Write(Session[SessionKey.CURRENT_USER_HRMS_ROLE]);

            _dalEmpLeaveDAL = new EmpLeaveDAL();
            _htParameters = new Hashtable();

            if (Request.Params["action"] == "edt")
            {
                _htParameters["p_ID"] = Request.Params["id"];
                DataTable _dt = _dalEmpLeaveDAL.GetRow(_htParameters);
                MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
                if (ddlStatus.SelectedValue == "0")
                {
                    btnSave.Visible = true;
                }
                else
                {
                    btnSave.Visible = false;
                }
                if (txtTotDay.Text == "0.5")
                {
                    CheckHAlf.Checked = true;
                    HitungHari();
                }                
            }
            else
            {
                txtEmployee_code.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString().Trim();
                txtEmployee_Name.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_NAME].ToString().Trim();
            }
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        EmpLeaveDAL _dalEmpLeaveDAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalEmpLeaveDAL = new EmpLeaveDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);


            if (Request.Params["action"] == "edt")
            {
                _dalEmpLeaveDAL.Update(_htParameters);
                iNextID = Int32.Parse(lbl_ID.Text);
            }
            else
            {
                _dalEmpLeaveDAL.Insert(_htParameters, ref iNextID);
            }
           
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "leavedtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("leavelst.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion

    #region Hari
    public static double GetEfektifDays(DateTime startD, DateTime endD)
    {
        double calcBusinessDays =
            1 + ((endD - startD).TotalDays * 5 -
            (startD.DayOfWeek - endD.DayOfWeek) * 2) / 7;

        if (endD.DayOfWeek == DayOfWeek.Saturday) calcBusinessDays--;
        if (startD.DayOfWeek == DayOfWeek.Sunday) calcBusinessDays--;

        return calcBusinessDays;
    }

    protected void txtStartDate_TextChanged(object sender, EventArgs e)
    {
        HitungHari();
    }

    protected void txtEndDate_TextChanged(object sender, EventArgs e)
    {
        HitungHari();
    }

    private void HitungHari()
    {
        try
        {
            if (txtStartDate.Text != "" && txtEndDate.Text != "")
            {
                DateTime a = Utility.ToDateTime(txtStartDate.Text);
                DateTime b = Utility.ToDateTime(txtEndDate.Text);
                txtTotDay.Text = GetEfektifDays(a, b).ToString();
                if(txtTotDay.Text=="1")
                {
                    CheckHAlf.Visible = true;
                    lblHalf.Visible = true;
                    ddlHalfType.Visible = true;
                    Check_Half_Day();
                }
                else
                {
                    CheckHAlf.Visible = false;
                    CheckHAlf.Checked = false;
                    lblHalf.Visible = false;
                    ddlHalfType.Visible = false;
                }
            } 
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void Check_Half_Day()
    {
        if (CheckHAlf.Checked == true)
        {
            txtTotDay.Text = "0.5";
        }
        else
        {
            txtTotDay.Text = "1";
            ddlHalfType.SelectedValue = "0";
        }
    }

    protected void CheckHAlf_CheckedChanged(Object sender, EventArgs args)
    {
        Check_Half_Day();
    }
    #endregion

    #region PopUpKaryawan
    //asfor Karyawan
    private void BindGridPopUpKaryawan()
    {
        EmpLeaveBalance _dalEmpLeaveBalance = null;
        Hashtable _htParameters = null;

        try
        {
            _dalEmpLeaveBalance = new EmpLeaveBalance();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchKaryawan.Text;
            _htParameters["p_status"] = "1";
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_Employee_Code"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            }
            gvwListKaryawan.DataSource = _dalEmpLeaveBalance.GetRowsBalanceByEmployee(_htParameters);
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
}

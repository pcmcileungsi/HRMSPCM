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

public partial class module_approval_appleavedtl : BasePage
{
    private static string _RoleCode = "B100091";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            LoadData();
        }
    }

    private void LoadData()
    {
        EmpLeaveDAL _dalEmpLeaveDAL = null;
        Hashtable _htParameters = null;

        try
        {           
            _dalEmpLeaveDAL = new EmpLeaveDAL();
            _htParameters = new Hashtable();

            if (Request.Params["action"] == "edt")
            {
                _htParameters["p_ID"] = Request.Params["id"];
                DataTable _dt = _dalEmpLeaveDAL.GetRow(_htParameters);
                MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
                if (txtTotDay.Text == "0.5")
                {
                    CheckHAlf.Checked = true;
                    HitungHari();
                }                
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
        Response.Redirect("appleavelst.aspx");
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
    #endregion  
}

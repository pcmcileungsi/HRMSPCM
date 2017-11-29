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

public partial class module_transaksi_cutidtl : BasePage
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
        HR_CUTI_PEGAWAI_DAL _dalHR_CUTI_PEGAWAI_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();
            //ddlEmployee_Code.SelectedValue = SessionKey.CURRENT_USER_HRMS_EMP_CODE.ToString();
            txtSubmissionDate.Text = Utility.CurrentDate;
            //GET ROLE Response.Write(Session[SessionKey.CURRENT_USER_HRMS_ROLE]);

            _dalHR_CUTI_PEGAWAI_DAL = new HR_CUTI_PEGAWAI_DAL();
            _htParameters = new Hashtable();

            if (Request.Params["action"] == "edt")
            {
                _htParameters["p_ID"] = Request.Params["id"];
                DataTable _dt = _dalHR_CUTI_PEGAWAI_DAL.GetRow(_htParameters);
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
                txtNIK.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString().Trim();
                txtNama.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_NAME].ToString().Trim();
            }
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    protected string conversiDate(string tgl) 
    {
        string result = "";
        string[] dt = null;

        dt = tgl.Split('/');
        tgl = dt[1] + "-" + dt[0] + "-" + dt[2]; //24/07/2017

        if (tgl != "01.01.0100")
            result = string.Format("{0:yyyy-MM-dd}", DateTime.Parse(tgl));
        return result;
    }

    private void SaveData()
    {
        HR_CUTI_PEGAWAI_DAL _dalHR_CUTI_PEGAWAI_DAL = null;
        HR_ABSENSI_DAL _dalHR_ABSENSI = null;
        Hashtable _htParameters = null;      
        Hashtable _htParameters3 = null;
        int iNextID = 0;

        try
        {
            _dalHR_CUTI_PEGAWAI_DAL = new HR_CUTI_PEGAWAI_DAL();
            _htParameters = new Hashtable();

            _dalHR_ABSENSI = new HR_ABSENSI_DAL();
            _htParameters3 = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters); 
            
            if (Request.Params["action"] == "edt")
            {
                _dalHR_CUTI_PEGAWAI_DAL.Update(_htParameters);
                iNextID = Int32.Parse(lbl_ID.Text);

                for (int i = 0; i < Convert.ToInt16(txtTotDay.Text); i++)
                {
                    //Parameter Insert
                    _htParameters3["p_NIK"] = txtNIK.Text;
                    _htParameters3["p_TANGGAL_ABSEN"] = Convert.ToDateTime(conversiDate(txtStartDate.Text)).AddDays(i);
                    _htParameters3["p_IN_TIME"] = "07:00";
                    _htParameters3["p_OUT_TIME"] = "15:00";
                    _htParameters3["p_ATTEND_TIME"] = "";
                    _htParameters3["p_LEAVE_TIME"] = "";
                    _htParameters3["p_KODE_JENIS_SHIFT"] = "1";
                    _htParameters3["p_ABNORMAL"] = "Absence";
                    _htParameters3["p_WORK_TIME"] = 0;
                    _htParameters3["p_Keterangan"] = "Cuti";
                    Utility.ApplyDefaultProp(_htParameters3);

                    _dalHR_ABSENSI.DeleteInsertAbsen(_htParameters3);
                }                
            }
            else
            {
                _dalHR_CUTI_PEGAWAI_DAL.Insert(_htParameters, ref iNextID);

                if (txtStartDate.Text == txtEndDate.Text)
                {                    
                    //Parameter Insert
                    _htParameters3["p_NIK"] = txtNIK.Text;
                    _htParameters3["p_TANGGAL_ABSEN"] = conversiDate(txtStartDate.Text);
                    _htParameters3["p_IN_TIME"] = "07:00";
                    _htParameters3["p_OUT_TIME"] = "15:00";
                    _htParameters3["p_ATTEND_TIME"] = "";
                    _htParameters3["p_LEAVE_TIME"] = "";
                    _htParameters3["p_KODE_JENIS_SHIFT"] = "1";
                    _htParameters3["p_ABNORMAL"] = "Absence";
                    _htParameters3["p_WORK_TIME"] = 0;
                    _htParameters3["p_Keterangan"] = "Cuti";
                    Utility.ApplyDefaultProp(_htParameters3);

                    _dalHR_ABSENSI.Insert(_htParameters3);
                }
                else
                {
                    for (int i = 0; i < Convert.ToInt16(txtTotDay.Text); i++)
                    {
                        //Parameter Insert
                        _htParameters3["p_NIK"] = txtNIK.Text;
                        _htParameters3["p_TANGGAL_ABSEN"] = Convert.ToDateTime(conversiDate(txtStartDate.Text)).AddDays(i);
                        _htParameters3["p_IN_TIME"] = "07:00";
                        _htParameters3["p_OUT_TIME"] = "15:00";
                        _htParameters3["p_ATTEND_TIME"] = "";
                        _htParameters3["p_LEAVE_TIME"] = "";
                        _htParameters3["p_KODE_JENIS_SHIFT"] = "1";
                        _htParameters3["p_ABNORMAL"] = "Absence";
                        _htParameters3["p_WORK_TIME"] = 0;
                        _htParameters3["p_Keterangan"] = "Cuti";
                        Utility.ApplyDefaultProp(_htParameters3);

                        _dalHR_ABSENSI.Insert(_htParameters3);
                    }

                }
            }
           
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "cutidtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("cutilist.aspx");
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
        HR_CUTI_KUOTA_DAL _dalHR_CUTI_KUOTA_DAL = null;
        Hashtable _htParameters = null;

        try
        {
            _dalHR_CUTI_KUOTA_DAL = new HR_CUTI_KUOTA_DAL();
            _htParameters = new Hashtable();

            _htParameters["p_keywords"] = txtSearchKaryawan.Text;
            _htParameters["p_status"] = "1";
            if (Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString() == "1")
            {
                _htParameters["p_NIK"] = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString();
            }
            gvwListKaryawan.DataSource = _dalHR_CUTI_KUOTA_DAL.GetRowsBalanceByEmployee(_htParameters);
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
        txtNama.Text = gvwListKaryawan.SelectedDataKey[1].ToString();

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

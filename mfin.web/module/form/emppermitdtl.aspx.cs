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

public partial class module_master_emppermitdtl : BasePage
{
    //private static string _RoleCode = "P000468";
    private static string _RoleCode = "B100061";
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadInit();

        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            //Shared.BindDDLHRMSLeader(ddlEmployee_Code);
           
           // if (Request.Params["action"].Equals("edt"))
               LoadData();
        }
    }

    private void LoadData()
    {
        EmpPermitDAL _dalEmpPermitDAL = null;
        Hashtable _htParameters = null;

        try
        {
            //System.Diagnostics.Debugger.Break();

            _dalEmpPermitDAL = new EmpPermitDAL();
            _htParameters = new Hashtable();

            //Utility.CurrentUID
            //ddlEmployee_Code.SelectedValue = "anas";
            string abcd = SessionKey.CURRENT_USER_HRMS_EMP_CODE.ToString();
            //ddlEmployee_Code.SelectedValue = SessionKey.CURRENT_USER_HRMS_EMP_CODE.ToString();
            txtSubmissionDate.Text=Utility.CurrentDate;
            if (Request.Params["action"] == "edt")
            {
                _htParameters["p_ID"] = Request.Params["id"];
                DataTable _dt = _dalEmpPermitDAL.GetRow(_htParameters);
                MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
                
                if (ddlStatus.SelectedValue == "0")
                {
                    btnSave.Visible = true;
                    //btnSend.Visible = true;
                }
                else
                {
                    btnSave.Visible = false;
                    //btnSend.Visible = false;
                }
            }
            else
            {
                txtEmployee_code.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_CODE].ToString().Trim();
                txtEmployee_Name.Text = Session[SessionKey.CURRENT_USER_HRMS_EMP_NAME].ToString().Trim();
            }

            string abc = Session[SessionKey.CURRENT_USER_HRMS_ROLE].ToString();
            if (abc == "1")
            {
                ddlStatus.Enabled = false;
                //ddlEmployee_Code.Enabled = false;
            }
           
            //for (int i = 0; i < Session.Count; i++)
            //{
            //    var crntSession = Session.Keys[i];
            //    Response.Write(string.Concat(crntSession, "=", Session[crntSession]) + "<br />");
            //}
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        EmpPermitDAL _dalEmpPermitDAL = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalEmpPermitDAL = new EmpPermitDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);


            if (Request.Params["action"] == "edt")
            {
                _dalEmpPermitDAL.Update(_htParameters);
                iNextID = Int32.Parse(lblID.Text);
            }
            else
            {
                _dalEmpPermitDAL.Insert(_htParameters, ref iNextID);
            }

            //Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "");
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "Emppermitdtl.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmpPermitlst.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }

    //protected void btnSend_Click(object sender, EventArgs e)
    //{
    //   //Sending Email Code
    //}
    #endregion

    #region PopUpKaryawan
    //asfor Karyawan
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
        //Shared.BindKaryawan(txtSearchKaryawan.Text, gvwListKaryawan);
        BindGridPopUpKaryawan();
    }
    #endregion
}

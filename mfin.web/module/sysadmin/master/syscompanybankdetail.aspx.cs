﻿using System;
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

public partial class module_sysadmin_master_syscompanybankdetail : BasePage
{
    private static string _RoleCode = "";
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
        SysCompanybankDAL _dalSysCompanybank = null;
        Hashtable _htParameters = null;

        try
        {
            _dalSysCompanybank = new SysCompanybankDAL();
            _htParameters = new Hashtable();

            _htParameters["p_sys_companybankid"] = Request.Params["id"];
            DataTable _dt = _dalSysCompanybank.GetRow(_htParameters);

            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void SaveData()
    {
        SysCompanybankDAL _dalSysCompanybank = null;
        Hashtable _htParameters = null;
        int iNextID = 0;

        try
        {
            _dalSysCompanybank = new SysCompanybankDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (Request.Params["action"] == "add")
            {
                _dalSysCompanybank.Insert(_htParameters, ref iNextID);
            }
            else
            {
                _dalSysCompanybank.Update(_htParameters);
                iNextID = Int32.Parse(lblSYSCOMPANYBANKID.Text);
            }

            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "syscompanybankdetail.aspx?action=edt&id=" + iNextID.ToString());
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("syscompanybanklist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveData();
    }
    #endregion
}

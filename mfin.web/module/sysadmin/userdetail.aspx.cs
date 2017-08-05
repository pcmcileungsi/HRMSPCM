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
using MFin.DataAccessLayer.Security;

public partial class module_sysadmin_userdetail : BasePage
{
    //private static string _RoleCode = "P000476";
    private static string _RoleCode = "B100001";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CheckRole(_RoleCode);
            if (Request.Params["action"]=="edt")
            {
                LoadData();
                BindData();
                txtUSER_ID.Enabled = false;
            }
        }
    }
    private void SaveData()
    {
        MasterUserDAL _dalMasterUser = null;
        SysJobAccessDAL _dalJobAccess = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMasterUser = new MasterUserDAL();
            _htParameters = new Hashtable();

            MPF23.Shared.Mapper.UIToDB.Map(pnlBody.Controls, _htParameters);
            Utility.ApplyDefaultProp(_htParameters);

            if (chkIsActive.Checked == true)
            {
                _htParameters["p_is_active_flag"] = "1";
            }
            else _htParameters["p_is_active_flag"] = "0";

            if (Request.Params["action"] == "add")
            {
                _dalMasterUser.Insert(_htParameters);
            }
            else
            {
                _htParameters["p_user_id"] = Request.Params["id"];
                _htParameters["p_user_id_baru"] = txtUSER_ID.Text;
                _dalMasterUser.UpdateLoginInfo(_htParameters);
                
                
            }
            _dalJobAccess = new SysJobAccessDAL();
            


            Utility.ShowMessageBox(this, Utility.SAVE_DATA_SUCCESS_MESSAGE, null, "userdetail.aspx?action=edt&id=" + txtUSER_ID.Text);
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.SAVE_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void LoadData()
    {
        MasterUserDAL _dalMasterUser = null;
        Hashtable _htParameters = null;

        try
        {
            _dalMasterUser = new MasterUserDAL();
            _htParameters = new Hashtable();

            _htParameters["p_user_id"] = Request.Params["id"];
            DataTable _dt = _dalMasterUser.GetRow(_htParameters);

            MPF23.Shared.Mapper.DBToUI.Map(pnlBody.Controls, _dt.Rows[0]);
            if(_dt.Rows[0]["IS_ACTIVE_FLAG"].ToString()=="1")
            {
                chkIsActive.Checked = true;
            }
        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
        }
    }

    private void BindData()
    {
        MasterUserCompanyGroupDAL _dal = null;
        Hashtable _htParameters = null;
        DataTable _dt = null;


        //string sRetValue = "";

        try
        {
            //System.Diagnostics.Debugger.Break();
            _dal = new MasterUserCompanyGroupDAL();
            _htParameters = new Hashtable();

            _htParameters["p_user_id"] = Request.Params["id"];
            _htParameters["p_keywords"] = "";

            _dt = _dal.GetRows(_htParameters);
            
            gvwList.DataSource = _dt;
            gvwList.DataBind();

        }
        catch (Exception ex)
        {
            Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null, null);
        }
    }
    

    #region Toolbar
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("userlist.aspx");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //System.Diagnostics.Debugger.Break();
        SaveData();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("userroledetail.aspx?action=add&userid="+txtUSER_ID.Text);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindData();
    }
    #endregion

    #region gridview

    protected void gvwList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":
                Response.Redirect("userroledetail.aspx?action=edt&id=" + e.CommandArgument+"&userid="+txtUSER_ID.Text);
                break;
            case "Delete":
                SysUserDAL _dalsysuser = null;
                Hashtable _htParameters = null;

                try
                {
                    _dalsysuser = new SysUserDAL();
                    _htParameters = new Hashtable();

                    _htParameters["p_sys_userid"] = e.CommandArgument.ToString();

                    _dalsysuser.Delete(_htParameters);
                    this.BindData();
                    Response.Redirect("userdetail.aspx?action=edt&id="+Request.Params["id"]);

                }
                catch (Exception ex)
                {
                    Utility.ShowMessageBox(this, Utility.LOAD_DATA_FAIL_MESSAGE, ex, null);
                }
                break;
        }
    }

    protected void gvwList_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Enter value of id each row to button's command argument
            ImageButton _btn = (ImageButton)e.Row.FindControl("btnEdit");
            _btn.CommandArgument = gvwList.DataKeys[e.Row.RowIndex][1].ToString();
            _btn = (ImageButton)e.Row.FindControl("btnDelete");
            _btn.CommandArgument = gvwList.DataKeys[e.Row.RowIndex][1].ToString();
            
            e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#B0C4DE';this.style.cursor='hand'");

            if (e.Row.RowState == DataControlRowState.Alternate)
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#FFFFFF';");
            else
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#F7F6F3';");
        }
    }
    
    protected void gvwList_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void gvwList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvwList.PageIndex = e.NewPageIndex;
        BindData();
        //BindTblDocument();
    }

    #endregion
}
